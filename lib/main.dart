import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quick_drink_app/firebase_options.dart';
import 'package:quick_drink_app/features/pages/bar_page/bar_page.dart';
import 'package:quick_drink_app/features/pages/tables_page/tables_page.dart';
import 'package:quick_drink_app/features/pages/kitchen_page/kitchen_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

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

class RootPage extends StatefulWidget {
  const RootPage({
    super.key,
  });

  @override
  State<RootPage> createState() => _RootPageState();
}

var pageIndex = 0;

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        if (pageIndex == 0) {
          return TablePage();
        }
        if (pageIndex == 1) {
          return BarPage();
        } else {
          return KitchenPage();
        }
      }),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (newIndex) {
          setState(() {
            pageIndex = newIndex;
          });
        },
        currentIndex: pageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.table_bar,
            ),
            label: "Tables",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_drink),
            label: "Bar",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank),
            label: "Kitchen",
          ),
        ],
      ),
    );
  }
}
