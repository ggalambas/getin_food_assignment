typedef FoodId = String;

class Food {
  final FoodId id;
  final String name;
  final String description;
  final String ingredient;
  final String measurement;

  const Food({
    required this.id,
    required this.name,
    required this.description,
    required this.ingredient,
    required this.measurement,
  });

  factory Food.fromJson(Map<String, dynamic> data) {
    return Food(
      id: (data['id'] as int).toString(),
      name: data['dish'] as String,
      description: data['description'] as String,
      ingredient: data['ingredient'] as String,
      measurement: data['measurement'] as String,
    );
  }
}
