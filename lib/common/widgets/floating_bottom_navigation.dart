import 'package:flutter/material.dart';

import '../assets/app_colors.dart';

typedef FloatingBottomNavWidgetBuilder = Widget Function(
    BuildContext context, int index, int currentIndex);

class FloatingBottomNavigation extends StatelessWidget {
  const FloatingBottomNavigation(
      {Key? key,
      required this.itemBuilder,
      required this.itemCount,
      this.onItemClicked,
      required this.currentIndex})
      : assert(itemCount >= 0 && itemCount <= 5),
        super(key: key);

  final FloatingBottomNavWidgetBuilder itemBuilder;
  final int itemCount;
  final Function(int index)? onItemClicked;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 32,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          16,
        ),
        color: AppColors.maybeBlack,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: List.generate(
          itemCount,
          (index) => GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => onItemClicked?.call(index),
            child: itemBuilder(
              context,
              index,
              currentIndex,
            ),
          ),
        ),
      ),
    );
  }
}
