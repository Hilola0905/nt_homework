import 'dart:ui';

import 'package:flutter/cupertino.dart';

class CalculatorItemModel{
  final Color color;
  final String? text;
  final Icon? icon;
  final VoidCallback onTap;
  final bool isIcon;
  CalculatorItemModel({
    required this.text,
    required this.icon,
    required this.isIcon,
    required this.onTap,
    required this.color,
});
}