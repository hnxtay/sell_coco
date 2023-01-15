import 'package:flutter/material.dart';

import '../assets/app_assets.dart';
import '../assets/app_colors.dart';

class AppSwitch extends StatelessWidget {
  const AppSwitch({Key? key, required this.value, required this.onChange})
      : super(key: key);
  final bool value;
  final Function(bool) onChange;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: value,
      onChanged: (value) => onChange(value),
      activeTrackColor: AppColors.primaryColor,
      inactiveTrackColor: AppColors.maybeBlack,
      thumbColor: const MaterialStatePropertyAll(Colors.white),
      activeThumbImage: const AssetImage(
        AppAssets.switchThumb,
      ),
      inactiveThumbImage: const AssetImage(
        AppAssets.inactiveSwitchThumb,
      ),
    );
  }
}
