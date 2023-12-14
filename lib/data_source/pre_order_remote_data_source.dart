import 'package:cloud_firestore/cloud_firestore.dart';

class PreOrderRemoteDataSource {
  Stream<QuerySnapshot<Map<String, dynamic>>> getPreOrderData() {
    return FirebaseFirestore.instance
        .collection("PreOrder")
        .orderBy("type")
        .snapshots();
  }

  Future<void> addOrder({required String type,
    required int tableNumber,
    required String name,
    required int quantity,
    required double orderPrice,}) async {
    FirebaseFirestore.instance.collection("Orders").add({
      "tableNumber" : tableNumber,
      "name" : name,
      "quanity" : quantity,
      "orderPrice" :orderPrice,
      


    });
  }

  Future<void> removePreOrder({required String id}) async {
    return FirebaseFirestore.instance.collection("PreOrder").doc(id).delete();
  }
}
