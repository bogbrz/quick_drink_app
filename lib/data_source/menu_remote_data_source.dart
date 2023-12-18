import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';

class MenuRemoteDataSource {
  Future<List<Map<String, dynamic>>?> getExamplePositions() async {
    final respone = await Dio().get<List<dynamic>>(
        "https://my-json-server.typicode.com/bogbrz/json-demo/db");

    final listDynamic = respone.data;
    if (listDynamic == null) {
      return null;
    }


    return listDynamic.map((e) => e as Map<String, dynamic>).toList();
  }

    Stream<QuerySnapshot<Map<String, dynamic>>> getAddedPositions() {
    return FirebaseFirestore.instance
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
    await FirebaseFirestore.instance.collection("Menu").add(
      {
        "name": name,
        "price": price,
        "ingredients": ingredients,
        "type" : type,
      },
    );
  }

  Future<void> addPositionToPreOrder({
    required int tableNumber,
    required String dishName,
    required int quantity,
    required double price,
    required String type,
  }) async {
    await FirebaseFirestore.instance.collection("PreOrder").add({
      "tableNumber": tableNumber,
      "name": dishName,
      "quantity": quantity,
      "price": price,
      "type": type,
    });
  }
}
