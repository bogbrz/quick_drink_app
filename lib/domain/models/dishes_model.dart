class DishesModel {
  DishesModel(
      {required this.ingredients,
      required this.price,
      required this.name,
      required this.mealId});

  final String ingredients;
  final int price;
  final String name;
  final int mealId;

  DishesModel.fromJson(Map<String, dynamic> json)
      : ingredients = json["ingredients"],
        price = json['price'],
        name = json['name'],
        mealId = json["meal_id"];
}
