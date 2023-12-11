import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_drink_app/data_source/pre_order_remote_data_source.dart';
import 'package:quick_drink_app/domain/models/order_model.dart';
import 'package:quick_drink_app/domain/repositories/pre_order_repository.dart';
import 'package:quick_drink_app/features/pages/menu_page/order_page/cubit/order_page_cubit.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key, required this.tableNumber});
  final int tableNumber;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderPageCubit(
          preOrdersRepository: PreOrdersRepository(
              preOrderRemoteDataSource: PreOrderRemoteDataSource())),
      child: Scaffold(
          appBar: AppBar(
            title: Text("Order table ${tableNumber}"),
          ),
          body: BlocBuilder<OrderPageCubit, OrderPageState>(
            builder: (context, state) {
              context.read<OrderPageCubit>().getPreOrder();
              return Column(
                children: [
                  Center(child: Text("Dishes")),
                  Expanded(
                    child: ListView(
                      children: [
                        for (final dish in state.orders) ...[
                          if (dish.type == "dish" &&
                              dish.tableNumber == tableNumber) ...[
                            OrderWidget(
                              order: dish,
                            ),
                          ]
                        ]
                      ],
                    ),
                  ),
                  Center(child: Text("Drinks")),
                  Expanded(
                    child: ListView(
                      children: [
                        for (final drink in state.orders) ...[
                          if (drink.type == "drink" &&
                              drink.tableNumber == tableNumber)
                            OrderWidget(
                              order: drink,
                            ),
                        ]
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
        decoration: BoxDecoration(border: Border.all()),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("order"),
                  Text("Quantity"),
                  Text("Price"),
                  Text("Sum up")
                ]),
          ),
          Row(
            children: [
              Text(order.tableNumber.toString()),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Text(order.name),
            Text(order.quantity.toString()),
            Text(order.price.toString()),
            Text((order.price * order.quantity).toString())
          ]),
        ]),
      ),
    );
  }
}
