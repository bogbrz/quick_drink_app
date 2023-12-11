import 'package:flutter/material.dart';
import 'package:quick_drink_app/features/pages/menu_page/dishes_page/dishes_page.dart';
import 'package:quick_drink_app/features/pages/menu_page/drinks_page/drinks_page.dart';
import 'package:quick_drink_app/features/pages/menu_page/order_page/order_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({
    super.key,
    required this.tableNumber,
  });
  final int tableNumber;

  @override
  State<MenuPage> createState() => _MenuPageState();
}

var pageIndex = 0;

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        if (pageIndex == 0) {
          return DishesPage(
            tableNumber: widget.tableNumber,
          );
        }
        if (pageIndex == 1) {
          return DrinksPage(
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
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.food_bank,
            ),
            label: "Dishes",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_drink),
            label: "Drinks",
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
