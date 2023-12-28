import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@injectable
class MenuRemoteDataSource {
  final UserId = FirebaseAuth.instance.currentUser?.uid;
  Stream<QuerySnapshot<Map<String, dynamic>>> getAddedPositions() {

    if (UserId == null) {
      throw Exception("user not logged in");
    }
    return FirebaseFirestore.instance
        .collection("users")
        .doc(UserId)
        .collection("Menu")
        .orderBy("type")
        .snapshots();
  }

  Future<void> addPosition({
    required String name,
    required double price,
    required String ingredients,
    required String type,
  }) async {
     if (UserId == null) {
      throw Exception("user not logged in");
    }
    await FirebaseFirestore.instance
        .collection("users")
        .doc(UserId)
        .collection("Menu")
        .add(
      {
        "name": name,
        "price": price,
        "ingredients": ingredients,
        "type": type,
      },
    );
  }

  Future<void> addPositionToPreOrder({
    required int tableNumber,
    required String name,
    required int quantity,
    required double price,
    required String type,
  }) async {
     if (UserId == null) {
      throw Exception("user not logged in");
    }
    await FirebaseFirestore.instance
        .collection("users")
        .doc(UserId)
        .collection("PreOrder")
        .add({
      "tableNumber": tableNumber,
      "name": name,
      "quantity": quantity,
      "price": price,
      "type": type,
    });
  }

  Future<void> removePostiton({required String id}) async {
     if (UserId == null) {
      throw Exception("user not logged in");
    }
    return FirebaseFirestore.instance
        .collection("users")
        .doc(UserId)
        .collection("Menu")
        .doc(id)
        .delete();
  }
}
