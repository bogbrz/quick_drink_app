import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


import 'package:quick_drink_app/domain/models/to_do_model.dart';
import 'package:quick_drink_app/domain/repositories/order_repository.dart';

part 'kitchen_page_state.dart';
part 'kitchen_page_cubit.freezed.dart';

class KitchenPageCubit extends Cubit<KitchenPageState> {
  KitchenPageCubit({required this.orderRepository})
      : super(KitchenPageState(
          orders: [],
          errorMessage: '',
        ));
  final OrderRepository orderRepository;
  StreamSubscription? streamSubscription;

  Future<void> getOrderbyType() async {
    streamSubscription =
        orderRepository.getOrderbyType(type: "dish").listen((orders) {
      emit(KitchenPageState(
        errorMessage: '',
        orders: orders,
      ));
    })
          ..onError((error) {
            emit(KitchenPageState(
              errorMessage: error.toString(),
              orders: [],
            ));
          });
  }

  Future<void> removeToDoOrder({required String id}) async {
    orderRepository.removeToDoOrder(id: id);
  }
}
