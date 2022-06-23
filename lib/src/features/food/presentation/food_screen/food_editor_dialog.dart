import 'package:flutter/material.dart';
import 'package:getin_food_assignment/src/features/food/domain/food.dart';
import 'package:getin_food_assignment/src/features/food/domain/mutable_food.dart';

class FoodEditorDialog extends StatefulWidget {
  final Food food;
  const FoodEditorDialog({super.key, required this.food});

  @override
  State<FoodEditorDialog> createState() => _FoodEditorDialogState();
}

class _FoodEditorDialogState extends State<FoodEditorDialog> {
  late final nameController = TextEditingController(text: widget.food.name);
  String get newName => nameController.value.text;

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: nameController,
      builder: (context, value, _) => AlertDialog(
        title: const Text('Edit food'),
        content: TextFormField(
          controller: nameController,
          decoration: const InputDecoration(labelText: 'Name'),
        ),
        actions: [
          TextButton(
            onPressed: Navigator.of(context).pop,
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: newName.isEmpty || newName == widget.food.name
                ? null
                : () {
                    final editedFood = widget.food.editName(newName);
                    Navigator.of(context).pop(editedFood);
                  },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
