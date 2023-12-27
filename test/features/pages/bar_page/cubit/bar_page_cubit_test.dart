import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quick_drink_app/app/core/enums.dart';
import 'package:quick_drink_app/domain/models/to_do_model.dart';
import 'package:quick_drink_app/domain/repositories/order_repository.dart';
import 'package:quick_drink_app/features/pages/bar_page/cubit/bar_page_cubit.dart';

class MockOrderRepository extends Mock implements OrderRepository{}

void main() {
  late BarPageCubit sut;
  late MockOrderRepository repository;
  setUp(() {
    repository = MockOrderRepository();
    sut = BarPageCubit(orderRepository: repository);
  });

  group("getOrderByType", () {
    group("succes", () {
      setUp(() {
        when(
          () => repository.getOrderbyType(type: "type"),
        ).thenAnswer((_) => Stream.value([
              ToDoModel(
                name: "name",
                quantity: 1,
                tableNumber: 1,
                type: "type",
                id: "id",
              ),
              ToDoModel(
                name: "name1",
                quantity: 1,
                tableNumber: 1,
                type: "type",
                id: "id",
              ),
              ToDoModel(
                name: "name2",
                quantity: 1,
                tableNumber: 1,
                type: "type",
                id: "id",
              )
            ]));
      });
      blocTest<BarPageCubit, BarPageState>(
        "should emit Status.loading then status.succes with orders ",
        build: () => sut,
        act: (cubit) => cubit.getOrderbyType(),
        expect: () => <BarPageState>[
          BarPageState(errorMessage: "", orders: [], status: Status.loading),
          BarPageState(
              errorMessage: "",
              orders: [
                ToDoModel(
                  name: "name",
                  quantity: 1,
                  tableNumber: 1,
                  type: "type",
                  id: "id",
                ),
                ToDoModel(
                  name: "name1",
                  quantity: 1,
                  tableNumber: 1,
                  type: "type",
                  id: "id",
                ),
                ToDoModel(
                  name: "name2",
                  quantity: 1,
                  tableNumber: 1,
                  type: "type",
                  id: "id",
                )
              ],
              status: Status.success)
        ],
      );
    });
    group("faliure", () {
      setUp(() {
        when(
          () => repository.getOrderbyType(type: "type"),
        ).thenAnswer((_) => Stream.error("error"));
      });
      blocTest<BarPageCubit, BarPageState>(
        "should emit Status.loading then status.error with errorMessage ",
        build: () => sut,
        act: (cubit) => cubit.getOrderbyType(),
        expect: () => <BarPageState>[
          BarPageState(errorMessage: "", orders: [], status: Status.loading),
          BarPageState(errorMessage: "error", orders: [], status: Status.error)
        ],
      );
    });
  });

  group("removeToDoOrder", () {
    test("should call orderRepository.removeToDoOrder() once", () async {
      when(
        () => repository.removeToDoOrder(id: "id"),
      ).thenAnswer((_) async => []);

      await sut.removeToDoOrder(id: "id");

      verify(
        () => repository.removeToDoOrder(id: "id"),
      ).called(1);
    });
  });
}
