import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/features/orders/data/repositories/order_repository_provider.dart';
import 'package:pos_app/features/orders/presentation/pages/pos_page.dart';
import 'package:pos_app/features/plan/data/repositories/plan_provider.dart';
import 'package:pos_app/features/plan/domain/entities/restaurant_table.dart';
import 'package:pos_app/features/plan/application/plan_state.dart';

class DraggableTable extends ConsumerStatefulWidget{
  final RestaurantTable table;
  final bool editMode;

  const DraggableTable({super.key, required this.table, required this.editMode});

    @override
  ConsumerState<DraggableTable> createState() => _DraggableTableState();
}

class _DraggableTableState extends ConsumerState<DraggableTable>{
  
  @override
  Widget build(BuildContext context) {
    final table = widget.table;
    final notifer = ref.read(planProvider.notifier);
    final tableStatus = table.getstatus(ref.watch(ordersProvider).getOrderByTable(widget.table.id)?.status);
    final state = ref.watch(planProvider);
    final tableWidget = table.shape == TableShape.circle
      ? roundShape(state, tableStatus)
      : squareShape(state, tableStatus);

    if(!widget.editMode){
      return Positioned(
        left: table.x,
        top: table.y,
        child: GestureDetector(
          child: Transform.rotate(
            angle: table.rotation,
            child: tableWidget,
          ),
          onTap: () {
            notifer.selectTable(table.id);
            ref.read(ordersProvider.notifier).setTableAndGroupId(tableId :table.id);
            //ref.read(currentGroupProvider.notifier).state = null;
            //Navigator.push(context, MaterialPageRoute(builder: (context) => OrdersView(supportId: table.id, isTable: true,)));
            Navigator.push(context, MaterialPageRoute(builder: (context) => PosPage( isTable: true)));
          }
        ),
      );
    }
    
    return  Positioned(
      left: table.x,
      top: table.y,
      child: GestureDetector(
        onTap: () {
          notifer.selectTable(table.id);
          notifer.startTableChange();
        },
        onPanUpdate: (details){
         // final newX = table.x + details.delta.dx * 8;
          //final newY = table.y + details.delta.dy * 8;

          notifer.updateTablePosition(
            table.id,
            details.globalPosition.dx - 50, 
            details.globalPosition.dy - 170,
          );
        },
        child: Transform.rotate(
          angle: table.rotation,
          child: tableWidget,
        ) ,
      ),
    );
  }

  Widget roundShape(PlanGroupState state, TableStatus tableStatus){
    final table = widget.table;
    return Container(
      width: table.width,
      height: table.height,
      decoration: BoxDecoration(
        color: tableStatus == TableStatus.empty &&  widget.table.color != null ? Color(int.tryParse(widget.table.color ?? '0xFF81C784') ?? 0xFF81C784) : tableStatus.color,
        borderRadius: BorderRadius.circular(360),
        border: Border.all(
          color: widget.table.id == state.selectedTableId
          ? Colors.yellow
          : Colors.transparent,
          width: 3,
        ),
      ),
      alignment: Alignment.center,
      child: _tableContent(),
    );
  }

  Widget squareShape(PlanGroupState state, TableStatus tableStatus){
    final table = widget.table;
    return Container(
      width: table.width,
      height: table.height,
      decoration: BoxDecoration(
        color:  tableStatus == TableStatus.empty &&  widget.table.color != null ? Color(int.tryParse(widget.table.color ?? '0xFF81C784') ?? 0xFF81C784) : tableStatus.color,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: widget.table.id == state.selectedTableId 
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
    final table = widget.table;
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