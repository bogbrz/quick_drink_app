import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_drink_app/data_source/menu_remote_data_source.dart';
import 'package:quick_drink_app/domain/models/menu_position_model.dart';
import 'package:quick_drink_app/domain/repositories/menu_repository.dart';
import 'package:quick_drink_app/features/pages/menu_page/add_page/add_page.dart';
import 'package:quick_drink_app/features/pages/menu_page/drinks_page/cubit/drinks_page_cubit.dart';

class DrinksPage extends StatefulWidget {
  const DrinksPage({
    super.key,
    required this.tableNumber,
  });
  final int tableNumber;

  @override
  State<DrinksPage> createState() => _DrinksPageState();
}

class _DrinksPageState extends State<DrinksPage> {
  var menuType = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DrinksPageCubit(
          menuRepository:
              MenuRepository(menuRemoteDataSource: MenuRemoteDataSource()))
        ..addedDrinksData(),
      child: BlocBuilder<DrinksPageCubit, DrinksPageState>(
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
                ),
              ],
              title: Text("Drinks table ${widget.tableNumber}",
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
                          context.read<DrinksPageCubit>().addedDrinksData();
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
                          context.read<DrinksPageCubit>().testList();
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
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: ListView(
                          children: [
                            for (final drink in state.drinksList) ...[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  DrinkListWidget(
                                    drink: drink,
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
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class DrinkListWidget extends StatefulWidget {
  const DrinkListWidget({
    super.key,
    required this.drink,
    required this.tableNumber,
  });

  final MenuPositionModel drink;
  final int tableNumber;

  @override
  State<DrinkListWidget> createState() => _DrinkListWidgetState();
}

class _DrinkListWidgetState extends State<DrinkListWidget> {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      " ${widget.drink.name}",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      "Price: ${widget.drink.price.toString()}",
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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Ingredients: ${widget.drink.ingredients}",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
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
                      iconSize: (MediaQuery.of(context).size.width * 0.25) / 3,
                      icon: Icon(Icons.remove_circle)),
                ],
              ),
            ],
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
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () {
                context.read<DrinksPageCubit>().addDrinkToPreOrders(
                    tableNumber: widget.tableNumber,
                    name: widget.drink.name,
                    price: widget.drink.price,
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
                  mainAxisAlignment: MainAxisAlignment.center,
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
