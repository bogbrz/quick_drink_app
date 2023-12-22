import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


import 'package:quick_drink_app/domain/models/to_do_model.dart';
import 'package:quick_drink_app/domain/repositories/order_repository.dart';

part 'bar_page_state.dart';
part 'bar_page_cubit.freezed.dart';

class BarPageCubit extends Cubit<BarPageState> {
  BarPageCubit({required this.orderRepository})
      : super(BarPageState(orders: [], errorMessage: ''));

  final OrderRepository orderRepository;
  StreamSubscription? streamSubscription;

  Future<void> getOrderbyType() async {
    streamSubscription =
        orderRepository.getOrderbyType(type: "drink").listen((orders) {
      emit(BarPageState(errorMessage: '', orders: orders));
    })
          ..onError((error) {
            emit(BarPageState(errorMessage: error.toString(), orders: []));
          });
  }

  Future<void> removeToDoOrder({required String id}) async {
    orderRepository.removeToDoOrder(id: id);
  }
}
