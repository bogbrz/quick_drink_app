import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_drink_app/data_source/dishes_remote_data_source.dart';
import 'package:quick_drink_app/domain/models/dishes_model.dart';
import 'package:quick_drink_app/domain/repositories/dishes_repository.dart';
import 'package:quick_drink_app/features/pages/menu_page/cubit/menu_page_cubit.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MenuPageCubit(
          dishesRepository: DishesRepository(
              dishesRemoteDataSource: DishesRemoteDataSource()))
        ..start(),
      child: BlocBuilder<MenuPageCubit, MenuPageState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Menu"),
            ),
            body: ListView(children: [
              Column(
                children: [
                  for (final dish in state.dishesList) ...[
                    Text(dish.mealId.toString()),
                    Text(dish.name),
                    Text(
                      dish.ingredients,
                    ),
                    Text(dish.price.toString())
                  ]
                ],
              )
            ]),
          );
        },
      ),
    );
  }
}
