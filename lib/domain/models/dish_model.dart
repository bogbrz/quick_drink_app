class DishModel {
  DishModel(
      {required this.ingredients,
      required this.price,
      required this.name,
      required this.mealId});

  final String ingredients;
  final double price;
  final String name;
  final int mealId;

  DishModel.fromJson(Map<String, dynamic> json)
      : ingredients = json["ingredients"],
        price = json['price'] + 0.0,
        name = json['name'],
        mealId = json["meal_id"];
}
