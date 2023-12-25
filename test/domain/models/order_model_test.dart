import 'package:flutter_test/flutter_test.dart';
import 'package:quick_drink_app/domain/models/order_model.dart';

void main() {
  test("should getter orderPrice return quantity muliplied by price ", () {
    //1 prepare data
    final model = OrderModel(
        name: "name",
        quantity: 2,
        price: 5,
        tableNumber: 1,
        type: "drink",
        id: "wdaw");

    //2
    final result = model.orderPrice;

    //3
    expect(result, 10);
  });
}
