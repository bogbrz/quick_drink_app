import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


import 'package:quick_drink_app/domain/repositories/menu_repository.dart';

part 'add_page_state.dart';
part 'add_page_cubit.freezed.dart';

class AddPageCubit extends Cubit<AddPageState> {
  AddPageCubit({
    required this.menuRepository,
  }) : super(AddPageState(errorMessage: '',));

  final MenuRepository menuRepository;

  Future<void> addPosition(
      {required String name,
      required double price,
      required String ingredients,
      required String type}) async {
    await menuRepository.addPosition(
        name: name, price: price, ingredients: ingredients, type: type);
  }
}
