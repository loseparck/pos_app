class SyncTask {
  final String id;
  final String endpoint;
  final Map<String, dynamic> payload;
  final String method;

  SyncTask({
    required this.id,
    required this.endpoint,
    required this.payload,
    required this.method,
  });

  Map<String, dynamic> toJson() => {
    "id": id,
    "endpoint": endpoint,
    "payload": payload,
    "method": method,
  };

  factory SyncTask.fromJson(Map<String, dynamic> json) {
    return SyncTask(
      id: json["id"], 
      endpoint: json["endpoint"], 
      payload: Map<String, dynamic>.from(json["payload"]), 
      method: json["method"],
      );
  }
}