class Plan {
  final String id;
  final String name;
  final String? createdById;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;

  Plan({
    required this.id,
    required this.name,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.createdById,
  });

  Plan copyWith({
    String? id,
    String? name,
    String? createdById,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  }){
    return Plan(
      id: id ?? this.id,
      name: name ?? this.name, 
      createdById: createdById ?? this.createdById, 
      createdAt: createdAt ?? this.createdAt, 
      updatedAt: updatedAt ?? this.updatedAt, 
      deletedAt: deletedAt ?? this.deletedAt, 
    );
  }

  @override
  String toString() {
    return toJson().toString();
  }

  factory Plan.fromJson(Map<String, dynamic> json){
    return Plan(
      id: json['id'] as String,
      name: json['name'] as String,
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      deletedAt: json['deletedAt'] != null ? DateTime.parse(json['deletedAt']) : null,
      createdById: json['createdById'] as String?,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'name': name,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'deletedAt': deletedAt?.toIso8601String(),
      'createdById': createdById,
    };
  }
}