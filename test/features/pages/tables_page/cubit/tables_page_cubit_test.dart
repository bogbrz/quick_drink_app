import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quick_drink_app/app/core/enums.dart';
import 'package:quick_drink_app/domain/models/table_model.dart';
import 'package:quick_drink_app/domain/repositories/tables_repository.dart';
import 'package:quick_drink_app/features/pages/tables_page/cubit/tables_page_cubit.dart';

class MockTableRepository extends Mock implements TableRepository {}

void main() {
  late TablesPageCubit sut;
  late MockTableRepository repository;
  setUp(() {
    repository = MockTableRepository();
    sut = TablesPageCubit(tableRepository: repository);
  });

  group("getTables", () {
    group("Succes", () {
      setUp(() {
        when(
          () => repository.getTablesData(),
        ).thenAnswer((_) => Stream.value([
              TableModel(tableNumber: 1, id: "id"),
              TableModel(tableNumber: 2, id: "id"),
              TableModel(tableNumber: 3, id: "id")
            ]));
      });

      blocTest<TablesPageCubit, TablesPageState>(
        'emits Status.loading then Status.succes with results',
        build: () => sut,
        act: (cubit) => cubit.getTables(),
        expect: () => <TablesPageState>[
          TablesPageState(
            errorMessage: '',
            status: Status.loading,
            tables: [],
          ),
          TablesPageState(errorMessage: "", status: Status.success, tables: [
            TableModel(tableNumber: 1, id: "id"),
            TableModel(tableNumber: 2, id: "id"),
            TableModel(tableNumber: 3, id: "id")
          ])
        ],
      );
    });

    group("Faliure", () {
      setUp(() {
        when(
          () => repository.getTablesData(),
        ).thenAnswer((_) => Stream.error("error"));
      });

      blocTest<TablesPageCubit, TablesPageState>(
        'emits Status.loading then Status.error with errorMessage and without results',
        build: () => sut,
        act: (cubit) => cubit.getTables(),
        expect: () => <TablesPageState>[
          TablesPageState(
            errorMessage: '',
            status: Status.loading,
            tables: [],
          ),
          TablesPageState(
              errorMessage: "error", status: Status.error, tables: [])
        ],
      );
    });
  });

  group("removeTable", () {
    test("should call tableRepository.removeTable() once", () async {
      //1
      when(
        () => repository.removeTable(docId: "docId"),
      ).thenAnswer((_) async => []);
      //2
      await sut.removeTable(docId: "docId");
      //3
      verify(
        () => repository.removeTable(docId: "docId"),
      ).called(1);
    });
  });


  group("addTable", () {
    test("should call tableRepository.addTable() once", () async {
      //1
      when(
        () => repository.addTables(tableNumber: 1),
      ).thenAnswer((_) async => []);
      //2
      await sut.addTable(tableNumber: 1);
      //3
      verify(
        () => repository.addTables(tableNumber: 1),
      ).called(1);
    });
  });

  
}
