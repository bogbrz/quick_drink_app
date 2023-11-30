class DrinkModel {
  DrinkModel({
    required this.name,
    required this.drinkId,
    required this.price,
    required this.ingredients,
  });

  final String name;
  final int drinkId;
  final double price;
  final String ingredients;

  DrinkModel.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        price = json["price"] + 0.0,
        ingredients = json['ingredients'],
        drinkId = json["drink_id"];
}
