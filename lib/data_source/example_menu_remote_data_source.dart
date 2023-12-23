import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:quick_drink_app/domain/models/menu_position_model.dart';
import 'package:retrofit/retrofit.dart';
part 'example_menu_remote_data_source.g.dart';
@injectable
@RestApi()
abstract class ExampleRetrofitDataSource {
  @factoryMethod
  factory ExampleRetrofitDataSource(Dio dio) = _ExampleRetrofitDataSource;

  @GET('/db')
  Future<List<MenuPositionModel>> getExamplePositions();
}
