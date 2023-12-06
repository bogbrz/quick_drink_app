import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:quick_drink_app/domain/repositories/dishes_repository.dart';
import 'package:quick_drink_app/domain/repositories/drinks_repository.dart';

part 'add_page_state.dart';

class AddPageCubit extends Cubit<AddPageState> {
  AddPageCubit({required this.dishesRepository, required this.drinksRepository})
      : super(AddPageState(errorMessage: ''));

  final DishesRepository dishesRepository;
  final DrinksRepository drinksRepository;

  Future<void> addDish(
      {required String name,
      required double price,
      required String ingredients,
      required int mealId}) async {
    await dishesRepository.addDish(
        name: name, price: price, ingredients: ingredients, mealId: mealId);
  }

  Future<void> addDrink(
      {required String name,
      required double price,
      required String ingredients,
      required int drinkId}) async {
    await drinksRepository.addDrink(
        name: name, price: price, ingredients: ingredients, drinkId: drinkId);
  }
}
