import 'package:flutter/material.dart';
import 'package:getin_food_assignment/src/features/food/domain/food.dart';
import 'package:getin_food_assignment/src/features/food/presentation/food_controller.dart';
import 'package:getin_food_assignment/src/features/food/presentation/food_screen/food_editor_dialog.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:slim/slim.dart';

class FoodScreen extends SlimWidget<FoodController> {
  final String foodId;

  // ignore: use_key_in_widget_constructors
  FoodScreen({required this.foodId});

  void editName(
      BuildContext context, FoodController controller, Food food) async {
    final editedFood = await showDialog<Food?>(
      context: context,
      builder: (context) => FoodEditorDialog(food: food),
    );
    if (editedFood != null) controller.updateFood(editedFood);
  }

  @override
  Widget slimBuild(BuildContext context, FoodController controller) {
    final food = controller.getFoodById(foodId);
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => editName(context, controller, food),
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(food.name, style: theme.textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text(food.description),
            const SizedBox(height: 24),
            Text('Ingredients'.toUpperCase(),
                style: theme.textTheme.labelSmall),
            const SizedBox(height: 8),
            Text('${food.measurement} ${food.ingredient}'),
          ],
        ),
      ),
    );
  }
}
