import 'package:flutter/material.dart';

class BarPage extends StatelessWidget {
  const BarPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: DecoratedBox(
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.black)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Create your own menu",
              ),
            ),
          ),
        ),
      ),
    );
  }
}
