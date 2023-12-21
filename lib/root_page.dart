import 'package:flutter/material.dart';
import 'package:quick_drink_app/features/pages/menu_page/menu_page.dart';
import 'package:quick_drink_app/features/pages/order_page/order_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({
    super.key,
    required this.tableNumber,
  });
  final int tableNumber;

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
          return MenuPage(
            tableNumber: widget.tableNumber,
          );
        } else {
          return OrderPage(
            tableNumber: widget.tableNumber,
          );
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
              Icons.food_bank,
            ),
            label: "Menu",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: "Order",
          ),
        ],
      ),
    );
  }
}
