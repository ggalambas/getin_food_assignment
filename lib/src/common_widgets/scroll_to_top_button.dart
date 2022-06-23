import 'package:flutter/material.dart';

class ScrollToTopButton extends StatelessWidget {
  final ScrollController controller;
  const ScrollToTopButton({super.key, required this.controller});

  bool isShowing(BuildContext context) =>
      controller.offset > MediaQuery.of(context).size.height * 0.5;

  void scrollToTop() => controller.animateTo(0,
      duration: const Duration(milliseconds: 200), curve: Curves.ease);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          transitionBuilder: (child, animation) =>
              ScaleTransition(scale: animation, child: child),
          child: isShowing(context)
              ? FloatingActionButton.small(
                  onPressed: scrollToTop,
                  child: const Icon(Icons.arrow_upward),
                )
              : null,
        );
      },
    );
  }
}
