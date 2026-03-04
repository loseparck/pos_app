import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/plan/data/repositories/plan_group_provider.dart';
import 'package:pos_app/features/plan/domain/entities/table_entity.dart';

class DraggableTable extends ConsumerWidget{
  final RestaurantTable table;
  final bool editMode;

  const DraggableTable({super.key, required this.table, required this.editMode});

  static const double tableSize = 80;
  static const double gridSize = 40;

  double snap(double value){
    return (value / gridSize).round() * gridSize;
  }

  Color _getColor(String status){
    switch(status){
      case "occupied":
        return Colors.red;
      case "reserved":
        return Colors.blue;
      default:
        return Colors.green;
    }
  }
  
  //Offset? _lastPointerPosition;
  
   @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifer = ref.read(planGroupProvider.notifier);
    
    final tableWidget = table.shape == TableShape.round
      ? roundShape()
      : squareShape();

    if(!editMode){
      return Positioned(
        left: table.x,
        top: table.y,
        child: GestureDetector(
          child: Transform.rotate(
            angle: table.roration,
            child: tableWidget,
          ) ,
        ),
      );
    }
    
    return  Positioned(
      left: table.x,
      top: table.y,
      child: GestureDetector(
        onTap: () {notifer.selectTable(table.id);},
        onPanStart: (details) {
          // _lastPointerPosition = details.globalPosition;
        },
        onPanUpdate: (details){
          //final currentPosition = details.globalPosition;
          
          //final delta = currentPosition - _lastPointerPosition!;
        // _lastPointerPosition = currentPosition;

          final newX = table.x + details.delta.dx*8;
          final newY = table.y + details.delta.dy*8;
          notifer.updateTablePosition(
            table.id,
            newX, 
            newY,
          );
        },
        onLongPress: () => _showEditDialog(context, ref),
        child: Transform.rotate(
          angle: table.roration,
          child: tableWidget,
        ) ,
      ),
    );
  }

  Widget roundShape(){
    return Container(
      width: tableSize,
      height: tableSize,
      decoration: BoxDecoration(
        
        color: _getColor(table.status),
        shape: BoxShape.circle,
        border: Border.all(
          color: table.isSelected 
          ? Colors.yellow
          : Colors.transparent,
          width: 3,
        ),
      ),
      alignment: Alignment.center,
      child: _tableContent(),
    );
  }

  Widget squareShape(){
    return Container(
      width: tableSize,
      height: tableSize,
      decoration: BoxDecoration(
        color: _getColor(table.status),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: table.isSelected 
          ? Colors.yellow
          : Colors.transparent,
          width: 3,
        )
      ),
      alignment: Alignment.center,
      child: _tableContent(),
    );
  }

  Widget _tableContent(){
    return Stack(
      children: [
        Positioned.fill(
            child: Center(
              child: Icon(
                size: 40,
                Icons.chair,
                color: Colors.black.withValues(alpha: 0.5),
              ),
            ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              table.name,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )
            ),
            Text(
              "${table.seats} places",
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 12,
              )
            ),
          ],
        )
      ]
    );
  }

   void _showEditDialog(
    BuildContext context,
    WidgetRef ref
  ) {
    final notifier = ref.read(planGroupProvider.notifier);

    final nameController = TextEditingController(text: table.name);
    final seatsController = TextEditingController(text: table.seats.toString());

    showDialog(
      context: context,
       builder: (_) => AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Modifier Table"),
            IconButton(
              style: ElevatedButton.styleFrom(backgroundColor:  Colors.red.shade200),
              icon: const Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
            ),
            TextField(
              controller: seatsController,
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              notifier.rotateTable(table.id);
            }, 
            child: const Text("Pivoter"),
          ),
          TextButton(
            onPressed: () {
              notifier.toggleShape(table.id);
            }, 
            child: const Text("Changer form"),
          ),
          TextButton(
            onPressed: () {
              notifier.removeTable(table.id);
              Navigator.pop(context);
            }, 
            child: const Text(
              "Supprimer",
              style: TextStyle(color: Colors.red)
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor:  Colors.green),
            onPressed: () {
              notifier.renameTable(table.id, nameController.text, int.tryParse(seatsController.text.trim()) ?? table.seats);
              Navigator.pop(context);
            }, 
            child: const Text("Valider"),
          ),
        ],
       )
    );
  }
}