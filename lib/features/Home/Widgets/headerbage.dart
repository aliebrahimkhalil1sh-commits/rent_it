import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rent_it/features/Home/Widgets/buildOutlinedButton.dart';
import 'package:rent_it/features/Home/Widgets/buildPrimaryButton.dart';
import 'package:rent_it/features/Home/Widgets/buildbadge.dart';

class buildHeroSection extends StatelessWidget {
  const buildHeroSection(BuildContext context, {super.key});

  @override
  Widget build(BuildContext context) {
    return 




Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 85, left: 22, right: 22, bottom: 38),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff350000), Color(0xff8b0000), Color(0xffe62b22)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(34),
          bottomRight: Radius.circular(34),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Buildbadge(),

          const Gap(26),

          const Text(
            "Borrow instead\nof buying.",
            style: TextStyle(
              color: Colors.white,
              fontSize: 43,
              fontWeight: FontWeight.w900,
              height: 1.05,
              letterSpacing: -1,
            ),
          ),

          const Gap(16),

          const Text(
            "Rent useful gear fast, or share your own items and start earning from them.",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
              height: 1.55,
              fontWeight: FontWeight.w500,
            ),
          ),

          const Gap(28),

          Row(
            children: [
              Expanded(
                child: buildPrimaryButton(
                  text: "Browse",
                  icon: CupertinoIcons.search,
                  onPressed: () {},
                ),
              ),
              const Gap(12),
              Expanded(
                child: Buildoutlinedbutton(
                  text: "List item",
                  icon: CupertinoIcons.plus,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }  }
