
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: DecoratedBox(
          decoration:
              BoxDecoration(border: Border.all(width: 2, color: Colors.black)),
          child: Text(
            "dupa1",
          ),
        ),
      ),
    );
  }
}
