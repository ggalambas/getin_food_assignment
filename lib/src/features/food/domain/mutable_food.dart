import 'food.dart';

extension MutableFood on Food {
  Food editName(String name) => Food(
        id: id,
        name: name,
        description: description,
        ingredient: ingredient,
        measurement: measurement,
      );
}
