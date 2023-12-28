import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quick_drink_app/app/core/enums.dart';
import 'package:quick_drink_app/domain/models/menu_position_model.dart';
import 'package:quick_drink_app/domain/repositories/menu_repository.dart';
import 'package:quick_drink_app/features/pages/menu_page/cubit/menu_page_cubit.dart';

class MockMenuRepository extends Mock implements MenuRepository {}

void main() {
  late MenuPageCubit sut;
  late MockMenuRepository repository;
  setUp(() {
    repository = MockMenuRepository();
    sut = MenuPageCubit(menuRepository: repository);
  });

  group("testList", () {
    group("succes", () {
      setUp(() {
        when(
          () => repository.getExamplePositions(type: "type"),
        ).thenAnswer((_) async => [
              MenuPositionModel(
                  name: "name",
                  id: "id",
                  price: 1,
                  ingredients: "ingredients",
                  type: "type"),
              MenuPositionModel(
                  name: "name",
                  id: "id",
                  price: 1,
                  ingredients: "ingredients",
                  type: "type"),
              MenuPositionModel(
                  name: "name",
                  id: "id",
                  price: 1,
                  ingredients: "ingredients",
                  type: "type")
            ]);
      });

      blocTest<MenuPageCubit, MenuPageState>(
        "should emit Status.loading then Status.succes with results",
        build: () => sut,
        act: (cubit) => cubit.testList(type: "type"),
        expect: () => <MenuPageState>[
          MenuPageState(errorMessage: "", status: Status.loading, menuList: []),
          MenuPageState(
              errorMessage: "",
              menuList: [
                MenuPositionModel(
                    name: "name",
                    id: "id",
                    price: 1,
                    ingredients: "ingredients",
                    type: "type"),
                MenuPositionModel(
                    name: "name",
                    id: "id",
                    price: 1,
                    ingredients: "ingredients",
                    type: "type"),
                MenuPositionModel(
                    name: "name",
                    id: "id",
                    price: 1,
                    ingredients: "ingredients",
                    type: "type")
              ],
              status: Status.success)
        ],
      );
    });
    group("faliure", () {
      setUp(() {
        when(() => repository.getExamplePositions(type: "type"))
            .thenThrow(Exception("error"));
      });
      blocTest(
        "should emit Status.loading then Status.error without results",
        build: () => sut,
        act: (cubit) => cubit.testList(type: "type"),
        expect: () => <MenuPageState>[
          MenuPageState(errorMessage: "", menuList: [], status: Status.loading),
          MenuPageState(
              errorMessage: "Exception: error",
              menuList: [],
              status: Status.error)
        ],
      );
    });
  });

  group("addedDishesData", () {
    group("succes", () {
      setUp(() {
        when(
          () => repository.getAddedData(type: "type"),
        ).thenAnswer((_) => Stream.value([
              MenuPositionModel(
                  name: "name",
                  id: "id",
                  price: 1,
                  ingredients: "ingredients",
                  type: "type"),
              MenuPositionModel(
                  name: "name",
                  id: "id",
                  price: 1,
                  ingredients: "ingredients",
                  type: "type"),
              MenuPositionModel(
                  name: "name",
                  id: "id",
                  price: 1,
                  ingredients: "ingredients",
                  type: "type")
            ]));
      });

      blocTest<MenuPageCubit, MenuPageState>(
        "should emit Status.loading then Status.succes with results",
        build: () => sut,
        act: (cubit) => cubit.addedDishesData(type: "type"),
        expect: () => <MenuPageState>[
          MenuPageState(errorMessage: "", status: Status.loading, menuList: []),
          MenuPageState(
              errorMessage: "",
              menuList: [
                MenuPositionModel(
                    name: "name",
                    id: "id",
                    price: 1,
                    ingredients: "ingredients",
                    type: "type"),
                MenuPositionModel(
                    name: "name",
                    id: "id",
                    price: 1,
                    ingredients: "ingredients",
                    type: "type"),
                MenuPositionModel(
                    name: "name",
                    id: "id",
                    price: 1,
                    ingredients: "ingredients",
                    type: "type")
              ],
              status: Status.success)
        ],
      );
    });
    group("faliure", () {
      setUp(() {
        when(() => repository.getAddedData(type: "type"))
            .thenAnswer((_) => Stream.error("error"));
      });
      blocTest(
        "should emit Status.loading then Status.error without results",
        build: () => sut,
        act: (cubit) => cubit.addedDishesData(type: "type"),
        expect: () => <MenuPageState>[
          MenuPageState(errorMessage: "", menuList: [], status: Status.loading),
          MenuPageState(
              errorMessage: "error", menuList: [], status: Status.error)
        ],
      );
    });
  });

  group("addDishToPreOrders", () {
    test("should call menuRepository.addPositionToPreOrder once", () async {
      //1
      when(
        () => repository.addPositionToPreOrder(
            tableNumber: 1, name: "name", quantity: 1, price: 1, type: "type"),
      ).thenAnswer((_) async => []);

      //2
      await sut.addDishToPreOrders(
          tableNumber: 1, name: "name", quantity: 1, price: 1, type: "type");

      //3
      verify(
        () => repository.addPositionToPreOrder(
            tableNumber: 1, name: "name", quantity: 1, price: 1, type: "type"),
      ).called(1);
    });
  });
}
