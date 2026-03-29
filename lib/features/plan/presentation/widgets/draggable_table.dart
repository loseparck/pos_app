import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/orders/application/orders_notifier.dart';
import 'package:pos_app/features/orders/presentation/orders_view.dart';
import 'package:pos_app/features/orders/presentation/widgets/product_grid.dart';
import 'package:pos_app/features/plan/data/repositories/plan_group_provider.dart';
import 'package:pos_app/features/plan/domain/entities/table_entity.dart';

class DraggableTable extends ConsumerWidget{
  final RestaurantTable table;
  final bool editMode;

  const DraggableTable({super.key, required this.table, required this.editMode});

  Color _getColor(TableStatus status){
    switch(status){
      case TableStatus.draft:
        return Colors.red;
      case TableStatus.validated:
        return Colors.blue;
      default:
        return Colors.green;
    }
  }
  
   @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifer = ref.read(planGroupProvider.notifier);
    final tableWidget = table.shape == TableShape.circle
      ? roundShape()
      : squareShape();

    if(!editMode){
      return Positioned(
        left: table.x,
        top: table.y,
        child: GestureDetector(
          child: Transform.rotate(
            angle: table.rotation,
            child: tableWidget,
          ),
          onTap: () {
            notifer.selectTable(table.id, editMode);
            ref.read(ordersProvider.notifier).initSelectedOrderByTableOrGroupId(table.id, true);
            ref.read(currentGroupProvider.notifier).state = null;
            Navigator.push(context, MaterialPageRoute(builder: (context) => OrdersView(supportId: table.id, isTable: true,)));
          }
        ),
      );
    }
    
    return  Positioned(
      left: table.x,
      top: table.y,
      child: GestureDetector(
        onTap: () {
          notifer.selectTable(table.id,editMode);
        },
        onPanUpdate: (details){
          final newX = table.x + details.delta.dx * 20;
          final newY = table.y + details.delta.dy * 20;
          notifer.updateTablePosition(
            table.id,
            newX, 
            newY,
          );
        },
        child: Transform.rotate(
          angle: table.rotation,
          child: tableWidget,
        ) ,
      ),
    );
  }

  Widget roundShape(){
    return Container(
      width: table.width,
      height: table.height,
      decoration: BoxDecoration(
        color: _getColor(table.status),
        borderRadius: BorderRadius.circular(360),
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
      width: table.width,
      height: table.height,
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
        alignment: Alignment.center,
        children: [
          Center(
            child: FittedBox(
              fit: BoxFit.contain,
              child: Icon(Icons.chair, color:  Colors.black.withValues(alpha: 0.4), size: table.width * 0.8,),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                table.name,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: table.width * 0.15,
                ),
              ),
              Text(
                "${table.seats} places",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: table.height * 0.1,
                ),
              ),
            ],
          ),
        ],
      );
  }
}