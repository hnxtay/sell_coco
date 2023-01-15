import 'package:flutter/material.dart';

import '../../../common/extensions/extensions.dart';
import '../../../l10n/l10n.dart';
import 'scenes_item.dart';

class DashboardScreenScenesSection extends StatelessWidget {
  const DashboardScreenScenesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.text_scenes,
          style: context.textTheme.titleMedium?.copyWith(
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        ListView.separated(
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return ScenesItem(
              label: 'Morning Scenes',
              value: false,
              onChange: (value) {},
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 16,
            );
          },
          itemCount: 2,
        ),
      ],
    );
  }
}
