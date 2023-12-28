import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_drink_app/app/injection_container.dart';
import 'package:quick_drink_app/domain/models/to_do_model.dart';

import 'package:quick_drink_app/features/pages/kitchen_page/cubit/kitchen_page_cubit.dart';

class KitchenPage extends StatelessWidget {
  const KitchenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<KitchenPageCubit>()..getOrderbyType(type: "dish"),
      child: BlocBuilder<KitchenPageCubit, KitchenPageState>(
          builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orange,
            title: Text(
              "Kitchen",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            centerTitle: true,
          ),
          body: ListView(
            children: [
              Column(
                children: [
                  for (final order in state.orders) ...[
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Dismissible(
                        key: ValueKey(order.id),
                        onDismissed: (_) {
                          getIt<KitchenPageCubit>()
                              .removeToDoOrder(id: order.id);
                        },
                        child: ItemWidget(
                          order: order,
                        ),
                      ),
                    ),
                  ]
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}

class ItemWidget extends StatelessWidget {
  const ItemWidget({
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
                          Text("Name:",
                              style: Theme.of(context).textTheme.titleLarge),
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
