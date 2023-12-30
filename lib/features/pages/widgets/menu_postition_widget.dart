import 'package:flutter/material.dart';

import 'package:quick_drink_app/domain/models/menu_position_model.dart';





class MenuPositionWidget extends StatelessWidget {
  const MenuPositionWidget({
    super.key,
    required this.order,
  });
  final MenuPositionModel order;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      const Text(
                        "Price",
                      ),
                      Text(order.price.toString()),
                    ],
                  ),
                ]),
          ),
          Text(
            "Ingredients: ${order.ingredients}",
          ),
        ]),
      ),
    );
  }
}
