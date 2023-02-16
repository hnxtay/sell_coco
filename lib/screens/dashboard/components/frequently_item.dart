import 'package:flutter/material.dart';

import '../../../common/assets/app_colors.dart';
import '../../../common/extensions/context.dart';
import '../../../common/widgets/app_switch.dart';
import '../../../common/widgets/container_icon.dart';
import '../../../l10n/l10n.dart';
import '../../../models/smart_item_model.dart';

class FrequentlyUsedItem extends StatelessWidget {
  const FrequentlyUsedItem({
    Key? key,
    required this.value,
    required this.onChange,
    required this.smartItem,
  }) : super(key: key);

  final bool value;
  final Function(bool value) onChange;
  final SmartItemModel smartItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          12,
        ),
        color: AppColors.background,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ContainerIcon(
                  asset: smartItem.iconPath,
                  padding: const EdgeInsets.all(8,),
                ),
                const Spacer(),
                AppSwitch(
                  value: value,
                  onChange: onChange,
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              smartItem.name,
              style: context.textTheme.titleMedium?.copyWith(
                fontSize: 16,
              ),
            ),
            Text(
              '${smartItem.activeCount} ${context.l10n.text_active}',
              style: context.textTheme.bodyMedium,
            )
          ],
        ),
      ),
    );
  }
}
