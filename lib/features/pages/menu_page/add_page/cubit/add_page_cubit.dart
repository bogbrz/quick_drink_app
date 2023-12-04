import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:quick_drink_app/domain/models/dish_model.dart';
import 'package:quick_drink_app/domain/repositories/dishes_repository.dart';

part 'add_page_state.dart';

class AddPageCubit extends Cubit<AddPageState> {
  AddPageCubit({required this.dishesRepository})
      : super(AddPageState(dishes: [], errorMessage: ''));

  final DishesRepository dishesRepository;
  StreamSubscription? streamSubscription;

  Future<void> addDish(
      {required String name,
      required double price,
      required String ingredients,
      required int mealId}) async {
    await dishesRepository.addDish(
        name: name, price: price, ingredients: ingredients, mealId: mealId);
  }
}
