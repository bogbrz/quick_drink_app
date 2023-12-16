class MenuPositionModel {
  MenuPositionModel(
      {required this.name,
      required this.id,
      required this.price,
      required this.ingredients,
      required this.type});

  final String name;
  final String id;
  final double price;
  final String ingredients;
  final String type;

  MenuPositionModel.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        price = json["price"] + 0.0,
        ingredients = json['ingredients'],
        id = json["id"],
        type = json['type'];
}
