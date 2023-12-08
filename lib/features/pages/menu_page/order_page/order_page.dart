import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key, required this.tableNumber});
  final int tableNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Order table ${tableNumber}"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Name"),
                    Text("Quantity"),
                    Text("Price"),
                    Text("Sum up")
                  ]),
            ),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      decoration: BoxDecoration(border: Border.all()),
                      child: Column(children: [
                        Row(
                          children: [
                            Text("tablenumber"),
                          ],
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Spaghetii"),
                              Text("5"),
                              Text("14"),
                              Text("70")
                            ]),
                      ]),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
