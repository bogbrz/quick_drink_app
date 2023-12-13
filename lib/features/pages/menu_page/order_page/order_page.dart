import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_drink_app/data_source/pre_order_remote_data_source.dart';
import 'package:quick_drink_app/domain/models/order_model.dart';
import 'package:quick_drink_app/domain/repositories/pre_order_repository.dart';
import 'package:quick_drink_app/features/pages/menu_page/order_page/cubit/order_page_cubit.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key, required this.tableNumber});
  final int tableNumber;

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    var value = 0.0;
    return BlocProvider(
      create: (context) => OrderPageCubit(
          preOrdersRepository: PreOrdersRepository(
              preOrderRemoteDataSource: PreOrderRemoteDataSource())),
      child: Scaffold(
          appBar: AppBar(
            title: Text("Order table ${widget.tableNumber}"),
          ),
          body: BlocBuilder<OrderPageCubit, OrderPageState>(
            builder: (context, state) {
              context
                  .read<OrderPageCubit>()
                  .getPreOrder(tableNumber: widget.tableNumber);

              return Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        for (final order in state.orders) ...[
                          OrderWidget(
                            order: order,
                          ),
                        ]
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 12,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.black)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: state.orders.isEmpty ? null : () {},
                          child: Text("Order"),
                        ),
                        Text("Sum: ${state.orderValue} ")
                      ],
                    ),
                  )
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
                        Text(
                          "Name",
                        ),
                        Text(order.name),
                      ],
                    ),
                    Column(
                      children: [
                        Text("Quantity"),
                        Text(order.quantity.toString()),
                      ],
                    ),
                    Column(
                      children: [
                        Text("Price"),
                        Text(order.price.toString()),
                      ],
                    ),
                    Column(
                      children: [
                        Text("Sum up"),
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
