import 'package:quick_drink_app/data_source/dishes_remote_data_source.dart';
import 'package:quick_drink_app/domain/models/dishes_model.dart';

class DishesRepository {
  final DishesRemoteDataSource dishesRemoteDataSource;

  DishesRepository({required this.dishesRemoteDataSource});

  Future<List<DishesModel>> getDishes() async {
    final json = await dishesRemoteDataSource.getDishesData();
    if (json == null) {
      return [];
    }

    return json.map((item) => DishesModel.fromJson(item)).toList();
  }
}
