import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';

class DishesRemoteDataSource {
  Future<void> addDish(
      {required String name,
      required double price,
      required String ingredients,
      required int mealId}) async {
    await FirebaseFirestore.instance.collection("Dishes").add(
      {
        "name": name,
        "price": price,
        "ingredients": ingredients,
        "meal_id": mealId,
      },
    );
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getAddedDishesData() {
    return FirebaseFirestore.instance
        .collection("Dishes")
        .orderBy("meal_id")
        .snapshots();
  }

  Future<List<Map<String, dynamic>>?> getExampleDishesData() async {
    final respone = await Dio().get<List<dynamic>>(
        "https://my-json-server.typicode.com/bogbrz/json-demo/dishes");

    final listDynamic = respone.data;
    if (listDynamic == null) {
      return null;
    }
    print(respone);

    return listDynamic.map((e) => e as Map<String, dynamic>).toList();
  }

  Future<void> addDishToPreOrders({
    required int tableNumber,
    required String dishName,
    required int quantity,
    required double price,
  }) async {
    await FirebaseFirestore.instance.collection("PreOrder").add({
      "tableNumber": tableNumber,
      "name": dishName,
      "quantity": quantity,
      "price" : price,
    });
  }
}
