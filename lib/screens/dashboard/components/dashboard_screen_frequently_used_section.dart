import 'package:flutter/material.dart';

import '../../../common/assets/app_icons.dart';
import '../../../common/extensions/context.dart';
import '../../../l10n/l10n.dart';
import '../../../models/smart_item_model.dart';
import 'frequently_item.dart';

class DashboardScreenFrequentlyUsedSection extends StatelessWidget {
  const DashboardScreenFrequentlyUsedSection({Key? key}) : super(key: key);

  List<SmartItemModel> get smartItems => [
        const SmartItemModel(
          name: 'Smart TV',
          activeCount: 2,
          iconPath: AppIcons.iconSmartTV,
        ),
        const SmartItemModel(
          name: 'Lights',
          activeCount: 0,
          iconPath: AppIcons.iconSmartLight,
        ),
        const SmartItemModel(
          name: 'Air Purifier',
          activeCount: 1,
          iconPath: AppIcons.iconAirPurifier,
        ),
        const SmartItemModel(
          name: 'Air Conditioner',
          activeCount: 1,
          iconPath: AppIcons.iconAirConditioner,
        ),
        const SmartItemModel(
          name: 'Fans',
          activeCount: 2,
          iconPath: AppIcons.iconSmartFan,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.text_frequently_used,
          style: context.textTheme.titleMedium?.copyWith(
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        GridView.count(
          shrinkWrap: true,
          primary: false,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          children: smartItems
              .map(
                (smartItem) => FrequentlyUsedItem(
                  value: true,
                  onChange: (value) {},
                  smartItem: smartItem,
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
