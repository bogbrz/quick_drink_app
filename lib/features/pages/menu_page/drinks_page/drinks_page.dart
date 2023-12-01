import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_drink_app/data_source/drinks_remote_data_source.dart';
import 'package:quick_drink_app/domain/models/drink_model.dart';
import 'package:quick_drink_app/domain/repositories/drinks_repository.dart';
import 'package:quick_drink_app/features/pages/menu_page/dishes_page/dishes_page.dart';
import 'package:quick_drink_app/features/pages/menu_page/drinks_page/cubit/drinks_page_cubit.dart';

class DrinksPage extends StatelessWidget {
  const DrinksPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DrinksPageCubit(
          drinksRepository: DrinksRepository(
              drinksRemoteDataSource: DrinksRemoteDataSource()))
        ..start(),
      child: BlocBuilder<DrinksPageCubit, DrinksPageState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Drinks"),
            ),
            body: ListView(
              children: [
                for (final drink in state.drinksList) ...[
                  Row(
                    children: [
                      DrinkListWidget(drink: drink),
                      CounterWidget(),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                ],
              ],
            ),
          );
        },
      ),
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
