import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_drink_app/data_source/table_remote_data_source.dart';
import 'package:quick_drink_app/domain/models/table_model.dart';
import 'package:quick_drink_app/domain/repositories/tables_repository.dart';
import 'package:quick_drink_app/features/pages/tables_page/cubit/tables_page_cubit.dart';
import 'package:quick_drink_app/menu_page.dart';

class TablePage extends StatelessWidget {
  TablePage({
    super.key,
  });
  final tableNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => TablesPageCubit(
            tableRepository:
                TableRepository(tableRemoteDataSource: TableRemoteDataSource()))
          ..getTables(),
        child: BlocBuilder<TablesPageCubit, TablesPageState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                shape:
                    Border(bottom: BorderSide(color: Colors.black, width: 2)),
                backgroundColor: Colors.orange,
                title: Text("Tables Page",
                    style: Theme.of(context).textTheme.headlineLarge),
                centerTitle: true,
              ),
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.orangeAccent,
                          border: Border.all(width: 2, color: Colors.black)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 12,
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          2.5,
                                      child: Text("Number of the table",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge)),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 7,
                                    child: TextField(
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder()),
                                      controller: tableNumber,
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                          IconButton(
                              onPressed: () {
                                context.read<TablesPageCubit>().addTable(
                                      tableNumber: int.parse(tableNumber.text),
                                    );
                                tableNumber.clear();
                              },
                              icon: Container(
                                child: Icon(
                                  Icons.add_box,
                                  size: 100,
                                  color: Colors.white,
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: Center(
                      child: ListView(
                        children: [
                          Column(
                            children: [
                              for (final table in state.tables) ...[
                                Dismissible(
                                  key: ValueKey(table.id),
                                  onDismissed: (_) {
                                    context
                                        .read<TablesPageCubit>()
                                        .removeTable(docId: table.id);
                                  },
                                  child: TableWidget(table: table),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                              ]
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ));
  }
}

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
              builder: (context) => RootPage(tableNumber: table.tableNumber),
            ),
          );
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 221, 128, 23),
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
