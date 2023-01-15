import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/assets/app_colors.dart';
import '../../../common/extensions/extensions.dart';
import '../../../common/widgets/circle_icon.dart';
import '../../../l10n/l10n.dart';
import '../../../models/smart_item_model.dart';

class SmartItem extends StatelessWidget {
  final SmartItemModel smartItem;

  const SmartItem({Key? key, required this.smartItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 120,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            12,
          ),
          color: AppColors.primaryColor,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 8,
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 6,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleIcon(
              asset: smartItem.iconPath,
            ),
            const SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  smartItem.name,
                  style: context.textTheme.titleMedium,
                ),
                Text(
                  '${smartItem.activeCount} ${context.l10n.text_active}',
                  style: context.textTheme.bodyMedium,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
