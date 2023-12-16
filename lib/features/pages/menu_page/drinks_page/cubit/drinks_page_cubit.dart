import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:quick_drink_app/domain/models/menu_position_model.dart';

import 'package:quick_drink_app/domain/repositories/menu_repository.dart';

part 'drinks_page_state.dart';

class DrinksPageCubit extends Cubit<DrinksPageState> {
  DrinksPageCubit({required this.menuRepository})
      : super(
          DrinksPageState(
            errorMessage: '',
            drinksList: [],
          ),
        );

  final MenuRepository menuRepository;
  StreamSubscription? streamSubscription;

  Future<void> testList() async {
    final results = await menuRepository.getExamplePositions(type: "drink");
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
    required String name,
    required int quantity,
    required double price,
  }) async {
    menuRepository.addPositionToPreOrder(
        tableNumber: tableNumber,
        name: name,
        quantity: quantity,
        price: price,
        type: "drink");
  }

  Future<void> addedDrinksData() async {
    streamSubscription =
        menuRepository.getAddedData(type: "drink").listen((results) {
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
