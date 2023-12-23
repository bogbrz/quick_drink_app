import 'package:quick_drink_app/data_source/example_menu_remote_data_source.dart';
import 'package:quick_drink_app/data_source/menu_remote_data_source.dart';
import 'package:quick_drink_app/domain/models/menu_position_model.dart';

class MenuRepository {
  final MenuRemoteDataSource menuRemoteDataSource;
  final ExampleRetrofitDataSource exampleRetrofitDataSource;

  MenuRepository(
      {required this.menuRemoteDataSource,
      required this.exampleRetrofitDataSource});

  Future<List<MenuPositionModel>> getExamplePositions(
      {required String type}) async {
    final json = await exampleRetrofitDataSource.getExamplePositions();

    return json;
  }

  Future<void> addPosition(
      {required String name,
      required double price,
      required String ingredients,
      required String type}) async {
    return menuRemoteDataSource.addPosition(
        name: name, price: price, ingredients: ingredients, type: type);
  }

  Future<void> addPositionToPreOrder(
      {required int tableNumber,
      required String name,
      required int quantity,
      required double price,
      required String type}) async {
    await menuRemoteDataSource.addPositionToPreOrder(
        tableNumber: tableNumber,
        dishName: name,
        quantity: quantity,
        price: price,
        type: type);
  }

  Stream<List<MenuPositionModel>> getAddedData({required String type}) {
    return menuRemoteDataSource.getAddedPositions().map((snapshot) {
      return snapshot.docs
          .map((doc) {
            return MenuPositionModel(
                ingredients: doc['ingredients'],
                price: doc['price'],
                name: doc['name'],
                type: doc['type'],
                id: doc.id);
          })
          .where((element) => element.type == type)
          .toList();
    });
  }

  Future<void> removePosition({required String id}) async {
    return menuRemoteDataSource.removePostiton(id: id);
  }
}
