import 'package:flutter/material.dart';

import 'package:quick_drink_app/domain/models/to_do_model.dart';

class OrderWidget extends StatelessWidget {
  const OrderWidget({
    super.key,
    required this.order,
  });
  final ToDoModel order;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
            color: order.type == "dish" ? Colors.yellow : Colors.blue,
            border: Border.all()),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Row(
              children: [
                Text("TableNumber: ${order.tableNumber.toString()}",
                    style: Theme.of(context).textTheme.headlineSmall)
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text("Name: ${order.name}",
                              style: Theme.of(context).textTheme.titleLarge),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Text("Quantity",
                            style: Theme.of(context).textTheme.titleLarge),
                        Text(order.quantity.toString(),
                            style: Theme.of(context).textTheme.titleLarge),
                      ],
                    ),
                  ]),
            ),
          ]),
        ),
      ),
    );
  }
}
