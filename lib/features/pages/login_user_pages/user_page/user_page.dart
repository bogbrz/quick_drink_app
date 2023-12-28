import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_drink_app/features/pages/login_user_pages/user_page/cubit/user_page_cubit.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserPageCubit(),
      child: BlocBuilder<UserPageCubit, UserPageState>(
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("you are logged as "),
                  ElevatedButton(
                      onPressed: () {
                        context.read<UserPageCubit>().signOut();
                        Navigator.of(context).pop();
                      },
                      child: Text("Sign out"))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
