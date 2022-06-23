import 'package:getin_food_assignment/src/features/food/data/food_repository.dart';
import 'package:getin_food_assignment/src/features/food/domain/food.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:slim/slim.dart';

class FoodController extends SlimController {
  late final repository = slim<FoodRepository>();
  late final pagingController = PagingController<int, Food>(firstPageKey: 30)
    ..addPageRequestListener(_fetchItems);

  @override
  void onDispose() {
    pagingController.dispose();
    super.onDispose();
  }

  Future<void> _fetchItems(itemsPerFetch) async {
    try {
      final newItems = await repository.fetchFoodList(itemsPerFetch);
      final noMoreItems = newItems.length < itemsPerFetch;
      noMoreItems
          ? pagingController.appendLastPage(newItems)
          : pagingController.appendPage(newItems, itemsPerFetch);
    } catch (error) {
      pagingController.error = error;
    }
  }

  Future<void> reload() async => pagingController.refresh();

  Food getFoodById(String id) =>
      pagingController.itemList!.firstWhere((food) => food.id == id);

  void updateFood(Food food) {
    final i = pagingController.itemList?.indexWhere((f) => f.id == food.id);
    if (i != null) pagingController.itemList![i] = food;
    updateUI();
  }
}
