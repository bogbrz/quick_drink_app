import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quick_drink_app/app/core/enums.dart';

import 'package:quick_drink_app/domain/models/order_model.dart';

import 'package:quick_drink_app/domain/repositories/order_repository.dart';

part 'order_page_state.dart';
part 'order_page_cubit.freezed.dart';

class OrderPageCubit extends Cubit<OrderPageState> {
  OrderPageCubit({required this.orderRepository})
      : super(
          OrderPageState(
            status: Status.initial,
            orderValue: 0,
            orders: [],
            errorMessage: "",
          ),
        );

  final OrderRepository orderRepository;
  StreamSubscription? streamSubscription;

  Future<void> getPreOrder({required int tableNumber}) async {
    double value = 0;
    emit(OrderPageState(
        errorMessage: '',
        orders: [],
        orderValue: value,
        status: Status.loading));
    streamSubscription =
        orderRepository.getPreOrder(tableNumber: tableNumber).listen((orders) {
      for (final order in orders) {
        value = value + order.orderPrice;
      }
      emit(OrderPageState(
        status: Status.success,
        orderValue: value,
        errorMessage: '',
        orders: orders,
      ));
    })
          ..onError((error) {
            emit(OrderPageState(
                errorMessage: error.toString(), orders: [], orderValue: 0, status: Status.error));
          });
  }

  Future<void> getOrder({required int tableNumber}) async {
    double value = 0;
     emit(OrderPageState(
        errorMessage: '',
        orders: [],
        orderValue: value,
        status: Status.loading));
    streamSubscription =
        orderRepository.getOrder(tableNumber: tableNumber).listen((orders) {
      for (final order in orders) {
        value = value + order.orderPrice;
      }
      emit(OrderPageState(
        status: Status.success,
        orderValue: value,
        errorMessage: '',
        orders: orders,
      ));
    })
          ..onError((error) {
            emit(OrderPageState(
              status: Status.error,
                errorMessage: error.toString(), orders: [], orderValue: 0));
          });
  }

  Future<void> addOrder({
    required String type,
    required int tableNumber,
    required String name,
    required int quantity,
    required double price,
  }) async {
    orderRepository.addOrder(
      type: type,
      name: name,
      price: price,
      tableNumber: tableNumber,
      quantity: quantity,
    );
  }

  Future<void> addOrderToDo({
    required String type,
    required int tableNumber,
    required String name,
    required int quantity,
  }) async {
    orderRepository.addOrderToDo(
      type: type,
      name: name,
      tableNumber: tableNumber,
      quantity: quantity,
    );
  }

  Future<void> removePreOrder({required String id}) async {
    orderRepository.removePreOrder(id: id);
  }

  Future<void> removeOrder({required String id}) async {
    orderRepository.removeOrder(id: id);
  }

  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}
