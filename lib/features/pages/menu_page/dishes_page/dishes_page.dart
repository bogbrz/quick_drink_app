import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_drink_app/data_source/dishes_remote_data_source.dart';
import 'package:quick_drink_app/domain/models/dish_model.dart';
import 'package:quick_drink_app/domain/repositories/dishes_repository.dart';
import 'package:quick_drink_app/features/pages/menu_page/dishes_page/cubit/dishes_page_cubit.dart';

class DishesPage extends StatelessWidget {
  const DishesPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DishesPageCubit(
          dishesRepository: DishesRepository(
              dishesRemoteDataSource: DishesRemoteDataSource()))
        ..start(),
      child: BlocBuilder<DishesPageCubit, DishesPageState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Dishes"),
            ),
            body: ListView(children: [
              for (final dish in state.dishesList) ...[
                Row(
                  children: [
                    DishesListWidget(dish: dish),
                    CounterWidget(),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
              ]
            ]),
          );
        },
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({
    super.key,
  });

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

var counter = 0;

class _CounterWidgetState extends State<CounterWidget> {
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

class DishesListWidget extends StatelessWidget {
  const DishesListWidget({
    super.key,
    required this.dish,
  });

  final DishModel dish;

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
                Text("${dish.mealId.toString()}. ${dish.name}"),
                Text("  Price: ${dish.price.toString()}")
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Text(
                  "Ingredients: ${dish.ingredients}",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
