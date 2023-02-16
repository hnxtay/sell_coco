import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContainerIcon extends StatelessWidget {
  const ContainerIcon({
    Key? key,
    required this.asset,
    this.assetSize = 24,
    this.padding,
    this.decoration,
    this.width,
    this.height,
  }) : super(key: key);
  final String asset;
  final double assetSize;
  final EdgeInsets? padding;
  final BoxDecoration? decoration;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return asset.isNotEmpty
        ? Container(
            width: width,
            height: height,
            decoration: decoration ??
                const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
            padding: padding ??
                const EdgeInsets.all(
                  4,
                ),
            child: SvgPicture.asset(
              asset,
              height: assetSize,
              width: assetSize,
            ),
          )
        : const SizedBox.shrink();
  }
}
