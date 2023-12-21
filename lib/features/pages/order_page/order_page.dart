import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_drink_app/data_source/order_remote_data_source.dart';
import 'package:quick_drink_app/domain/models/order_model.dart';
import 'package:quick_drink_app/domain/repositories/order_repository.dart';
import 'package:quick_drink_app/features/pages/order_page/cubit/order_page_cubit.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key, required this.tableNumber});
  final int tableNumber;

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  var index = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderPageCubit(
          orderRepository:
              OrderRepository(orderRemoteDataSource: OrderRemotDataSource()))
        ..getPreOrder(tableNumber: widget.tableNumber),
      child: Scaffold(
          appBar: AppBar(
            shape:
                const Border(bottom: BorderSide(color: Colors.black, width: 2)),
            backgroundColor: Colors.orange,
            title: Text("Order table ${widget.tableNumber}",
                style: Theme.of(context).textTheme.headlineLarge),
          ),
          body: BlocConsumer<OrderPageCubit, OrderPageState>(
            listener: (context, state) {
              if (state.errorMessage.isNotEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.errorMessage.toString())));
              }
            },
            builder: (context, state) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            index = 0;
                            context
                                .read<OrderPageCubit>()
                                .getPreOrder(tableNumber: widget.tableNumber);
                          });
                        },
                        child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: index == 0
                                    ? Colors.deepOrange
                                    : Colors.orangeAccent,
                                border: Border(
                                    bottom: BorderSide(width: 2),
                                    right: BorderSide(width: 1))),
                            width: MediaQuery.of(context).size.width / 2,
                            height: MediaQuery.of(context).size.height * 0.05,
                            child: Text(
                              "Order",
                              style: Theme.of(context).textTheme.titleMedium,
                            )),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            index = 1;
                            context
                                .read<OrderPageCubit>()
                                .getOrder(tableNumber: widget.tableNumber);
                          });
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                color: index == 1
                                    ? Colors.deepOrange
                                    : Colors.orangeAccent,
                                border: Border(
                                    bottom: BorderSide(width: 2),
                                    left: BorderSide(width: 1))),
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width / 2,
                            height: MediaQuery.of(context).size.height * 0.05,
                            child: Text(
                              "Already Ordered",
                              style: Theme.of(context).textTheme.titleMedium,
                            )),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView(
                            children: [
                              for (final order in state.orders) ...[
                                if (index == 0) ...[
                                  Dismissible(
                                    key: ValueKey(order.id),
                                    onDismissed: (_) {
                                      context
                                          .read<OrderPageCubit>()
                                          .removePreOrder(id: order.id);
                                    },
                                    child: OrderWidget(
                                      order: order,
                                    ),
                                  ),
                                ] else ...[
                                  OrderWidget(order: order)
                                ]
                              ]
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.orange,
                              border:
                                  Border.all(width: 2, color: Colors.black)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: state.orders.isEmpty
                                    ? null
                                    : () {
                                        for (final order in state.orders) {
                                          if (index == 0) {
                                            context
                                                .read<OrderPageCubit>()
                                                .addOrder(
                                                    name: order.name,
                                                    price: order.price,
                                                    type: order.type,
                                                    tableNumber:
                                                        order.tableNumber,
                                                    quantity: order.quantity);
                                            context
                                                .read<OrderPageCubit>()
                                                .addOrderToDo(
                                                    name: order.name,
                                                    type: order.type,
                                                    tableNumber:
                                                        order.tableNumber,
                                                    quantity: order.quantity);

                                            context
                                                .read<OrderPageCubit>()
                                                .removePreOrder(id: order.id);
                                          } else {
                                            context
                                                .read<OrderPageCubit>()
                                                .removeOrder(id: order.id);
                                          }
                                        }
                                      },
                                child: Container(
                                    padding: const EdgeInsets.all(10),
                                    margin: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Colors.deepOrange,
                                        border: Border.all(width: 2),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: index == 0
                                        ? Text("Order",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineLarge)
                                        : Text("Finish",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineLarge)),
                              ),
                              Text("Sum: ${state.orderValue} ",
                                  style:
                                      Theme.of(context).textTheme.headlineLarge)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
          )),
    );
  }
}

class OrderWidget extends StatelessWidget {
  const OrderWidget({
    super.key,
    required this.order,
  });
  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        decoration: BoxDecoration(
            color: order.type == "dish" ? Colors.yellow : Colors.blue,
            border: Border.all()),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        const Text(
                          "Name",
                        ),
                        Text(order.name),
                      ],
                    ),
                    Column(
                      children: [
                        const Text("Quantity"),
                        Text(order.quantity.toString()),
                      ],
                    ),
                    Column(
                      children: [
                        const Text("Price"),
                        Text(order.price.toString()),
                      ],
                    ),
                    Column(
                      children: [
                        const Text("Sum up"),
                        Text((order.orderPrice).toString())
                      ],
                    )
                  ]),
            ),
          ]),
        ),
      ),
    );
  }
}