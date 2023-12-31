
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_drink_app/app/injection_container.dart';

import 'package:quick_drink_app/features/pages/bar_kitchen_table_pages/tables_page/cubit/tables_page_cubit.dart';
import 'package:quick_drink_app/features/pages/login_user_pages/user_page/user_page.dart';

import 'package:quick_drink_app/features/pages/widgets/table_widget.dart';

class TablePage extends StatefulWidget {
  const TablePage({

    
    super.key,
  });
  

  @override
  State<TablePage> createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  final tableNumber = TextEditingController();


  @override
  void initState() {
    super.initState();
    tableNumber.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
        create: (context) => getIt<TablesPageCubit>()..getTables(),
        child: BlocBuilder<TablesPageCubit, TablesPageState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                actions: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => UserPage())));
                    },
                    child: Icon(
                      Icons.person_2_sharp,
                      size: 50,
                    ),
                  )
                ],
                shape: const Border(
                    bottom: BorderSide(color: Colors.black, width: 2)),
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
                      padding: const EdgeInsets.all(5),
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
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          2.5,
                                      child: Text("Number of the table",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge)),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 7,
                                    child: TextField(
                                      decoration: const InputDecoration(
                                          border: OutlineInputBorder()),
                                      controller: tableNumber,
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: tableNumber.text.isEmpty
                                ? null
                                : () {
                                    getIt<TablesPageCubit>().addTable(
                                        tableNumber:
                                            int.parse(tableNumber.text));

                                    tableNumber.clear();
                                  },
                            icon: const Icon(
                              Icons.add_box,
                              size: 100,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
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
                                    getIt<TablesPageCubit>()
                                        .removeTable(docId: table.id);
                                  },
                                  child: TableWidget(table: table),
                                ),
                                const SizedBox(
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

