import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:rent_it/features/Home/Widgets/buildSectionHeader.dart';
import 'package:rent_it/features/Home/Widgets/buildTypeCard.dart';

class Buildbrowsebytypesection extends StatelessWidget {
  Buildbrowsebytypesection({super.key});
  final List<Map<String, dynamic>> types = [
    {
      "title": "Vehicles",
      "count": "4 live listings",
      "icon": CupertinoIcons.car_detailed,
    },
    {
      "title": "Electronics",
      "count": "3 live listings",
      "icon": CupertinoIcons.device_phone_portrait,
    },
    {
      "title": "Furniture",
      "count": "2 live listings",
      "icon": CupertinoIcons.home,
    },
    {
      "title": "Sports",
      "count": "2 live listings",
      "icon": CupertinoIcons.sportscourt,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Buildsectionheader(title: "Browse by type", actionText: "View all"),

          const Gap(16),

          GridView.builder(
            itemCount: types.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 14,
              mainAxisSpacing: 14,
              childAspectRatio: 1.05,
            ),
            itemBuilder: (context, index) {
              return Buildtypecard(
                title: types[index]["title"],
                count: types[index]["count"],
                icon: types[index]["icon"],
              );
            },
          ),
        ],
      ),
    );
  }
}
