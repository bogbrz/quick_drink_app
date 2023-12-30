import 'package:flutter/material.dart';


import 'package:quick_drink_app/domain/models/table_model.dart';


import 'package:quick_drink_app/features/pages/menu_order_add_pages/menu_navigator_page.dart';




class TableWidget extends StatelessWidget {
  const TableWidget({
    super.key,
    required this.table,
  });

  final TableModel table;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>
                  NavigatorPage(tableNumber: table.tableNumber),
            ),
          );
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 221, 128, 23),
              border: Border.all(
                width: 2,
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(100)),
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${table.tableNumber}",
                  style: Theme.of(context).textTheme.displayMedium),
            ],
          ),
        ),
      ),
    );
  }
}
