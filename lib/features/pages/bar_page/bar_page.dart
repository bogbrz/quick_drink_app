import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_drink_app/app/injection_container.dart';

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
                title: const Text(
                  "Bar",
                ),
                centerTitle: true,
              ),
              body: Column(
                children: [
                  for (final order in state.orders) ...[
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(border: Border.all()),
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(order.tableNumber.toString()),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                order.name,
                              ),
                              Text(order.quantity.toString())
                            ],
                          ),
                        ]),
                      ),
                    )
                  ]
                ],
              ));
        },
      ),
    );
  }
}
