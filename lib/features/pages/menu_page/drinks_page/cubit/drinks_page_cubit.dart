import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:quick_drink_app/domain/models/drink_model.dart';
import 'package:quick_drink_app/domain/repositories/drinks_repository.dart';

part 'drinks_page_state.dart';

class DrinksPageCubit extends Cubit<DrinksPageState> {
  DrinksPageCubit({required this.drinksRepository})
      : super(
          DrinksPageState(
            errorMessage: '',
            drinksList: [],
          ),
        );

  final DrinksRepository drinksRepository;
  StreamSubscription? streamSubscription;

  Future<void> testList() async {
    final results = await drinksRepository.getExampleDrinks();
    try {
      emit(
        DrinksPageState(
          errorMessage: '',
          drinksList: results,
        ),
      );
    } catch (error) {
      emit(
        DrinksPageState(
          errorMessage: error.toString(),
          drinksList: [],
        ),
      );
    }
  }

  Future<void> addDrinkToPreOrders({
    required int tableNumber,
    required String drinkName,
    required int quantity,
    required double price,
  }) async {
    drinksRepository.addDrinkToPreOrders(
        tableNumber: tableNumber,
        drinkName: drinkName,
        quantity: quantity,
        price: price);
  }

  Future<void> addedDrinksData() async {
    streamSubscription =
        drinksRepository.getAddedDrinksData().listen((results) {
      emit(
        DrinksPageState(
          errorMessage: '',
          drinksList: results,
        ),
      );
    })
          ..onError((error) {
            emit(
              DrinksPageState(
                errorMessage: error,
                drinksList: [],
              ),
            );
          });
  }

  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}
