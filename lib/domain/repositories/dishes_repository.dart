import 'package:quick_drink_app/data_source/dishes_remote_data_source.dart';
import 'package:quick_drink_app/domain/models/dish_model.dart';

class DishesRepository {
  final DishesRemoteDataSource dishesRemoteDataSource;

  DishesRepository({required this.dishesRemoteDataSource});

  Future<List<DishModel>> getExampleDishes() async {
    final json = await dishesRemoteDataSource.getExampleDishesData();
    if (json == null) {
      return [];
    }

    return json.map((item) => DishModel.fromJson(item)).toList();
  }

  Future<void> addDish(
      {required String name,
      required double price,
      required String ingredients,
      required int mealId}) async {
    return dishesRemoteDataSource.addDish(
        name: name, price: price, ingredients: ingredients, mealId: mealId);
  }

  Future<void> addDishToPreOrder({
    required int tableNumber,
    required String dishName,
    required int quantity,
    required double price,
  }) async {
    return dishesRemoteDataSource.addDishToPreOrders(
        tableNumber: tableNumber,
        dishName: dishName,
        quantity: quantity,
        price: price);
  }

  Stream<List<DishModel>> getAddedDishesData() {
    return dishesRemoteDataSource.getAddedDishesData().map((snapshot) {
      return snapshot.docs.map((doc) {
        return DishModel(
            ingredients: doc['ingredients'],
            price: doc['price'],
            name: doc['name'],
            mealId: doc["meal_id"]);
      }).toList();
    });
  }
}
