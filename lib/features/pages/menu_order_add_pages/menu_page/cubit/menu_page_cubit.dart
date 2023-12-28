import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quick_drink_app/app/core/enums.dart';

import 'package:quick_drink_app/domain/models/menu_position_model.dart';

import 'package:quick_drink_app/domain/repositories/menu_repository.dart';

part 'menu_page_state.dart';
part 'menu_page_cubit.freezed.dart';

class MenuPageCubit extends Cubit<MenuPageState> {
  MenuPageCubit({required this.menuRepository})
      : super(
          MenuPageState(
            status: Status.initial,
            errorMessage: '',
            menuList: [],
          ),
        );

  final MenuRepository menuRepository;
  StreamSubscription? streamSubscription;

  Future<void> testList({required String type}) async {
    emit(MenuPageState(errorMessage: '', menuList: [], status: Status.loading));
   
    try {
       final results = await menuRepository.getExamplePositions(type: type);

      emit(
        MenuPageState(
          status: Status.success,
          errorMessage: '',
          menuList: results,
        ),
      );
    } catch (error) {
      emit(
        MenuPageState(
          status: Status.error,
          errorMessage: error.toString(),
          menuList: [],
        ),
      );
    }
  }

  Future<void> addedDishesData({required String type}) async {
    emit(MenuPageState(errorMessage: '', menuList: [], status: Status.loading));
    streamSubscription =
        menuRepository.getAddedData(type: type).listen((results) {
      emit(
        MenuPageState(
          status: Status.success,
          errorMessage: '',
          menuList: results,
        ),
      );
   
    })
          ..onError((error) {
            emit(
              MenuPageState(
                status: Status.error,
                errorMessage: error.toString(),
                menuList: [],
              ),
            );
          });
  }

  Future<void> addDishToPreOrders(
      {required int tableNumber,
      required String name,
      required int quantity,
      required double price,
      required String type}) async {
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
