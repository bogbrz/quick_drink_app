import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:quick_drink_app/domain/models/menu_position_model.dart';


import 'package:quick_drink_app/features/pages/menu_order_add_pages/menu_page/cubit/menu_page_cubit.dart';

class DishesListWidget extends StatefulWidget {
  const DishesListWidget({
    super.key,
    required this.dish,
    required this.tableNumber,
  });

  final MenuPositionModel dish;
  final int tableNumber;

  @override
  State<DishesListWidget> createState() => _DishesListWidgetState();
}

class _DishesListWidgetState extends State<DishesListWidget> {
  var counter = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.height * 0.3,
            margin: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: Colors.orange,
              border: Border.all(
                width: 2,
                color: Colors.black,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.dish.name,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      Text(
                        "Price: ${widget.dish.price.toString()}",
                        style: Theme.of(context).textTheme.titleMedium,
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Text(
                        "Ingredients: ${widget.dish.ingredients}",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      iconSize: (MediaQuery.of(context).size.width * 0.25) / 3,
                      onPressed: () {
                        setState(() {
                          counter++;
                        });
                      },
                      icon: const Icon(Icons.add_box_rounded),
                    ),
                    IconButton(
                        onPressed: counter == 0
                            ? null
                            : () {
                                setState(() {
                                  counter = counter - 1;
                                });
                              },
                        iconSize:
                            (MediaQuery.of(context).size.width * 0.25) / 3,
                        icon: const Icon(Icons.remove_circle)),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 24),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent,
                  border: Border.all(
                    width: 2,
                    color: Colors.black,
                  ),
                ),
                width: MediaQuery.of(context).size.width * 0.2,
                height: MediaQuery.of(context).size.height * 0.15 - 8,
                child: Text(
                  "$counter",
                  style: const TextStyle(fontSize: 45),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              InkWell(
                onTap: counter == 0
                    ? null
                    : () {
                        context.read<MenuPageCubit>().addDishToPreOrders(
                            tableNumber: widget.tableNumber,
                            name: widget.dish.name,
                            price: widget.dish.price,
                            quantity: counter,
                            type: widget.dish.type);
                        setState(() {
                          counter = 0;
                        });
                      },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    border: Border.all(
                      width: 2,
                      color: Colors.black,
                    ),
                  ),
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height * 0.15 - 8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          "Add",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      const Icon(Icons.add_box_outlined)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
