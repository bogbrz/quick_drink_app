import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quick_drink_app/app/core/enums.dart';
import 'package:quick_drink_app/domain/models/order_model.dart';
import 'package:quick_drink_app/domain/repositories/order_repository.dart';
import 'package:quick_drink_app/features/pages/order_page/cubit/order_page_cubit.dart';

class MockOrderRepository extends Mock implements OrderRepository {}

void main() {
  late OrderPageCubit sut;
  late MockOrderRepository repository;
  setUp(() {
    repository = MockOrderRepository();
    sut = OrderPageCubit(orderRepository: repository);
  });

  group("getPreOrder", () {
    group("faliure", () {
      setUp(
        () => when(
          () => repository.getPreOrder(
            tableNumber: 1,
          ),
        ).thenAnswer(
          (_) => Stream.error("error"),
        ),
      );

      blocTest<OrderPageCubit, OrderPageState>(
        "should emit Status.loading then Status.error with errorMessage, and orderValue equal 0",
        build: () => sut,
        act: (cubit) => cubit.getPreOrder(tableNumber: 1),
        expect: () => <OrderPageState>[
          OrderPageState(
              errorMessage: "",
              orders: [],
              orderValue: 0,
              status: Status.loading),
          OrderPageState(
              errorMessage: "error",
              orders: [],
              orderValue: 0,
              status: Status.error)
        ],
      );
    });
    group("succes", () {
      setUp(() {
        when(
          () => repository.getPreOrder(tableNumber: 1),
        ).thenAnswer((_) => Stream.value([
              OrderModel(
                  name: "name1",
                  quantity: 2,
                  price: 2,
                  tableNumber: 1,
                  type: "type",
                  id: "id"),
              OrderModel(
                  name: "name2",
                  quantity: 1,
                  price: 1,
                  tableNumber: 1,
                  type: "type",
                  id: "id"),
              OrderModel(
                  name: "name3",
                  quantity: 3,
                  price: 3,
                  tableNumber: 1,
                  type: "type",
                  id: "id")
            ]));
      });
      blocTest<OrderPageCubit, OrderPageState>(
        "should emit Status.loading then Status.succes with orders, and orderValue equal 14",
        build: () => sut,
        act: (cubit) => cubit.getPreOrder(tableNumber: 1),
        expect: () => <OrderPageState>[
          OrderPageState(
              errorMessage: "",
              orders: [],
              orderValue: 0,
              status: Status.loading),
          OrderPageState(
              errorMessage: "",
              orders: [
                OrderModel(
                    name: "name1",
                    quantity: 2,
                    price: 2,
                    tableNumber: 1,
                    type: "type",
                    id: "id"),
                OrderModel(
                    name: "name2",
                    quantity: 1,
                    price: 1,
                    tableNumber: 1,
                    type: "type",
                    id: "id"),
                OrderModel(
                    name: "name3",
                    quantity: 3,
                    price: 3,
                    tableNumber: 1,
                    type: "type",
                    id: "id")
              ],
              orderValue: 14,
              status: Status.success)
        ],
      );
    });
  });

  group("getOrder", () {
    group("Succes", () {
      group("succes", () {
        setUp(() {
          when(
            () => repository.getOrder(tableNumber: 1),
          ).thenAnswer((_) => Stream.value([
                OrderModel(
                    name: "name1",
                    quantity: 2,
                    price: 2,
                    tableNumber: 1,
                    type: "type",
                    id: "id"),
                OrderModel(
                    name: "name2",
                    quantity: 1,
                    price: 1,
                    tableNumber: 1,
                    type: "type",
                    id: "id"),
                OrderModel(
                    name: "name3",
                    quantity: 3,
                    price: 3,
                    tableNumber: 1,
                    type: "type",
                    id: "id")
              ]));
        });
        blocTest<OrderPageCubit, OrderPageState>(
          "should emit Status.loading then Status.succes with orders, and orderValue equal 14",
          build: () => sut,
          act: (cubit) => cubit.getOrder(tableNumber: 1),
          expect: () => <OrderPageState>[
            OrderPageState(
                errorMessage: "",
                orders: [],
                orderValue: 0,
                status: Status.loading),
            OrderPageState(
                errorMessage: "",
                orders: [
                  OrderModel(
                      name: "name1",
                      quantity: 2,
                      price: 2,
                      tableNumber: 1,
                      type: "type",
                      id: "id"),
                  OrderModel(
                      name: "name2",
                      quantity: 1,
                      price: 1,
                      tableNumber: 1,
                      type: "type",
                      id: "id"),
                  OrderModel(
                      name: "name3",
                      quantity: 3,
                      price: 3,
                      tableNumber: 1,
                      type: "type",
                      id: "id")
                ],
                orderValue: 14,
                status: Status.success)
          ],
        );
      });
    });
    group("Faliure", () {
      setUp(
        () => when(
          () => repository.getOrder(
            tableNumber: 1,
          ),
        ).thenAnswer(
          (_) => Stream.error("error"),
        ),
      );

      blocTest<OrderPageCubit, OrderPageState>(
        "should emit Status.loading then Status.error with errorMessage, and orderValue equal 0",
        build: () => sut,
        act: (cubit) => cubit.getOrder(tableNumber: 1),
        expect: () => <OrderPageState>[
          OrderPageState(
              errorMessage: "",
              orders: [],
              orderValue: 0,
              status: Status.loading),
          OrderPageState(
              errorMessage: "error",
              orders: [],
              orderValue: 0,
              status: Status.error)
        ],
      );
    });
  });

  group("addOrder", () {
    test("should call orderRepository.addOrder() once", () async {
      //1
      when(
        () => repository.addOrder(
            tableNumber: 1, name: "name", quantity: 1, price: 1, type: "type"),
      ).thenAnswer((_) async => []);
      //2
      await sut.addOrder(
          type: "type", tableNumber: 1, name: "name", quantity: 1, price: 1);
      //3

      verify(
        () => repository.addOrder(
            tableNumber: 1, name: "name", quantity: 1, price: 1, type: "type"),
      ).called(1);
    });
  });
  group("addOrderToDo", () {
    test("should call orderRepository.addOrderToDo() once", () async {
      //1
      when(
        () => repository.addOrderToDo(
            tableNumber: 1, name: "name", quantity: 1, type: "type"),
      ).thenAnswer((_) async => []);
      //2
      await sut.addOrderToDo(
        type: "type",
        tableNumber: 1,
        name: "name",
        quantity: 1,
      );
      //3

      verify(
        () => repository.addOrderToDo(
            tableNumber: 1, name: "name", quantity: 1, type: "type"),
      ).called(1);
    });
  });
  group("removePreOrder", () {
    test("should call orderRepository.removePreOrder() once", () async {
      //1
      when(
        () => repository.removePreOrder(id: "1"),
      ).thenAnswer((_) async => []);
      //2
      await sut.removePreOrder(id: "1");
      //3

      verify(
        () => repository.removePreOrder(id: "1"),
      ).called(1);
    });
  });
  group("removeOrder", () {
     test("should call orderRepository.removeOrder() once", () async {
      //1
      when(
        () => repository.removeOrder(id: "1"),
      ).thenAnswer((_) async => []);
      //2
      await sut.removeOrder(id: "1");
      //3

      verify(
        () => repository.removeOrder(id: "1"),
      ).called(1);
    });
  });
}
