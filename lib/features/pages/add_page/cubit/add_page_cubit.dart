import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quick_drink_app/app/core/enums.dart';
import 'package:quick_drink_app/domain/models/menu_position_model.dart';

import 'package:quick_drink_app/domain/repositories/menu_repository.dart';

part 'add_page_state.dart';
part 'add_page_cubit.freezed.dart';

class AddPageCubit extends Cubit<AddPageState> {
  AddPageCubit({
    required this.menuRepository,
  }) : super(AddPageState(
          status: Status.initial,
          postitions: [],
          errorMessage: '',
        ));

  final MenuRepository menuRepository;
  StreamSubscription? streamSubscription;

  Future<void> addPosition(
      {required String name,
      required double price,
      required String ingredients,
      required String type}) async {
    await menuRepository.addPosition(
        name: name, price: price, ingredients: ingredients, type: type);
  }

  Future<void> getAddedData({required String type}) async {
    emit(
        AddPageState(errorMessage: '', status: Status.loading, postitions: []));
    streamSubscription =
        menuRepository.getAddedData(type: type).listen((event) {
      emit(AddPageState(
          errorMessage: '', status: Status.success, postitions: event));
    })
          ..onError((error) {
            emit(AddPageState(
                errorMessage: error.toString(),
                status: Status.error,
                postitions: []));
          });
  }

  Future<void> removePosition({required String id}) async {
    return menuRepository.removePosition(id: id);
  }

  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}
