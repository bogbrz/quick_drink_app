import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quick_drink_app/app/core/enums.dart';
import 'package:quick_drink_app/domain/models/to_do_model.dart';
import 'package:quick_drink_app/domain/repositories/order_repository.dart';
import 'package:quick_drink_app/features/pages/bar_kitchen_table_pages/kitchen_page/cubit/kitchen_page_cubit.dart';



class MockOrderRepository extends Mock implements OrderRepository {}

void main() {
  late KitchenPageCubit sut;
  late MockOrderRepository repository;
  setUp(() {
    repository = MockOrderRepository();
    sut = KitchenPageCubit(orderRepository: repository);
  });

  group("getOrderbyType", () {
    group("succes", () {
      setUp(() => when(() => repository.getOrderbyType(type: "type"))
          .thenAnswer((_) => Stream.value([
                ToDoModel(
                    name: "name",
                    quantity: 1,
                    tableNumber: 1,
                    type: "type",
                    id: "11"),
                ToDoModel(
                    name: "name",
                    quantity: 1,
                    tableNumber: 1,
                    type: "type",
                    id: "11"),
                ToDoModel(
                    name: "name",
                    quantity: 1,
                    tableNumber: 1,
                    type: "type",
                    id: "11")
              ])));

      blocTest<KitchenPageCubit, KitchenPageState>(
        "should emit Status.loading then status.succses with results",
        build: () => sut,
        act: (cubit) => cubit.getOrderbyType(type: "type"),
        expect: () async => <KitchenPageState>[
          KitchenPageState(errorMessage: "", orders: [], status: Status.loading),
          KitchenPageState(
              errorMessage: "",
              orders: [
                ToDoModel(
                    name: "name",
                    quantity: 1,
                    tableNumber: 1,
                    type: "type",
                    id: "11"),
                ToDoModel(
                    name: "name",
                    quantity: 1,
                    tableNumber: 1,
                    type: "type",
                    id: "11"),
                ToDoModel(
                    name: "name",
                    quantity: 1,
                    tableNumber: 1,
                    type: "type",
                    id: "11")
              ],
              status: Status.success)
        ],
      );
    });

    group("faliure", () {
      setUp(() => when(
            () => repository.getOrderbyType(type: "type"),
          ).thenAnswer((_) => Stream.error("error")));

      blocTest<KitchenPageCubit, KitchenPageState>(
        "should emit Status.loading then Status.error with errorMessage",
        build: () => sut,
        act: (cubit) => cubit.getOrderbyType(type: "type"),
        expect: () => <KitchenPageState>[
          KitchenPageState(errorMessage: "", orders: [], status: Status.loading),
          KitchenPageState(errorMessage: "error", orders: [], status: Status.error)
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
