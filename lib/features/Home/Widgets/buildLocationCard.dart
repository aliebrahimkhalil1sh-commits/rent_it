import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

Widget activeLocationCard({
  required String city,
  required String count,
  required String image,
}) {
  return Container(
    width: 250,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(26),
      image: DecorationImage(
        image: AssetImage(image),
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(
          Colors.black.withOpacity(0.45),
          BlendMode.darken,
        ),
      ),
    ),
    padding: const EdgeInsets.all(18),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          count,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),

        const Gap(8),

        Text(
          city,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w900,
          ),
        ),

        const Gap(6),

        const Text(
          "Browse city",
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
