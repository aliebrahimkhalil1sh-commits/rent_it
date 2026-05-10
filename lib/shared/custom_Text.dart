import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.fontWeight,
    required this.color,
    required this.fontSize,
    required this.text,
  });
  final FontWeight fontWeight;
  final Color color;
  final double? fontSize;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: 2,
      textScaler: const TextScaler.linear(1.0),
      text,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: fontSize ?? 16,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
