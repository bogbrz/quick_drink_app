import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quick_drink_app/data_source/example_menu_remote_data_source.dart';
import 'package:quick_drink_app/data_source/menu_remote_data_source.dart';
import 'package:quick_drink_app/domain/models/menu_position_model.dart';

import 'package:quick_drink_app/domain/repositories/menu_repository.dart';

class MockJsonDataSource extends Mock implements ExampleRetrofitDataSource {}

class MockMenuRemoteDataSource extends Mock implements MenuRemoteDataSource {}

void main() {
  late MenuRepository sut;
  late MockJsonDataSource dataSource;
  late MockMenuRemoteDataSource dataSource2;

  setUp(() {
    dataSource = MockJsonDataSource();
    dataSource2 = MockMenuRemoteDataSource();
    sut = MenuRepository(
        menuRemoteDataSource: dataSource2,
        exampleRetrofitDataSource: dataSource);
  });

  group("getExamplePositions", () {
    test("should call exampleRetrofitDataSource.getExamplePositions() once",
        () async {
      //1
      when(
        () => dataSource.getExamplePositions(),
      ).thenAnswer((_) async => []);
      //2
      await sut.getExamplePositions(type: "drink");
      //3
      verify(
        () => dataSource.getExamplePositions(),
      ).called(1);
    });
    test("should filter data results by type", () async {
      //1
      when(() => dataSource.getExamplePositions()).thenAnswer((_) async => [
            MenuPositionModel(
                name: "name1",
                id: "id1",
                price: 11,
                ingredients: "ingredients",
                type: "drink"),
            MenuPositionModel(
                name: "name2",
                id: "id2",
                price: 11,
                ingredients: "ingredients",
                type: "dish"),
            MenuPositionModel(
                name: "name3",
                id: "id3",
                price: 11,
                ingredients: "ingredients",
                type: "drink"),
            MenuPositionModel(
                name: "name4",
                id: "id4",
                price: 11,
                ingredients: "ingredients",
                type: "dish")
          ]);
      //2
      final results = await sut.getExamplePositions(type: "drink");
      //3
      expect(results, [
        MenuPositionModel(
            name: "name1",
            id: "id1",
            price: 11,
            ingredients: "ingredients",
            type: "drink"),
        MenuPositionModel(
            name: "name3",
            id: "id3",
            price: 11,
            ingredients: "ingredients",
            type: "drink"),
      ]);
    });
  });
  group("calling methods tests", () {
    test("should call menuRemoteDataSource.addPosition() once ", () async {
      when(() => dataSource2.addPosition(
          name: "name",
          price: 11,
          ingredients: "ingredients",
          type: "type")).thenAnswer((_) async => []);
      await sut.addPosition(
          name: "name", price: 11, ingredients: "ingredients", type: "type");
      verify(
        () => dataSource2.addPosition(
            name: "name", price: 11, ingredients: "ingredients", type: "type"),
      ).called(1);
    });
    test("should call menuRemoteDataSource.addPositionToPreOrder() once ",
        () async {
      when(() => dataSource2.addPositionToPreOrder(
          name: "name",
          price: 11,
          tableNumber: 1,
          quantity: 1,
          type: "type")).thenAnswer((_) async => []);
      await sut.addPositionToPreOrder(
          name: "name", price: 11, tableNumber: 1, quantity: 1, type: "type");
      verify(
        () => dataSource2.addPositionToPreOrder(
            name: "name", price: 11, tableNumber: 1, quantity: 1, type: "type"),
      ).called(1);
    });
    test("should call menuRemoteDataSource.removePostiton() once ", () async {
      when(() => dataSource2.removePostiton(id: "1"))
          .thenAnswer((_) async => []);
      await sut.removePosition(
        id: "1",
      );
      verify(
        () => dataSource2.removePostiton(id: "1"),
      ).called(1);
    });
  });

  // group("getAddedData", () {
  //   test("should call menuRemoteDataSource.getAddedPositions() once", () async {

  //     when(() => dataSource2
  //       .getAddedPositions()).thenAnswer((_) => );
  //   });
  // });
}
