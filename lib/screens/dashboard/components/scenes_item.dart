import 'package:flutter/material.dart';

import '../../../common/assets/app_assets.dart';
import '../../../common/assets/app_colors.dart';
import '../../../common/assets/app_icons.dart';
import '../../../common/extensions/extensions.dart';
import '../../../common/widgets/app_switch.dart';
import '../../../common/widgets/circle_icon.dart';

class ScenesItem extends StatelessWidget {
  const ScenesItem(
      {Key? key,
      required this.label,
      required this.value,
      required this.onChange})
      : super(key: key);
  final String label;
  final bool value;
  final Function(bool value) onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          12,
        ),
        color: AppColors.background,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      child: Row(
        children: [
          const CircleIcon(
            asset: AppIcons.iconAirPurifier,
            padding: 8,
          ),
          Expanded(
            child: Text(
              label,
              style: context.textTheme.titleMedium,
            ),
          ),
          AppSwitch(
            value: value,
            onChange: onChange,
          ),
        ],
      ),
    );
  }
}
