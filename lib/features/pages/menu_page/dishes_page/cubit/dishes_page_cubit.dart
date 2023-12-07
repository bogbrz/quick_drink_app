import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:quick_drink_app/domain/models/dish_model.dart';
import 'package:quick_drink_app/domain/repositories/dishes_repository.dart';

part 'dishes_page_state.dart';

class DishesPageCubit extends Cubit<DishesPageState> {
  DishesPageCubit({required this.dishesRepository})
      : super(
          DishesPageState(
            errorMessage: '',
            dishesList: [],
          ),
        );

  final DishesRepository dishesRepository;
  StreamSubscription? streamSubscription;

  Future<void> testList() async {
    final results = await dishesRepository.getExampleDishes();

    try {
      emit(
        DishesPageState(
          errorMessage: '',
          dishesList: results,
        ),
      );
    } catch (error) {
      emit(
        DishesPageState(
          errorMessage: error.toString(),
          dishesList: [],
        ),
      );
    }
  }

  Future<void> addedDishesData() async {
    streamSubscription =
        dishesRepository.getAddedDishesData().listen((results) {
      emit(
        DishesPageState(
          errorMessage: '',
          dishesList: results,
        ),
      );
    })
          ..onError((error) {
            emit(
              DishesPageState(
                errorMessage: error,
                dishesList: [],
              ),
            );
          });
  }

  Future<void> addDishToPreOrders({
    required int tableNumber,
    required String dishName,
    required int quantity,
    required double price,
  }) async {
    dishesRepository.addDishToPreOrder(
        tableNumber: tableNumber,
        dishName: dishName,
        quantity: quantity,
        price: price);
  }

  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}
