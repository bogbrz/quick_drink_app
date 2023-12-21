  
  import 'package:dio/dio.dart';
import 'package:quick_drink_app/domain/models/menu_position_model.dart';
import 'package:retrofit/retrofit.dart';
  part 'example_menu_remote_data_source.g.dart';



  @RestApi(baseUrl: 'https://5d42a6e2bc64f90014a56ca0.mockapi.io/api/v1/')
abstract class ExampleRetrofitDataSource {
  factory ExampleRetrofitDataSource(Dio dio, {String baseUrl}) = _ExampleRetrofitDataSource;

  @GET('/db')
  Future<List<MenuPositionModel>> getExamplePositions();
}

