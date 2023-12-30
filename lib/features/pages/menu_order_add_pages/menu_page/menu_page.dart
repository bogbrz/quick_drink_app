import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_drink_app/app/injection_container.dart';


import 'package:quick_drink_app/features/pages/menu_order_add_pages/add_page/add_page.dart';

import 'package:quick_drink_app/features/pages/menu_order_add_pages/menu_page/cubit/menu_page_cubit.dart';
import 'package:quick_drink_app/features/pages/widgets/dishes_list_widget.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({
    super.key,
    required this.tableNumber,
  });

  final int tableNumber;

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  var menuType = 0;
  var positiontype = "dish";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MenuPageCubit>(),
      child: BlocBuilder<MenuPageCubit, MenuPageState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              shape: const Border(
                  bottom: BorderSide(color: Colors.black, width: 2)),
              backgroundColor: Colors.orange,
              actions: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const AddPage(),
                      ),
                    );
                  },
                  child: const Icon(
                    Icons.add,
                    size: 45,
                  ),
                ),
              ],
              title: Text("Menu table ${widget.tableNumber}",
                  style: Theme.of(context).textTheme.headlineLarge),
            ),
            body: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          menuType = 0;
                          context
                              .read<MenuPageCubit>()
                              .addedDishesData(type: positiontype);
                        });
                      },
                      child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: menuType == 0
                                  ? Colors.deepOrange
                                  : Colors.orangeAccent,
                              border: const Border(
                                  bottom: BorderSide(width: 2),
                                  right: BorderSide(width: 1))),
                          width: MediaQuery.of(context).size.width / 2,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: Text(
                            "Menu",
                            style: Theme.of(context).textTheme.titleMedium,
                          )),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          menuType = 1;
                          context
                              .read<MenuPageCubit>()
                              .testList(type: positiontype);
                        });
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              color: menuType == 1
                                  ? Colors.deepOrange
                                  : Colors.orangeAccent,
                              border: const Border(
                                  bottom: BorderSide(width: 2),
                                  left: BorderSide(width: 1))),
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width / 2,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: Text(
                            "Example Menu",
                            style: Theme.of(context).textTheme.titleMedium,
                          )),
                    ),
                  ],
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          positiontype = "dish";
                        });
                        if (menuType == 0) {
                          context
                              .read<MenuPageCubit>()
                              .addedDishesData(type: positiontype);
                        } else {
                          context
                              .read<MenuPageCubit>()
                              .testList(type: positiontype);
                        }
                      },
                      child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: positiontype == "dish"
                                  ? Colors.deepOrange
                                  : Colors.orangeAccent,
                              border: const Border(
                                  bottom: BorderSide(width: 2),
                                  right: BorderSide(width: 1))),
                          width: MediaQuery.of(context).size.width / 2,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Dishes",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const Icon(Icons.dining_sharp)
                            ],
                          )),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          positiontype = "drink";
                        });
                        if (menuType == 0) {
                          context
                              .read<MenuPageCubit>()
                              .addedDishesData(type: positiontype);
                        } else {
                          context
                              .read<MenuPageCubit>()
                              .testList(type: positiontype);
                        }
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              color: positiontype == "drink"
                                  ? Colors.deepOrange
                                  : Colors.orangeAccent,
                              border: const Border(
                                  bottom: BorderSide(width: 2),
                                  left: BorderSide(width: 1))),
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width / 2,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Drinks",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const Icon(Icons.local_drink_sharp)
                            ],
                          )),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView(
                    children: [
                      for (final dish in state.menuList) ...[
                        DishesListWidget(
                          dish: dish,
                          tableNumber: widget.tableNumber,
                        ),
                      ]
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
