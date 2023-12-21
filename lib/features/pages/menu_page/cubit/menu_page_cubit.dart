import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:quick_drink_app/domain/models/menu_position_model.dart';

import 'package:quick_drink_app/domain/repositories/menu_repository.dart';

part 'menu_page_state.dart';

class MenuPageCubit extends Cubit<MenuPageState> {
  MenuPageCubit({required this.menuRepository})
      : super(
          MenuPageState(
            errorMessage: '',
            menuList: [],
          ),
        );

  final MenuRepository menuRepository;
  StreamSubscription? streamSubscription;

  Future<void> testList({required String type}) async {
    final results = await menuRepository.getExamplePositions(type: type);

    try {
      emit(
        MenuPageState(
          errorMessage: '',
          menuList: results,
        ),
      );
    } catch (error) {
      emit(
        MenuPageState(
          errorMessage: error.toString(),
          menuList: [],
        ),
      );
    }
  }

  Future<void> addedDishesData({required String type}) async {
    streamSubscription =
        menuRepository.getAddedData(type: type).listen((results) {
      emit(
        MenuPageState(
          errorMessage: '',
          menuList: results,
        ),
      );
    })
          ..onError((error) {
            emit(
              MenuPageState(
                errorMessage: error.toString(),
                menuList: [],
              ),
            );
          });
  }

  Future<void> addDishToPreOrders({
    required int tableNumber,
    required String name,
    required int quantity,
    required double price,
    required String type  }) async {
    menuRepository.addPositionToPreOrder(
        tableNumber: tableNumber,
        name: name,
        quantity: quantity,
        price: price,
        type: type);
  }

  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}
