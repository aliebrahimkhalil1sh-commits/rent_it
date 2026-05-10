import 'package:flutter/material.dart';

class Buildsectionheader extends StatelessWidget {
  const Buildsectionheader({
    super.key,
    required this.title,
    required this.actionText,
  });
  final String title;
  final String actionText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title.toUpperCase(),
            style: const TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 21,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.6,
            ),
          ),
        ),
        Text(
          actionText,
          style: const TextStyle(
            color: Color.fromARGB(255, 255, 244, 243),
            fontSize: 13,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }
}
