import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rent_it/features/Home/Widgets/statecard.dart';

class Buildstatssection extends StatelessWidget {
  const Buildstatssection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        children: [
          Expanded(
            child: Statecard(
              title: "13",
              subtitle: "Listings",
              icon: CupertinoIcons.cube_box,
            ),
          ),
          const Gap(12),
          Expanded(
            child: Statecard(
              title: "8",
              subtitle: "Cities",
              icon: CupertinoIcons.location,
            ),
          ),
          const Gap(12),
          Expanded(
            child: Statecard(
              title: "10",
              subtitle: "Types",
              icon: CupertinoIcons.square_grid_2x2,
            ),
          ),
        ],
      ),
    );
  }
}
