import 'package:quick_drink_app/data_source/pre_order_remote_data_source.dart';
import 'package:quick_drink_app/domain/models/order_model.dart';

class PreOrdersRepository {
  final PreOrderRemoteDataSource preOrderRemoteDataSource;

  PreOrdersRepository({required this.preOrderRemoteDataSource});
  Stream<List<OrderModel>> getPreOrder({required int tableNumber}) {
    return preOrderRemoteDataSource.getPreOrderData().map((snapshot) {
      return snapshot.docs
          .map((doc) {
            return OrderModel(
                name: doc["name"],
                quantity: doc["quantity"],
                price: doc['price'],
                tableNumber: doc["tableNumber"],
                type: doc["type"]);
          })
          .where((element) => element.tableNumber == tableNumber)
          .toList();
    });
  }
}
