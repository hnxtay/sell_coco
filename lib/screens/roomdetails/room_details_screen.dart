import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/assets/app_icons.dart';
import '../../common/extensions/extensions.dart';
import '../../common/widgets/vertical_slider.dart';
import '../../models/smart_item_model.dart';
import '../dashboard/components/frequently_item.dart';

class RoomDetailsScreen extends StatefulWidget {
  const RoomDetailsScreen({Key? key}) : super(key: key);

  @override
  State<RoomDetailsScreen> createState() => _RoomDetailsScreenState();
}

class _RoomDetailsScreenState extends State<RoomDetailsScreen> {
  double _value = 10;
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
              children: [
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
                Text(
                  '32°',
                  style: context.textTheme.titleLarge?.copyWith(
                    fontSize: 64,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'Celsius',
                  style: context.textTheme.titleLarge?.copyWith(
                    fontSize: 14,
                  ),
                ),
                VerticalSlider(
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                      });
                    },
                    min: 0,
                    max: 100,
                    width: 40,
                    value: _value)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
