import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quick_drink_app/app/core/enums.dart';
import 'package:quick_drink_app/domain/models/menu_position_model.dart';
import 'package:quick_drink_app/domain/repositories/menu_repository.dart';
import 'package:quick_drink_app/features/pages/menu_order_add_pages/add_page/cubit/add_page_cubit.dart';



class MockMenuRepository extends Mock implements MenuRepository {}

void main() {
  late AddPageCubit sut;
  late MockMenuRepository repository;
  setUp(() {
    repository = MockMenuRepository();
    sut = AddPageCubit(menuRepository: repository);
  });

  group("addPositon", () {
    test("should call menuRepository.addPositon() once", () async {
      //1
      when(
        () => repository.addPosition(
            name: "name", price: 1, ingredients: "ingredients", type: "type"),
      ).thenAnswer((_) async => []);
      //2
      await sut.addPosition(
          name: "name", price: 1, ingredients: "ingredients", type: "type");
      //3
      verify(
        () => repository.addPosition(
            name: "name", price: 1, ingredients: "ingredients", type: "type"),
      ).called(1);
    });
  });

  group("getAddedData", () {
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

      blocTest<AddPageCubit, AddPageState>(
        "should emit Status.loading then Status.succes with results",
        build: () => sut,
        act: (cubit) => cubit.getAddedData(type: "type"),
        expect: () => <AddPageState>[
          AddPageState(
              errorMessage: "", status: Status.loading, postitions: []),
          AddPageState(
              errorMessage: "",
              postitions: [
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
        act: (cubit) => cubit.getAddedData(type: "type"),
        expect: () => <AddPageState>[
          AddPageState(
              errorMessage: "", postitions: [], status: Status.loading),
          AddPageState(
              errorMessage: "error", postitions: [], status: Status.error)
        ],
      );
    });
  });

   group("removePosition", () {
    test("should call menuRepository.removePostion() once", () async {
      //1
      when(
        () => repository.removePosition(
            id: "name", ),
      ).thenAnswer((_) async => []);
      //2
      await sut.removePosition(
         id: "name",);
      //3
      verify(
        () => repository.removePosition(
           id: "name",),
      ).called(1);
    });
  });
}
