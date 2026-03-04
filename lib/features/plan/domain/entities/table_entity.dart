
enum TableShape{ square, round}

class RestaurantTable{
  final String id;
  final String name;
  final double x;
  final double y;
  final int seats;
  final String status;
  final double roration;
  final TableShape shape;
  final bool isSelected;

  RestaurantTable({
    required this.id,
    required this.name,
    required this.x,
    required this.y,
    required this.seats,
    required this.status,
    this.roration = 0,
    this.shape = TableShape.square,
    this.isSelected = false,
  });

  RestaurantTable copyWith({
    String? name,
    double? x,
    double? y,
    int? seats,
    String? status,
    double? roration,
    TableShape? shape,
    bool? isSelected,
  }){
    return RestaurantTable(
      id: id, 
      name: name ?? this.name, 
      x: x ?? this.x,
      y: y ?? this.y,
      seats: seats ?? this.seats,
      status: status ?? this.status, 
      roration: roration ?? this.roration,
      shape: shape ?? this.shape,
      isSelected: isSelected ?? this.isSelected,
      );
  }
}