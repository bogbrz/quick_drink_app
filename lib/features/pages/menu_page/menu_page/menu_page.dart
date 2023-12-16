import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_drink_app/data_source/menu_remote_data_source.dart';
import 'package:quick_drink_app/domain/models/menu_position_model.dart';
import 'package:quick_drink_app/domain/repositories/menu_repository.dart';
import 'package:quick_drink_app/features/pages/menu_page/add_page/add_page.dart';

import 'package:quick_drink_app/features/pages/menu_page/menu_page/cubit/menu_page_cubit.dart';

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
      create: (context) => MenuPageCubit(
          menuRepository:
              MenuRepository(menuRemoteDataSource: MenuRemoteDataSource()))
        ..addedDishesData(type: positiontype),
      child: BlocBuilder<MenuPageCubit, MenuPageState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              shape: Border(bottom: BorderSide(color: Colors.black, width: 2)),
              backgroundColor: Colors.orange,
              actions: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AddPage(),
                      ),
                    );
                  },
                  child: Icon(
                    Icons.add,
                    size: 45,
                  ),
                )
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

                          print(positiontype);
                        });
                      },
                      child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.orangeAccent,
                              border: Border(
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

                          print(positiontype);
                        });
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              border: Border(
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
                          context
                              .read<MenuPageCubit>()
                              .testList(type: positiontype);

                          print(positiontype);
                        });
                      },
                      child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              border: Border(
                                  bottom: BorderSide(width: 2),
                                  right: BorderSide(width: 1))),
                          width: MediaQuery.of(context).size.width / 2,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: Text(
                            "Dishes",
                            style: Theme.of(context).textTheme.titleMedium,
                          )),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          positiontype = "drink";
                          context
                              .read<MenuPageCubit>()
                              .testList(type: positiontype);
                          print(positiontype);
                        });
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.orangeAccent,
                              border: Border(
                                  bottom: BorderSide(width: 2),
                                  left: BorderSide(width: 1))),
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width / 2,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: Text(
                            "Drinks",
                            style: Theme.of(context).textTheme.titleMedium,
                          )),
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: ListView(
                          children: [
                            for (final dish in state.menuList) ...[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  DishesListWidget(
                                    dish: dish,
                                    tableNumber: widget.tableNumber,
                                  ),
                                ],
                              ),
                            ]
                          ],
                        ),
                      ),
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

class DishesListWidget extends StatefulWidget {
  const DishesListWidget({
    super.key,
    required this.dish,
    required this.tableNumber,
  });

  final MenuPositionModel dish;
  final int tableNumber;

  @override
  State<DishesListWidget> createState() => _DishesListWidgetState();
}

class _DishesListWidgetState extends State<DishesListWidget> {
  var counter = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.6,
          height: MediaQuery.of(context).size.height * 0.3,
          margin: EdgeInsets.all(25),
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: Colors.black,
            ),
          ),
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Text(
                        widget.dish.name,
                        style: Theme.of(context).textTheme.titleMedium,
                      )),
                      Text(
                        "Price: ${widget.dish.price.toString()}",
                        style: Theme.of(context).textTheme.titleMedium,
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Text(
                        "Ingredients: ${widget.dish.ingredients}",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      iconSize: (MediaQuery.of(context).size.width * 0.25) / 3,
                      onPressed: () {
                        setState(() {
                          counter++;
                        });
                      },
                      icon: Icon(Icons.add_box_rounded),
                    ),
                    IconButton(
                        onPressed: counter == 0
                            ? null
                            : () {
                                setState(() {
                                  counter = counter - 1;
                                });
                              },
                        iconSize:
                            (MediaQuery.of(context).size.width * 0.25) / 3,
                        icon: Icon(Icons.remove_circle)),
                  ],
                ),
              ],
            ),
          ),
        ),
        Column(
          children: [
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Colors.black,
                ),
              ),
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height * 0.15 - 8,
              child: Text(
                "$counter",
                style: TextStyle(fontSize: 45),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: counter == 0
                  ? null
                  : () {
                      context.read<MenuPageCubit>().addDishToPreOrders(
                          tableNumber: widget.tableNumber,
                          name: widget.dish.name,
                          price: widget.dish.price,
                          quantity: counter);
                      setState(() {
                        counter = 0;
                      });
                    },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.black,
                  ),
                ),
                width: MediaQuery.of(context).size.width * 0.2,
                height: MediaQuery.of(context).size.height * 0.15 - 8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        "Add",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    Icon(Icons.add_box_outlined)
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
