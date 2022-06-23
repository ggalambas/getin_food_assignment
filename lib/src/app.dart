import 'package:flutter/material.dart';
import 'package:getin_food_assignment/src/features/food/data/food_repository.dart';
import 'package:getin_food_assignment/src/features/food/presentation/food_controller.dart';
import 'package:getin_food_assignment/src/features/food/presentation/food_list/food_list_screen.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:slim/slim.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiSlim(
      slimers: [
        Slimer<FoodRepository>(FoodRepository()),
        Slimer<FoodController>(FoodController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Food',
        theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
          colorSchemeSeed: Colors.indigo,
        ),
        home: const FoodListScreen(),
      ),
    );
  }
}
