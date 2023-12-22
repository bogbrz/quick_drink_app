import 'package:cloud_firestore/cloud_firestore.dart';


class OrderRemotDataSource {
  Stream<QuerySnapshot<Map<String, dynamic>>> getPreOrderData() {
    return FirebaseFirestore.instance
        .collection("PreOrder")
        .orderBy("type")
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getOrder() {
    return FirebaseFirestore.instance.collection("Orders").snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getToDoOrdersData() {
    return FirebaseFirestore.instance.collection("ToDo").snapshots();
  }

  Future<void> addOrder({
    required String type,
    required int tableNumber,
    required String name,
    required int quantity,
    required double price,
  }) async {
    FirebaseFirestore.instance.collection("Orders").add({
      "tableNumber": tableNumber,
      "name": name,
      "quantity": quantity,
      "price": price,
      "type": type,
    });
  }

  Future<void> addOrderToDo({
    required String type,
    required int tableNumber,
    required String name,
    required int quantity,
  }) async {
    FirebaseFirestore.instance.collection("ToDo").add({
      "name": name,
      "type": type,
      "tableNumber": tableNumber,
      "quantity": quantity,
    });
  }

  Future<void> removePreOrder({required String id}) async {
    return FirebaseFirestore.instance.collection("PreOrder").doc(id).delete();
  }

  Future<void> removeToDoOrder({required String id}) async {
    return FirebaseFirestore.instance.collection("ToDo").doc(id).delete();
  }

  Future<void> removeOrder({required String id}) async {
    return FirebaseFirestore.instance.collection("Orders").doc(id).delete();
  }
}
