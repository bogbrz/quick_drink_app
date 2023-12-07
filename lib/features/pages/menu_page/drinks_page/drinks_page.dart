import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_drink_app/data_source/drinks_remote_data_source.dart';
import 'package:quick_drink_app/domain/models/drink_model.dart';
import 'package:quick_drink_app/domain/repositories/drinks_repository.dart';
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
          drinksRepository: DrinksRepository(
              drinksRemoteDataSource: DrinksRemoteDataSource()))
        ..addedDrinksData(),
      child: BlocBuilder<DrinksPageCubit, DrinksPageState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Drinks table ${widget.tableNumber}"),
            ),
            body: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          menuType = 1;
                          context.read<DrinksPageCubit>().addedDrinksData();
                        });
                      },
                      child: Text(
                        "Created menu ",
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          menuType = 0;
                          context.read<DrinksPageCubit>().testList();
                        });
                      },
                      child: Text(
                        "Test menu",
                      ),
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
                      if (menuType == 1) ...[
                        Padding(
                          padding: const EdgeInsets.only(right: 20, bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => AddPage(),
                                    ),
                                  );
                                },
                                child: Icon(Icons.add),
                              ),
                            ],
                          ),
                        )
                      ]
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

  final DrinkModel drink;
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
          height: MediaQuery.of(context).size.height * 0.2,
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
                    Text(" ${widget.drink.name}"),
                    Text("Price: ${widget.drink.price.toString()}")
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
              height: MediaQuery.of(context).size.height * 0.1 - 8,
              child: Text(
                "$counter",
                style: TextStyle(fontSize: 45),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () {
                context.read<DrinksPageCubit>().addDrinkToPreOrders(
                    tableNumber: widget.tableNumber,
                    drinkName: widget.drink.name,
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
                height: MediaQuery.of(context).size.height * 0.1 - 8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          "Add to order",
                        ),
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
