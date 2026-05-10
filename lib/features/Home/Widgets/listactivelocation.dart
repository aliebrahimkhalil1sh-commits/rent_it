import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rent_it/features/Home/Widgets/buildLocationCard.dart';

class Listactivelocation extends StatelessWidget {
  const Listactivelocation({
    super.key,
    required this.locations,
  });

  final List<Map<String, dynamic>> locations;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: locations.length,
        separatorBuilder: (context, index) {
          return const Gap(14);
        },
        itemBuilder: (context, index) {
          return activeLocationCard(
            city: locations[index]["city"]!,
            count: locations[index]["count"]!,
            image: locations[index]["image"]!,
          );
        },
      ),
    );
  }
}