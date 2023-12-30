import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_drink_app/app/injection_container.dart';

import 'package:quick_drink_app/features/pages/menu_order_add_pages/add_page/cubit/add_page_cubit.dart';
import 'package:quick_drink_app/features/pages/widgets/menu_postition_widget.dart';

class AddPage extends StatefulWidget {
  const AddPage({
    super.key,
  });

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  void initState() {
    super.initState();
    name.addListener(() {
      setState(() {});
    });
    price.addListener(() {
      setState(() {});
    });
  }

  final price = TextEditingController();

  final name = TextEditingController();

  final ingredients = TextEditingController();
  var mealId = 1;
  var mealType = 0;
  var drinkId = 1;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AddPageCubit>()
        ..getAddedData(type: mealType == 0 ? "dish" : "drink"),
      child: BlocBuilder<AddPageCubit, AddPageState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                InkWell(
                  onTap: name.text.isEmpty
                      ? null
                      : () {
                          getIt<AddPageCubit>().addPosition(
                              name: name.text,
                              price: double.parse(price.text) + 0.0,
                              ingredients: ingredients.text,
                              type: mealType == 0 ? "dish" : "drink");

                          Navigator.of(context).pop();
                        },
                  child: const Icon(
                    Icons.check,
                    size: 45,
                  ),
                ),
                const SizedBox(
                  width: 8,
                )
              ],
              title: Text("Add position",
                  style: Theme.of(context).textTheme.headlineLarge),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: TextField(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text(
                                "Name",
                              )),
                          controller: name,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 5,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text("Price")),
                          controller: price,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 2),
                        child: TextField(
                          minLines: 1,
                          maxLines: 10,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text("Ingredients")),
                          controller: ingredients,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          mealType == 0 ? mealType = 1 : mealType = 0;
                          setState(() {
                            context.read<AddPageCubit>().getAddedData(
                                type: mealType == 0 ? "dish" : "drink");
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width / 5,
                          height: MediaQuery.of(context).size.height / 13,
                          decoration: BoxDecoration(
                              color: mealType == 0
                                  ? Colors.green
                                  : Colors.blueAccent,
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(mealType == 0 ? "Dish" : "Drink"),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Text("Current Menu",
                          style: Theme.of(context).textTheme.headlineLarge),
                      Text("Swipe to remove",
                          style: Theme.of(context).textTheme.headlineSmall)
                    ],
                  ),
                  for (final position in state.postitions) ...[
                    const SizedBox(
                      height: 20,
                    ),
                    Dismissible(
                      background: const DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.red,
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Icon(Icons.delete),
                        ),
                      ),
                      key: ValueKey(position.id),
                      onDismissed: (_) {
                        context
                            .read<AddPageCubit>()
                            .removePosition(id: position.id);
                      },
                      child: MenuPositionWidget(order: position),
                    ),
                  ]
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

