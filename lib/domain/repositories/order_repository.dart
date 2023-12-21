import 'package:quick_drink_app/data_source/order_remote_data_source.dart';
import 'package:quick_drink_app/domain/models/order_model.dart';
import 'package:quick_drink_app/domain/models/to_do_model.dart';

class OrderRepository {
  final OrderRemotDataSource orderRemoteDataSource;

  OrderRepository({required this.orderRemoteDataSource});
  Stream<List<OrderModel>> getPreOrder({required int tableNumber}) {
    return orderRemoteDataSource.getPreOrderData().map((snapshot) {
      return snapshot.docs
          .map((doc) {
            return OrderModel(
              name: doc["name"],
              quantity: doc["quantity"],
              price: doc['price'],
              tableNumber: doc["tableNumber"],
              type: doc["type"],
              id: doc.id,
            );
          })
          .where((element) => element.tableNumber == tableNumber)
          .toList();
    });
  }

  Stream<List<OrderModel>> getOrder({required int tableNumber}) {
    return orderRemoteDataSource.getOrder().map((snapshot) {
      return snapshot.docs
          .map((doc) {
            return OrderModel(
              name: doc["name"],
              quantity: doc["quantity"],
              price: doc['price'],
              tableNumber: doc["tableNumber"],
              type: doc["type"],
              id: doc.id,
            );
          })
          .where((element) => element.tableNumber == tableNumber)
          .toList();
    });
  }

  Stream<List<ToDoModel>> getOrderbyType({required String type}) {
    return orderRemoteDataSource.getToDoOrdersData().map((snapshot) {
      return snapshot.docs
          .map((doc) {
            return ToDoModel(
              name: doc["name"],
              quantity: doc["quantity"],
              tableNumber: doc["tableNumber"],
              type: doc["type"],
              id: doc.id,
            );
          })
          .where((element) => element.type == type)
          .toList();
    });
  }

  Future<void> addOrderToDo({
    required String type,
    required int tableNumber,
    required String name,
    required int quantity,
  }) async {
    orderRemoteDataSource.addOrderToDo(
      type: type,
      name: name,
      tableNumber: tableNumber,
      quantity: quantity,
    );
  }

  Future<void> addOrder(
      {required int tableNumber,
      required String name,
      required int quantity,
      required double price,
      required String type}) async {
    orderRemoteDataSource.addOrder(
        tableNumber: tableNumber,
        name: name,
        quantity: quantity,
        price: price,
        type: type);
  }

  Future<void> removePreOrder({required String id}) async {
    orderRemoteDataSource.removePreOrder(id: id);
  }

  Future<void> removeOrder({required String id}) async {
    orderRemoteDataSource.removeOrder(id: id);
  }

  Future<void> removeToDoOrder({required String id}) async {
    orderRemoteDataSource.removeToDoOrder(id: id);
  }
}
