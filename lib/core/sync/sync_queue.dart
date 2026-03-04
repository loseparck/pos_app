import 'package:pos_app/core/sync/sync_task.dart';

class SyncQueue {
  final List<SyncTask> _queue = [];

  Future<void> add(SyncTask task) async {
    _queue.add(task);
  }

  Future<void> remove(String id) async {
    _queue.removeWhere((t) => t.id == id);
  }

  Future<List<SyncTask>> getAll() async {
    return List.from(_queue);
  }
}