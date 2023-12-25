import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:quick_drink_app/app/injection_container.config.dart';

final getIt = GetIt.instance;
@InjectableInit()
void configureDependencies() => getIt.init();
@module  
abstract class RegisterModule {  
 
  @Named("BaseUrl")  
  String get baseUrl => 'https://my-json-server.typicode.com/bogbrz/demo/';  
  

  @lazySingleton  
  Dio dio(@Named('BaseUrl') String url) => Dio(BaseOptions(baseUrl: url));  
  
  
}  
