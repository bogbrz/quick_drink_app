import 'package:flutter/material.dart';

class KitchenPage extends StatelessWidget {
  const KitchenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Kitchen",
        ),
        centerTitle: true,
      ),
      body: ListView(children: []),
    );
    
  }
}
