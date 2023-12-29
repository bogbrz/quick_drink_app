import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@injectable
class OrderRemotDataSource {
  final UserId = FirebaseAuth.instance.currentUser?.uid;
  Stream<QuerySnapshot<Map<String, dynamic>>> getPreOrderData() {
    if (UserId == null) {
      throw Exception("user not logged in");
    }
    return FirebaseFirestore.instance
        .collection("users")
        .doc(UserId)
        .collection("PreOrder")
        .orderBy("type")
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getOrder() {
    if (UserId == null) {
      throw Exception("user not logged in");
    }
    return FirebaseFirestore.instance
        .collection("users")
        .doc(UserId)
        .collection("Orders")
        .orderBy("type")
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getToDoOrdersData() {
    if (UserId == null) {
      throw Exception("user not logged in");
    }
    return FirebaseFirestore.instance
        .collection("users")
        .doc(UserId)
        .collection("ToDo")
        .snapshots();
  }

  Future<void> addOrder({
    required String type,
    required int tableNumber,
    required String name,
    required int quantity,
    required double price,
  }) async {
    if (UserId == null) {
      throw Exception("user not logged in");
    }
    FirebaseFirestore.instance
        .collection("users")
        .doc(UserId)
        .collection("Orders")
        .add({
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
    if (UserId == null) {
      throw Exception("user not logged in");
    }
    FirebaseFirestore.instance
        .collection("users")
        .doc(UserId)
        .collection("ToDo")
        .add({
      "name": name,
      "type": type,
      "tableNumber": tableNumber,
      "quantity": quantity,
    });
  }

  Future<void> removePreOrder({required String id}) async {
    if (UserId == null) {
      throw Exception("user not logged in");
    }
    return FirebaseFirestore.instance
        .collection("users")
        .doc(UserId)
        .collection("PreOrder")
        .doc(id)
        .delete();
  }

  Future<void> removeToDoOrder({required String id}) async {
    if (UserId == null) {
      throw Exception("user not logged in");
    }
    return FirebaseFirestore.instance
        .collection("users")
        .doc(UserId)
        .collection("ToDo")
        .doc(id)
        .delete();
  }

  Future<void> removeOrder({required String id}) async {
    if (UserId == null) {
      throw Exception("user not logged in");
    }
    return FirebaseFirestore.instance
        .collection("users")
        .doc(UserId)
        .collection("Orders")
        .doc(id)
        .delete();
  }
}
