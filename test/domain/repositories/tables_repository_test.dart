import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quick_drink_app/data_source/table_remote_data_source.dart';
import 'package:quick_drink_app/domain/repositories/tables_repository.dart';

class MockTableRemoteDatSource extends Mock implements TableRemoteDataSource {}

void main() {
  late TableRepository sut;
  late MockTableRemoteDatSource dataSource;
  setUp(() {
    dataSource = MockTableRemoteDatSource();
    sut = TableRepository(tableRemoteDataSource: dataSource);
  });

  group("tests methdos for calls", () {
    test("removeTable should call   tableRemoteDataSource.removeTable() once",
        () async {
  
      when(
        () => dataSource.removeTable(docId: "1"),
      ).thenAnswer((_) async => []);
     
      await sut.removeTable(docId: "1");

    
      verify(
        () => dataSource.removeTable(docId: "1"),
      ).called(1);
    });
    test("addTables should call tableRemoteDataSource.addTables() once",
        () async {

      when(() => dataSource.addTables(tableNumber: 1))
          .thenAnswer((_) async => []);
   
      await sut.addTables(tableNumber: 1);

   
      verify(
        () => dataSource.addTables(tableNumber: 1),
      ).called(1);
    });
  });
}
