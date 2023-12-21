


import 'package:freezed_annotation/freezed_annotation.dart';
part 'order_model.freezed.dart';

@freezed
class OrderModel with _$OrderModel {
  const OrderModel._();
  factory OrderModel({
    required String name,
    required int quantity,
    required double price,
    required int tableNumber,
    required  String type,
    required String id,
    
  }) = _OrderModel;
   double get orderPrice {
    return quantity * price;
  }

 

 
}
