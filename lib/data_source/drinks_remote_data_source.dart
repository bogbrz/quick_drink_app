import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';

class DrinksRemoteDataSource {
  final dio = Dio();
  Future<List<Map<String, dynamic>>?> getExampleDrinksData() async {
    final respone = await dio.get<List<dynamic>>(
        "https://my-json-server.typicode.com/bogbrz/json-demo/drinks");

    final listDynamic = respone.data;
    if (listDynamic == null) {
      return null;
    }
    print(respone);

    return listDynamic.map((e) => e as Map<String, dynamic>).toList();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getAddedDrinksData() {
    return FirebaseFirestore.instance
        .collection("Drinks")
        .orderBy("drink_id")
        .snapshots();
  }

  Future<void> addDrink(
      {required String name,
      required double price,
      required String ingredients,
      required int drinkId}) async {
    await FirebaseFirestore.instance.collection("Drinks").add(
      {
        "name": name,
        "price": price,
        "ingredients": ingredients,
        "drink_id": drinkId,
      },
    );
  }

  Future<void> addDrinkToPreOrders({
    required int tableNumber,
    required String drinkName,
    required int quantity,
    required double price,
  }) async {
    await FirebaseFirestore.instance.collection("PreOrder").add({
      "tableNumber": tableNumber,
      "name": drinkName,
      "quantity": quantity,
      "price": price,
      "type": "drink",
    });
  }
}
