import 'package:flutter/material.dart';

import 'components/dashboard_screen_frequently_used_section.dart';
import 'components/dashboard_screen_scenes_section.dart';
import 'components/dashboard_screen_top_section.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: const [
            DashboardScreenTopSection(),
            SizedBox(
              height: 24,
            ),
            DashboardScreenScenesSection(),
            SizedBox(
              height: 24,
            ),
            DashboardScreenFrequentlyUsedSection(),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
