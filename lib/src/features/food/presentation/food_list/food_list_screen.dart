import 'package:flutter/material.dart';
import 'package:getin_food_assignment/src/common_widgets/scroll_to_top_button.dart';
import 'package:getin_food_assignment/src/features/food/domain/food.dart';
import 'package:getin_food_assignment/src/features/food/presentation/food_controller.dart';
import 'package:getin_food_assignment/src/features/food/presentation/food_screen/food_screen.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:slim/slim.dart';

import 'food_card.dart';

class FoodListScreen extends StatefulWidget {
  const FoodListScreen({super.key});

  @override
  State<FoodListScreen> createState() => _FoodListScreenState();
}

class _FoodListScreenState extends State<FoodListScreen> {
  final scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void openFoodScreen(String foodId) => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => FoodScreen(foodId: foodId)),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menu')),
      body: SlimBuilder<FoodController>(builder: (foodController) {
        return RefreshIndicator(
          onRefresh: foodController.reload,
          child: PagedListView(
            padding: const EdgeInsets.all(8),
            scrollController: scrollController,
            pagingController: foodController.pagingController,
            builderDelegate: PagedChildBuilderDelegate<Food>(
              itemBuilder: (context, food, _) => FoodCard(
                onPressed: () => openFoodScreen(food.id),
                food: food,
              ),
            ),
          ),
        );
      }),
      floatingActionButton: ScrollToTopButton(controller: scrollController),
    );
  }
}
