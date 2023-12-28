import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quick_drink_app/app/core/enums.dart';

import 'package:quick_drink_app/domain/models/to_do_model.dart';
import 'package:quick_drink_app/domain/repositories/order_repository.dart';

part 'bar_page_state.dart';
part 'bar_page_cubit.freezed.dart';

class BarPageCubit extends Cubit<BarPageState> {
  BarPageCubit({required this.orderRepository})
      : super(
            BarPageState(orders: [], errorMessage: '', status: Status.initial));

  final OrderRepository orderRepository;
  StreamSubscription? streamSubscription;

  Future<void> getOrderbyType({required String type}) async {
    emit(BarPageState(errorMessage: '', orders: [], status: Status.loading));
    streamSubscription =
        orderRepository.getOrderbyType(type: type).listen((orders) {
      emit(BarPageState(
          errorMessage: '', orders: orders, status: Status.success));
    })
          ..onError((error) {
            emit(BarPageState(
                errorMessage: error.toString(),
                orders: [],
                status: Status.error));
          });
  }

  Future<void> removeToDoOrder({required String id}) async {
    orderRepository.removeToDoOrder(id: id);
  }
}
