import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_drink_app/domain/repositories/table_repository.dart';
import 'package:quick_drink_app/features/pages/tables_page/cubit/tables_page_cubit.dart';
import 'package:quick_drink_app/firebase_options.dart';
import 'package:quick_drink_app/menu_page.dart';
import 'package:quick_drink_app/data_source/table_remote_data_source.dart';

class TablePage extends StatelessWidget {
  TablePage({
    super.key,
  });
  final tableNumber = TextEditingController();
  final guestsQuantity = TextEditingController();

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
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      child: Text("Number of the table",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge)),
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
                              Row(
                                children: [
                                  SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      child: Text("Number of the clients",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge)),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 7,
                                    child: TextField(
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder()),
                                      controller: guestsQuantity,
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          IconButton(
                              onPressed: () {
                                context.read<TablesPageCubit>().addTable(
                                    tableNumber: int.parse(tableNumber.text),
                                    guestsQuantity:
                                        int.parse(guestsQuantity.text));
                              },
                              icon: Icon(
                                Icons.add_box,
                                size: 100,
                                color: Colors.green,
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
                                Material(
                                  shape: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  clipBehavior: Clip.hardEdge,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => MenuPage(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 2,
                                            color: Colors.black,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              4,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("${table.tableNumber}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium),
                                          Text("${table.guestsQuantity}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium),
                                        ],
                                      ),
                                    ),
                                  ),
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
