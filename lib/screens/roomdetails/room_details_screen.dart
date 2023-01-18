import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/assets/app_colors.dart';
import '../../common/assets/app_icons.dart';
import '../../common/extensions/extensions.dart';
import '../../common/widgets/container_icon.dart';
import '../../common/widgets/custom_slider.dart';
import '../../models/smart_item_model.dart';
import '../dashboard/components/frequently_item.dart';

class RoomDetailsScreen extends StatefulWidget {
  const RoomDetailsScreen({Key? key}) : super(key: key);

  @override
  State<RoomDetailsScreen> createState() => _RoomDetailsScreenState();
}

class _RoomDetailsScreenState extends State<RoomDetailsScreen> {
  double _value = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Living Room',
          style: context.textTheme.titleMedium?.copyWith(
            fontSize: 20,
          ),
        ),
        leading: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => context.navigator.maybePop(),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SvgPicture.asset(
              AppIcons.iconNavigateBack,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 32,
                ),
                FrequentlyUsedItem(
                  value: true,
                  onChange: (value) {},
                  smartItem: const SmartItemModel(
                    name: 'Air Conditioner',
                    activeCount: 2,
                    iconPath: AppIcons.iconAirConditioner,
                  ),
                ),
                const SizedBox(
                  height: 64,
                ),
                Center(
                  child: Text(
                    '$_value°',
                    style: context.textTheme.titleLarge?.copyWith(
                      fontSize: 64,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'Celsius',
                    style: context.textTheme.titleLarge?.copyWith(
                      fontSize: 14,
                    ),
                  ),
                ),
                CustomSlider(
                  value: _value,
                  onDragging: (handlerIndex, lowerValue, upperValue) {
                    setState(() {
                      _value = lowerValue;
                    });
                  },
                  labelBuilder: (double value) {
                    return Text(
                      '$value°',
                      style: context.textTheme.titleMedium,
                    );
                  },
                ),
                Text(
                  'Swing',
                  style: context.textTheme.titleLarge?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ContainerIcon(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                        ),
                        asset: AppIcons.iconHorizontalSwing,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            8,
                          ),
                          color: AppColors.background,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: ContainerIcon(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                        ),
                        asset: AppIcons.iconVerticalSwing,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            8,
                          ),
                          color: AppColors.background,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
