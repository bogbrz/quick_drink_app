import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_drink_app/data_source/order_remote_data_source.dart';
import 'package:quick_drink_app/domain/repositories/order_repository.dart';
import 'package:quick_drink_app/features/pages/kitchen_page/cubit/kitchen_page_cubit.dart';

class KitchenPage extends StatelessWidget {
  const KitchenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => KitchenPageCubit(
          orderRepository:
              OrderRepository(orderRemoteDataSource: OrderRemotDataSource()))
        ..getOrderbyType(),
      child: BlocBuilder<KitchenPageCubit, KitchenPageState>(
          builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: const Text(
                "Kitchen",
              ),
              centerTitle: true,
            ),
            body: Column(
              children: [
                for (final order in state.orders) ...[
                  SizedBox(
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
                        SizedBox(
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
      }),
    );
  }
}
