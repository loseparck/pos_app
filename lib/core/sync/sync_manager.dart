import 'package:dio/dio.dart';
import 'package:pos_app/core/network/connectivity_service.dart';
import 'package:pos_app/core/sync/sync_queue.dart';

class SyncManager {
  final SyncQueue queue;
  final ConnectivityService connectivity;
  final Dio dio;

  bool _isSyncing = false;

  SyncManager(this.queue, this.connectivity, this.dio){
    connectivity.connectionStream.listen((isOnline){
      if(isOnline) {
        syncAll();
      }
    });
  }

  Future<void> syncAll() async{
    if(_isSyncing) return;
    _isSyncing = true;

    final tasks = await queue.getAll();

    for(final task in tasks){
      try{
        await dio.request(
          task.endpoint,
          data: task.payload,
          options: Options(method: task.method),
        );

        await queue.remove(task.id);
      } catch (_) {
        break;
      }
    }

    _isSyncing = false;
  }
}