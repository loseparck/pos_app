class Plan {
  final String id;
  final String name;
  final bool delivery;
  final int? color;
  final bool active;
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
    this.delivery = false,
    this.color,
    this.active = true
  }){
    if (name.trim().isEmpty) {
      throw ArgumentError('Le nom ne peut pas être vide.','name');
    }
  }

  bool get isActive => active;
  bool get isDelivery => delivery;

  Plan copyWith({
    String? id,
    String? name,
    bool? active,
    int? color,
    bool? delivery,
    String? createdById,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
    bool resetColor = false,
  }){
    return Plan(
      id: id ?? this.id,
      name: name ?? this.name, 
      active: active ?? this.active, 
      color: resetColor ? null : color ?? this.color,
      delivery: delivery ?? this.delivery, 
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
      color: json['color'] as int?,
      active: json['active'] ?? true,
      delivery: json['delivery'] ?? false,
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
      'color': color,
      'active': active,
      'delivery': delivery,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'deletedAt': deletedAt?.toIso8601String(),
      'createdById': createdById,
    };
  }
}