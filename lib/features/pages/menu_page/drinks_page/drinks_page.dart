import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_drink_app/data_source/drinks_remote_data_source.dart';
import 'package:quick_drink_app/domain/repositories/drinks_repository.dart';
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
                Column(
                  children: [
                    for (final drink in state.drinksList) ...[
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Colors.black,
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(drink.drinkId.toString()),
                            Text(drink.name),
                            Text(
                              drink.ingredients,
                            ),
                            Text(drink.price.toString())
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                    ]
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
