import 'package:flutter/material.dart';

import '../../../common/assets/app_icons.dart';
import '../../../models/smart_item_model.dart';
import 'smart_item.dart';

class DashboardScreenTopSection extends StatelessWidget {
  const DashboardScreenTopSection({Key? key}) : super(key: key);

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
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: smartItems
            .map(
              (smartItem) => SmartItem(
                smartItem: smartItem,
              ),
            )
            .toList(),
      ),
    );
  }
}
