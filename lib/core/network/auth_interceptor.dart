import 'package:dio/dio.dart';

import '../../features/authentication/domain/repositories/token_repository.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor({
    required TokenRepository tokenRepository,
    required Dio dio,
    required Future<void> Function()? onSessionExpired,
    required Future<void> Function()? onSessionRefreshed,
  })  : _tokenRepository = tokenRepository,
        _dio = dio,
        _onSessionExpired = onSessionExpired,
        _onSessionRefreshed = onSessionRefreshed;

  final TokenRepository _tokenRepository;
  final Dio _dio;
  final Future<void> Function()? _onSessionExpired;
  final Future<void> Function()? _onSessionRefreshed;

  bool _isRefreshing = false;
  final List<_PendingRequest> _pendingRequests = [];

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken = await _tokenRepository.getAccessToken();

    if (accessToken != null && accessToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    final tenantId = await _tokenRepository.getTenantId();

    if (tenantId != null && tenantId.isNotEmpty) {
      options.headers['x-tenant-id'] = tenantId;
    }

    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final statusCode = err.response?.statusCode;
    final requestOptions = err.requestOptions;

    final isRefreshCall = requestOptions.path.contains('/auth/refresh');
    final shouldTryRefresh = statusCode == 401 && !isRefreshCall;

    if (!shouldTryRefresh) {
      print("onError handle out");
      handler.next(err);
      return;
    }

    if (_isRefreshing) {
      _pendingRequests.add(
        _PendingRequest(
          requestOptions: requestOptions,
          handler: handler,
        ),
      );
      return;
    }

    _isRefreshing = true;

    try {
      final refreshToken = await _tokenRepository.getRefreshToken();

      if (refreshToken == null || refreshToken.isEmpty) {
        print("refreshToken null or empty $refreshToken");
        await _expireSession(handler, err);
        return;
      }

      final refreshResponse = await _dio.post(
        '/auth/refresh',
        data: {
          'refreshToken': refreshToken,
        },
        options: Options(
          headers: {
            'Authorization': null,
          },
        ),
      );

      final data = refreshResponse.data as Map<String, dynamic>;
      final newAccessToken = data['accessToken'] as String?;
      final newRefreshToken = data['refreshToken'] as String?;

      if (newAccessToken == null || newAccessToken.isEmpty) {
        print("newAccessToken null or empty $newAccessToken");
        await _expireSession(handler, err);
        return;
      }

      await _tokenRepository.saveAccessToken(newAccessToken);

      if (newRefreshToken != null && newRefreshToken.isNotEmpty) {
        print("newAccessToken !null and !empty $newRefreshToken");
        await _tokenRepository.saveRefreshToken(newRefreshToken);
      }

      if (_onSessionRefreshed != null) {
        await _onSessionRefreshed!.call();
      }

      final retryResponse = await _retryRequest(
        requestOptions,
        newAccessToken,
      );
      print("retryResponse $retryResponse");
      handler.resolve(retryResponse);

      await _resolvePendingRequests(newAccessToken);
    } catch (_) {
      print("error $_");
      await _rejectPendingRequests(err);
      await _expireSession(handler, err);
    } finally {
      _isRefreshing = false;
    }
  }

  Future<Response<dynamic>> _retryRequest(
    RequestOptions requestOptions,
    String accessToken,
  ) {
    final options = Options(
      method: requestOptions.method,
      headers: {
        ...requestOptions.headers,
        'Authorization': 'Bearer $accessToken',
      },
      responseType: requestOptions.responseType,
      contentType: requestOptions.contentType,
      sendTimeout: requestOptions.sendTimeout,
      receiveTimeout: requestOptions.receiveTimeout,
      extra: requestOptions.extra,
      followRedirects: requestOptions.followRedirects,
      listFormat: requestOptions.listFormat,
      maxRedirects: requestOptions.maxRedirects,
      persistentConnection: requestOptions.persistentConnection,
      receiveDataWhenStatusError: requestOptions.receiveDataWhenStatusError,
      requestEncoder: requestOptions.requestEncoder,
      responseDecoder: requestOptions.responseDecoder,
      validateStatus: requestOptions.validateStatus,
    );

    return _dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
      cancelToken: requestOptions.cancelToken,
      onReceiveProgress: requestOptions.onReceiveProgress,
      onSendProgress: requestOptions.onSendProgress,
    );
  }

  Future<void> _resolvePendingRequests(String accessToken) async {
    for (final pending in _pendingRequests) {
      try {
        final response = await _retryRequest(
          pending.requestOptions,
          accessToken,
        );
        print("response $response");
        pending.handler.resolve(response);
      } catch (e) {
        print("_resolvePendingRequests error $e");
        if (e is DioException) {
          pending.handler.next(e);
        } else {
          pending.handler.next(
            DioException(
              requestOptions: pending.requestOptions,
              error: e,
            ),
          );
        }
      }
    }
    _pendingRequests.clear();
  }

  Future<void> _rejectPendingRequests(DioException err) async {
    for (final pending in _pendingRequests) {
      pending.handler.next(err);
    }
    _pendingRequests.clear();
  }

  Future<void> _expireSession(
    ErrorInterceptorHandler handler,
    DioException err,
  ) async {
    await _tokenRepository.clearTokens();

    if (_onSessionExpired != null) {
      await _onSessionExpired!.call();
    }

    handler.next(err);
  }
}

class _PendingRequest {
  _PendingRequest({
    required this.requestOptions,
    required this.handler,
  });

  final RequestOptions requestOptions;
  final ErrorInterceptorHandler handler;
}