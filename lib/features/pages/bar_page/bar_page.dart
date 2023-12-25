import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_drink_app/app/injection_container.dart';
import 'package:quick_drink_app/domain/models/to_do_model.dart';

import 'package:quick_drink_app/features/pages/bar_page/cubit/bar_page_cubit.dart';

class BarPage extends StatelessWidget {
  const BarPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<BarPageCubit>()..getOrderbyType(),
      child: BlocBuilder<BarPageCubit, BarPageState>(
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.orange,
                title: Text("Bar",
                    style: Theme.of(context).textTheme.headlineLarge),
                centerTitle: true,
              ),
              body: ListView(children: [
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
                            getIt<BarPageCubit>().removeToDoOrder(id: order.id);
                          },
                          child: ItemWidget(
                            order: order,
                          ),
                        ),
                      ),
                    ]
                  ],
                ),
              ]));
        },
      ),
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
                    style: Theme.of(context).textTheme.titleLarge)
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Expanded(
                child: Column(
                  children: [
                    Text("Name:",
                        style: Theme.of(context).textTheme.titleLarge),
                    Text(order.name,
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
          ]),
        ),
      ),
    );
  }
}
