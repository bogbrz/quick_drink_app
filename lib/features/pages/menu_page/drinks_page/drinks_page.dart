import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_drink_app/data_source/drinks_remote_data_source.dart';
import 'package:quick_drink_app/domain/models/drink_model.dart';
import 'package:quick_drink_app/domain/repositories/drinks_repository.dart';

import 'package:quick_drink_app/features/pages/menu_page/drinks_page/cubit/drinks_page_cubit.dart';

class DrinksPage extends StatefulWidget {
  const DrinksPage({
    super.key,
  });

  @override
  State<DrinksPage> createState() => _DrinksPageState();
}

class _DrinksPageState extends State<DrinksPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DrinksPageCubit(
        drinksRepository: DrinksRepository(
          drinksRemoteDataSource: DrinksRemoteDataSource(),
        ),
      )..start(),
      child: BlocBuilder<DrinksPageCubit, DrinksPageState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Drinks"),
            ),
            body: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Created menu ",
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Test menu",
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView(
                    children: [
                      for (final drink in state.drinksList) ...[
                        Row(
                          children: [
                            DrinkListWidget(drink: drink),
                            DrinkCounterWidget(),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                      ],
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

class DrinkCounterWidget extends StatefulWidget {
  const DrinkCounterWidget({
    super.key,
  });

  @override
  State<DrinkCounterWidget> createState() => _DrinkCounterWidgetState();
}

var counter = 0;

class _DrinkCounterWidgetState extends State<DrinkCounterWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: MediaQuery.of(context).size.width * 0.25,
          child: Column(
            children: [
              IconButton(
                iconSize: (MediaQuery.of(context).size.width * 0.25) / 3,
                onPressed: () {
                  setState(() {
                    counter++;
                  });

                  print("counter");
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
        ),
        Container(
          margin: EdgeInsets.all(8),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: Colors.black,
            ),
          ),
          height: MediaQuery.of(context).size.width * 0.3,
          width: MediaQuery.of(context).size.width * 0.2,
          child: Text(
            "$counter",
            style: TextStyle(fontSize: 45),
          ),
        )
      ],
    );
  }
}

class DrinkListWidget extends StatelessWidget {
  const DrinkListWidget({
    super.key,
    required this.drink,
  });

  final DrinkModel drink;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      height: MediaQuery.of(context).size.width * 0.3,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.black,
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${drink.drinkId.toString()}. ${drink.name}"),
                Text("  Price: ${drink.price.toString()}")
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Text(
                  "Ingredients: ${drink.ingredients}",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
