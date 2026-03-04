import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:pos_app/core/network/api_endpoints.dart';

class ConnectivityService {
  final Connectivity _connectivity;
  final Dio _dio;
  
  final StreamController<bool> _connectionController = StreamController<bool>.broadcast();
  bool _isOnline = false;

  ConnectivityService(this._connectivity, this._dio){
    _init();
    /*Timer.periodic(Duration(seconds: 10), (_) async {
     final status = await isOnline();
      _connectionController.add(status);
    });*/
  }

  void _init(){
    _connectivity.onConnectivityChanged.listen((_) async {
      final status = await _checkBackend();
      _updateStatus(status);
    });
  }

  Stream<bool> get connectionStream => _connectionController.stream;

  bool get currentStatus => _isOnline;

  Future<bool> isOnline() async {
    final status = await _checkBackend();
    _updateStatus(status);
    return status;
  }

  Future<bool> _checkBackend() async {
    final result = await _connectivity.checkConnectivity();

    if(result == ConnectivityResult.none){
      return false;
    }

    try{
      final response = await _dio.get(
        ApiEndpoints.health,
        options : Options(
          sendTimeout: const Duration(seconds: 2),
          receiveTimeout: const Duration(seconds: 2),
        )
      );

      return response.statusCode == 200;
    } catch (_) {
      return false;
    }
  }

  void _updateStatus(bool status) {
   if(_isOnline != status){
    _isOnline = status;
    _connectionController.add(status);
   }
  }

  void dispose() {
    _connectionController.close();
  }

}