import 'package:quick_drink_app/data_source/drinks_remote_data_source.dart';
import 'package:quick_drink_app/domain/models/drink_model.dart';

class DrinksRepository {
  DrinksRepository({required this.drinksRemoteDataSource});
  final DrinksRemoteDataSource drinksRemoteDataSource;

  Future<List<DrinkModel>> getExampleDrinks() async {
    final json = await drinksRemoteDataSource.getExampleDrinksData();
    if (json == null) {
      return [];
    }

    return json.map((e) => DrinkModel.fromJson(e)).toList();
  }

  Future<void> addDrink(
      {required String name,
      required double price,
      required String ingredients,
      required int drinkId}) async {
    return drinksRemoteDataSource.addDrink(
        name: name, price: price, ingredients: ingredients, drinkId: drinkId);
  }

  Stream<List<DrinkModel>> getAddedDrinksData() {
    return drinksRemoteDataSource.getAddedDrinksData().map((snapshot) {
      return snapshot.docs.map((doc) {
        return DrinkModel(
            name: doc['name'],
            drinkId: doc['drink_id'],
            price: doc["price"],
            ingredients: doc['ingredients']);
      }).toList();
    });
  }

  Future<void> addDrinkToPreOrders({
    required int tableNumber,
    required String drinkName,
    required int quantity,
    required double price,
  }) async {
    await drinksRemoteDataSource.addDrinkToPreOrders(
        tableNumber: tableNumber,
        drinkName: drinkName,
        quantity: quantity,
        price: price);
  }
}
