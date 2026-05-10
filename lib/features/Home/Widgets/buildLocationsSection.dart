import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rent_it/features/Home/Widgets/buildSectionHeader.dart';
import 'package:rent_it/features/Home/Widgets/listactivelocation.dart';

class Buildlocationssection extends StatelessWidget {
  const Buildlocationssection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> locations = [
      {"city": "Ismailia", "count": "4 listings", "image": "images/rentit.png"},
      {"city": "Aswan", "count": "2 listings", "image": "images/rentit.png"},
      {
        "city": "Alexandria",
        "count": "1 listing",
        "image": "images/rentit.png",
      },
      {"city": "Asyut", "count": "1 listing", "image": "images/rentit.png"},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Buildsectionheader(title: "Active locations", actionText: "Explore"),

          const Gap(16),
          Listactivelocation(locations: locations),
        ],
      ),
    );
  }
}
