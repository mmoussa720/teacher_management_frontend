import 'package:flutter/widgets.dart';

class AppStyle extends TextStyle {
  final double size;
  final FontWeight weight;
  final Color fontColor;
  const AppStyle({
    required this.size,
    required this.weight,
    required this.fontColor,
  }) : super(color: fontColor, fontWeight: weight, fontSize: size);
}
