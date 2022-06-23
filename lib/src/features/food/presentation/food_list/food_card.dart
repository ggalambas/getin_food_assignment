import 'package:flutter/material.dart';
import 'package:getin_food_assignment/src/features/food/domain/food.dart';

class FoodCard extends StatelessWidget {
  final Food food;
  final VoidCallback? onPressed;

  const FoodCard({super.key, required this.food, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(food.name),
        ),
      ),
    );
  }
}
