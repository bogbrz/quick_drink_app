import 'package:flutter/material.dart';
import 'package:quick_drink_app/features/pages/bar_kitchen_table_pages/bar_page/bar_page.dart';
import 'package:quick_drink_app/features/pages/bar_kitchen_table_pages/kitchen_page/kitchen_page.dart';
import 'package:quick_drink_app/features/pages/bar_kitchen_table_pages/tables_page/tables_page.dart';

class TabNavigatorPage extends StatefulWidget {
  const TabNavigatorPage({
    super.key,
  });

  @override
  State<TabNavigatorPage> createState() => _TabNavigatorPageState();
}



class _TabNavigatorPageState extends State<TabNavigatorPage> {
  var pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        if (pageIndex == 0) {
          return const TablePage();
        }
        if (pageIndex == 1) {
          return const BarPage();
        } else {
          return const KitchenPage();
        }
      }),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (newIndex) {
          setState(() {
            pageIndex = newIndex;
          });
        },
        currentIndex: pageIndex,
        items: const [
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