import 'package:flutter/material.dart';
import 'package:quick_drink_app/app/root_page/root_page.dart';
import 'package:quick_drink_app/features/pages/bar_kitchen_table_pages/navigator_page_1.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
          useMaterial3: true,
        ),
        home: const RootPage());
  }
}
