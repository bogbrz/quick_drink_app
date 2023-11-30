import 'package:quick_drink_app/data_source/dishes_remote_data_source.dart';
import 'package:quick_drink_app/domain/models/dish_model.dart';

class DishesRepository {
  final DishesRemoteDataSource dishesRemoteDataSource;

  DishesRepository({required this.dishesRemoteDataSource});

  Future<List<DishModel>> getDishes() async {
    final json = await dishesRemoteDataSource.getDishesData();
    if (json == null) {
      return [];
    }

    return json.map((item) => DishModel.fromJson(item)).toList();
  }
}
