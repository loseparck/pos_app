import 'package:dio/dio.dart';
import 'package:pos_app/core/network/api_endpoints.dart';

abstract class TokenProvider{
  Future<String?> getToken();
  Future<void> saveToken(String token);
  Future<void> clear();
}

class AuthInterceptor extends Interceptor{
  final TokenProvider tokenProvider;
  final Dio dio;

  AuthInterceptor(this.tokenProvider, this.dio);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async{
    final token = await tokenProvider.getToken();

    if(token != null){
      options.headers["Authorisation"] = "Bearer $token";
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if(err.response?.statusCode == 401 &&  err.requestOptions.path != ApiEndpoints.login){
      try{
        final refreshResponse = await dio.post(ApiEndpoints.refresh);
        final newToken = refreshResponse.data["token"];

        await tokenProvider.saveToken(newToken);

        final requestOptions = err.requestOptions;

        requestOptions.headers["Authorisation"] = "Bearer $newToken";

        final retryResponse = await dio.fetch(requestOptions);
        handler.resolve(retryResponse);
      } catch (_) {
        await tokenProvider.clear();
      }
    }

    handler.next(err);
  }
  
}