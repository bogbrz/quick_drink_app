import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_drink_app/app/injection_container.dart';

import 'package:quick_drink_app/features/pages/bar_kitchen_table_pages/bar_page/cubit/bar_page_cubit.dart';
import 'package:quick_drink_app/features/pages/widgets/order_widget.dart';

class BarPage extends StatelessWidget {
  const BarPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<BarPageCubit>()..getOrderbyType(type: "drink"),
      child: BlocBuilder<BarPageCubit, BarPageState>(
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                shape: const Border(
                    bottom: BorderSide(color: Colors.black, width: 2)),
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
                          child: OrderWidget(
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


