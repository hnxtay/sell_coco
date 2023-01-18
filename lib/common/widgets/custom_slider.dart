import 'package:another_xlider/another_xlider.dart';
import 'package:flutter/material.dart';

import '../assets/app_colors.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider(
      {Key? key,
      required this.value,
      required this.onDragging,
      required this.labelBuilder})
      : super(key: key);
  final double value;
  final Function(int handlerIndex, dynamic lowerValue, dynamic upperValue)
      onDragging;
  final Widget Function(double value) labelBuilder;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Stack(
        children: [
          FlutterSlider(
            values: [value],
            max: 27,
            min: 16,
            handlerHeight: 20,
            handlerWidth: 4,
            trackBar: FlutterSliderTrackBar(
              activeTrackBar: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(
                    8,
                  ),
                  color: AppColors.primaryColor),
              inactiveTrackBar: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(
                  8,
                ),
              ),
              activeTrackBarHeight: 50,
              inactiveTrackBarHeight: 50,
              activeTrackBarDraggable: false,
            ),
            handler: FlutterSliderHandler(
              child: Transform.translate(
                offset: Offset(value <= 2 ? 0 : -8, 0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      8,
                    ),
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
            ),
            tooltip: FlutterSliderTooltip(
              disabled: true,
            ),
            onDragging: onDragging,
          ),
          Positioned.fill(
            left: 32,
            child: Align(
              alignment: Alignment.centerLeft,
              child: labelBuilder(value),
            ),
          )
        ],
      );
    });
  }
}
