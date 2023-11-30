import 'package:quick_drink_app/data_source/drinks_remote_data_source.dart';
import 'package:quick_drink_app/domain/models/drink_model.dart';

class DrinksRepository {
  DrinksRepository({required this.drinksRemoteDataSource});
  final DrinksRemoteDataSource drinksRemoteDataSource;

  Future<List<DrinkModel>> getDrinks() async {
    final json = await drinksRemoteDataSource.getDrinksData();
    if (json == null) {
      return [];
    }

    return json.map((e) => DrinkModel.fromJson(e)).toList();
  }
}
