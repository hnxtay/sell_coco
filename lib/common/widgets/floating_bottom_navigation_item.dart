import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../assets/app_colors.dart';
import '../extensions/extensions.dart';

class FloatingBottomNavigationItem extends StatelessWidget {
  const FloatingBottomNavigationItem(
      {Key? key, required this.item, required this.isActive})
      : super(key: key);
  final FloatingBottomNavigationItemModel item;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            8,
          ),
          color: isActive ? AppColors.darkBackground : AppColors.maybeBlack,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: AnimatedSize(
          duration: const Duration(milliseconds: 200),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                item.iconPath,
                height: 24,
              ),
              if (isActive)
                const SizedBox(
                  width: 8,
                ),
              if (isActive)
                Text(
                  item.label,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
            ],
          ),
        ),
      );
    });
  }
}

class FloatingBottomNavigationItemModel {
  final String label;
  final String iconPath;

  FloatingBottomNavigationItemModel(
      {required this.label, required this.iconPath});
}
