
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_drink_app/app/injection_container.dart';
import 'package:quick_drink_app/app/root_page/cubit/root_page_cubit.dart';

import 'package:quick_drink_app/features/pages/bar_kitchen_table_pages/navigator_page_1.dart';
import 'package:quick_drink_app/features/pages/login_user_pages/log_in/log_in_page.dart';


class RootPage extends StatelessWidget {
  const RootPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<RootPageCubit>()..authStateChanges(),
        child: BlocBuilder<RootPageCubit, RootPageState>(
            builder: (context, state) {
          if (state.user == null) {
            return const LogInPage();
          }
          return const NavigatorPage1();
        }));
  }
}
