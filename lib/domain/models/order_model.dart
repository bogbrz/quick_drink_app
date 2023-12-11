class OrderModel {
  OrderModel({
    required this.name,
    required this.quantity,
    required this.price,
    required this.tableNumber,
    required this.type,
  });

  final String name;
  final int quantity;
  final double price;
  final int tableNumber;
  final String type;
}
