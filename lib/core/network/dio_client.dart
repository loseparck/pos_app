import 'package:dio/dio.dart';
import 'package:pos_app/core/network/api_endpoints.dart';
import 'package:pos_app/core/network/interceptors.dart';

class DioClient {
  late final Dio dio;
  
  DioClient(TokenProvider tokenProvider){
    dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          "Content-Type": "application/json",
        }
      )
    );

    dio.interceptors.addAll([
      AuthInterceptor(tokenProvider, dio),
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      )
    ]);
  }
}