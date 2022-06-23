import 'dart:convert';

import 'package:getin_food_assignment/src/features/food/domain/food.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:slim/slim.dart';

class FoodRepository extends SlimApi {
  FoodRepository() : super('https://random-data-api.com/api');

  Future<List<Food>> fetchFoodList(int itemCount) async {
    final res = await get('food/random_food?size=$itemCount');
    if (!res.success) throw Exception();

    final parsedJson = jsonDecode(res.body) as List;
    return parsedJson.map((json) => Food.fromJson(json)).toList();
  }
}
