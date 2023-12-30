import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_drink_app/app/injection_container.dart';
import 'package:quick_drink_app/app/root_page/cubit/root_page_cubit.dart';
import 'package:quick_drink_app/features/pages/login_user_pages/log_in/log_in_page.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RootPageCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("UserPanel",
              style: Theme.of(context).textTheme.headlineLarge),
          backgroundColor: Colors.orange,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("you are logged as ${emailController.text} ",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium),
              BlocBuilder<RootPageCubit, RootPageState>(
                builder: (context, state) {
                  return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                      ),
                      onPressed: () {
                        context.read<RootPageCubit>().signOut();
                        Navigator.of(context).pop();
                      },
                      child: Text("Sign out",
                          style: Theme.of(context).textTheme.headlineLarge));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
