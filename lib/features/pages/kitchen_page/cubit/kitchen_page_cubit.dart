import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quick_drink_app/app/core/enums.dart';

import 'package:quick_drink_app/domain/models/to_do_model.dart';
import 'package:quick_drink_app/domain/repositories/order_repository.dart';

part 'kitchen_page_state.dart';
part 'kitchen_page_cubit.freezed.dart';

class KitchenPageCubit extends Cubit<KitchenPageState> {
  KitchenPageCubit({required this.orderRepository})
      : super(KitchenPageState(
          status: Status.initial,
          orders: [],
          errorMessage: '',
        ));
  final OrderRepository orderRepository;
  StreamSubscription? streamSubscription;

  Future<void> getOrderbyType() async {
    emit(
        KitchenPageState(errorMessage: '', orders: [], status: Status.initial));
    streamSubscription =
        orderRepository.getOrderbyType(type: "dish").listen((orders) {
      emit(KitchenPageState(
        status: Status.success,
        errorMessage: '',
        orders: orders,
      ));
    })
          ..onError((error) {
            emit(KitchenPageState(
              status: Status.error,
              errorMessage: error.toString(),
              orders: [],
            ));
          });
  }

  Future<void> removeToDoOrder({required String id}) async {
    orderRepository.removeToDoOrder(id: id);
  }
}
