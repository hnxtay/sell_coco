import 'dart:math';

import 'package:another_xlider/another_xlider.dart';
import 'package:flutter/material.dart';

import '../assets/app_colors.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({
    Key? key,
    required this.value,
    required this.onDragging,
    required this.labelBuilder,
    this.axis = Axis.horizontal,
    this.verticalHeight = 200,
    this.rtl,
    required this.min,
    required this.max,
    this.sliderStep = const FlutterSliderStep(),
  }) : super(key: key);
  final double value;
  final Function(int handlerIndex, dynamic lowerValue, dynamic upperValue)
      onDragging;
  final Widget Function(double value) labelBuilder;
  final Axis axis;
  final double verticalHeight;
  final bool? rtl;
  final double min;
  final double max;
  final FlutterSliderStep sliderStep;

  double? get _verticalHeight => axis == Axis.vertical ? verticalHeight : null;

  bool get _rtl => axis == Axis.vertical ? true : false;

  double get _rotateAngle => axis == Axis.vertical ? -pi / 2 : pi;

  double get _translateOffsetX => value <= 2
      ? 0
      : axis == Axis.vertical
          ? -8
          : 8;

  double get _handlerLeftMargin => axis == Axis.vertical ? 0 : 32;

  double get _handlerBottomMargin => axis == Axis.vertical ? 32 : 0;

  Alignment get _handlerAliment =>
      axis == Axis.vertical ? Alignment.bottomCenter : Alignment.centerLeft;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Stack(
        children: [
          SizedBox(
            height: _verticalHeight,
            child: FlutterSlider(
              axis: axis,
              rtl: rtl ?? _rtl,
              values: [value],
              max: max,
              min: min,
              handlerHeight: 20,
              handlerWidth: 4,
              step: sliderStep,
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
                child: Transform.rotate(
                  angle: _rotateAngle,
                  child: Transform.translate(
                    offset: Offset(
                      _translateOffsetX,
                      0,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          8,
                        ),
                        color: Colors.white,
                      ),
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
          ),
          Positioned.fill(
            left: _handlerLeftMargin,
            bottom: _handlerBottomMargin,
            child: Align(
              alignment: _handlerAliment,
              child: labelBuilder(value),
            ),
          )
        ],
      );
    });
  }
}
