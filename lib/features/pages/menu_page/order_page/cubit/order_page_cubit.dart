import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:quick_drink_app/domain/models/order_model.dart';
import 'package:quick_drink_app/domain/repositories/pre_order_repository.dart';

part 'order_page_state.dart';

class OrderPageCubit extends Cubit<OrderPageState> {
  OrderPageCubit({required this.preOrdersRepository})
      : super(
          OrderPageState(
            orders: [],
            errorMessage: "",
          ),
        );

  final PreOrdersRepository preOrdersRepository;
  StreamSubscription? streamSubscription;

  Future<void> getPreOrder() async {
    streamSubscription = preOrdersRepository.getPreOrder().listen((event) {
      emit(OrderPageState(
        errorMessage: '',
        orders: event,
      ));
    })
      ..onError((error) {
        emit(OrderPageState(errorMessage: error.toString(), orders: []));
      });
  }

  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}
