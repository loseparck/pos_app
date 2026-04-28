class SyncTask {
  final String id;
  final String endpoint;
  final String payload;
  final String method;
  final DateTime createdAt;
  final int attempts;

  SyncTask({
    required this.id,
    required this.endpoint,
    required this.payload,
    required this.method,
    required this.createdAt,
    this.attempts = 0,
  });

  Map<String, dynamic> toJson() => {
    "id": id,
    "endpoint": endpoint,
    "payload": payload,
    "method": method,
    "createdAt": createdAt,
    "attempts": attempts,
  };

  factory SyncTask.fromJson(Map<String, dynamic> json) {
    return SyncTask(
      id: json["id"], 
      endpoint: json["endpoint"], 
      payload: json["payload"], 
      method: json["method"],
      createdAt: DateTime.parse(json["createdAt"]),
      attempts: json["attempts"],
      );
  }
}