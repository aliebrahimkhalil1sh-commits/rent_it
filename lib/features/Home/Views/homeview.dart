import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rent_it/core/constants/app_color.dart';
import 'package:rent_it/features/Home/Widgets/buildBrowseByTypeSection.dart';
import 'package:rent_it/features/Home/Widgets/buildFreshListingsSection.dart';
import 'package:rent_it/features/Home/Widgets/buildLocationsSection.dart';
import 'package:rent_it/features/Home/Widgets/buildStatsSection.dart';
import 'package:rent_it/features/Home/Widgets/headerbage.dart';

class Homeview extends StatelessWidget {
  const Homeview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFD32F2F), Color(0xFF8B0000)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              buildHeroSection(context),
              const Gap(28),
              Buildstatssection(),
              const Gap(28),
              Buildbrowsebytypesection(),
              const Gap(28),
              Buildfreshlistingssection(),
              const Gap(28),
              Buildlocationssection(),
              const Gap(120),
            ],
          ),
        ),
      ),
    );
  }
}
