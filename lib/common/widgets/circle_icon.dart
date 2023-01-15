import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CircleIcon extends StatelessWidget {
  const CircleIcon({
    Key? key,
    required this.asset,
    this.size = 24,
    this.padding = 4,
  }) : super(key: key);
  final String asset;
  final double size;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return asset.isNotEmpty
        ? Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            padding: EdgeInsets.all(
              padding,
            ),
            child: SvgPicture.asset(
              asset,
              height: size,
              width: size,
            ),
          )
        : const SizedBox.shrink();
  }
}
