import 'package:flutter_test/flutter_test.dart';
import 'package:quick_drink_app/domain/models/order_model.dart';

void main() {
  test("should getter orderPrice return quantity muliplied by price ", () {
  
    final model = OrderModel(
        name: "name",
        quantity: 2,
        price: 5,
        tableNumber: 1,
        type: "drink",
        id: "wdaw");


    final result = model.orderPrice;

 
    expect(result, 10);
  });
}
