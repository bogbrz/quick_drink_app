import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_drink_app/data_source/dishes_remote_data_source.dart';
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
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.black,
                  ),
                ),
                child: Column(
                  children: [
                    for (final dish in state.dishesList) ...[
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Colors.black,
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(dish.mealId.toString()),
                            Text(dish.name),
                            Text(
                              dish.ingredients,
                            ),
                            Text(dish.price.toString())
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                    ]
                  ],
                ),
              )
            ]),
          );
        },
      ),
    );
  }
}
