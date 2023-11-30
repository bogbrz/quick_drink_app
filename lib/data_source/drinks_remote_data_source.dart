import 'package:dio/dio.dart';

class DrinksRemoteDataSource {
  final dio = Dio();
  Future<List<Map<String, dynamic>>?> getDrinksData() async {
    final respone = await dio.get<List<dynamic>>(
        "https://my-json-server.typicode.com/bogbrz/json-demo/drinks");

    final listDynamic = respone.data;
    if (listDynamic == null) {
      return null;
    }
    print(respone);

    return listDynamic.map((e) => e as Map<String, dynamic>).toList();
  }
}
