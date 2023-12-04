import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_drink_app/data_source/dishes_remote_data_source.dart';
import 'package:quick_drink_app/domain/repositories/dishes_repository.dart';
import 'package:quick_drink_app/features/pages/menu_page/add_page/cubit/add_page_cubit.dart';

class AddPage extends StatefulWidget {
  AddPage({
    super.key,
  });

  @override
  State<AddPage> createState() => _AddPageState();
}

var mealId = 1;

class _AddPageState extends State<AddPage> {
  final price = TextEditingController();

  final name = TextEditingController();

  final ingredients = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddPageCubit(
          dishesRepository: DishesRepository(
              dishesRemoteDataSource: DishesRemoteDataSource())),
      child: BlocBuilder<AddPageCubit, AddPageState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Add position to your menu"),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text("Name")),
                          controller: name,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 5,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text("Price")),
                          controller: price,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: (MediaQuery.of(context).size.width * 0.7) + 10,
                    child: TextField(
                      minLines: 1,
                      maxLines: 10,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text("Ingredients")),
                      controller: ingredients,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<AddPageCubit>().addDish(
                          name: name.text,
                          price: double.parse(price.text),
                          ingredients: ingredients.text,
                          mealId: mealId);
                      setState(() {
                        mealId++;
                      });
                      ingredients.clear();
                      price.clear();
                      name.clear();
                    },
                    child: Text(
                      "Add",
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
