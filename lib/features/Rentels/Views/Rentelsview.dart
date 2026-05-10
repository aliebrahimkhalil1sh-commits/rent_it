import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rent_it/core/constants/app_color.dart';

class Rentelsview extends StatefulWidget {
  const Rentelsview({super.key});

  @override
  State<Rentelsview> createState() => _RentelsviewState();
}

class _RentelsviewState extends State<Rentelsview> {
  List<Map<String, String>> rentals = [
    {
      "title": "Camera Stand",
      "owner": "Ahmed Ali",
      "city": "Aswan",
      "status": "Active",
      "date": "12 May - 15 May",
      "price": "300 EGP",
      "image": "images/rentit.png",
    },
    {
      "title": "PlayStation 5",
      "owner": "Omar Khaled",
      "city": "Giza",
      "status": "Pending",
      "date": "20 May - 22 May",
      "price": "200 EGP",
      "image": "images/rentit.png",
    },
  ];

  void cancelRental(int index) {
    setState(() {
      rentals.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final int totalRentals = rentals.length;
    final int activeRentals =
        rentals.where((item) => item["status"] == "Active").length;
    final int pendingRentals =
        rentals.where((item) => item["status"] == "Pending").length;

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildHeader(
              totalRentals: totalRentals,
              activeRentals: activeRentals,
              pendingRentals: pendingRentals,
            ),

            const Gap(24),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: rentals.isEmpty ? buildEmptyRentals() : buildRentalsList(),
            ),

            const Gap(120),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required int totalRentals,
    required int activeRentals,
    required int pendingRentals,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        top: 85,
        left: 22,
        right: 22,
        bottom: 35,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff350000),
            Color(0xff8b0000),
            Color(0xffe62b22),
          ],
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
          buildBadge(),

          const Gap(22),

          const Text(
            "Your rental\nactivity.",
            style: TextStyle(
              color: Colors.white,
              fontSize: 42,
              fontWeight: FontWeight.w900,
              height: 1.05,
            ),
          ),

          const Gap(14),

          const Text(
            "Track items you rented, review pending requests, and manage active rentals.",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 15,
              height: 1.5,
              fontWeight: FontWeight.w500,
            ),
          ),

          const Gap(24),

          Row(
            children: [
              buildInfoCard(
                title: totalRentals.toString(),
                subtitle: "Total",
                icon: CupertinoIcons.cube_box,
              ),
              const Gap(10),
              buildInfoCard(
                title: activeRentals.toString(),
                subtitle: "Active",
                icon: CupertinoIcons.check_mark_circled_solid,
              ),
              const Gap(10),
              buildInfoCard(
                title: pendingRentals.toString(),
                subtitle: "Pending",
                icon: CupertinoIcons.clock_fill,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.16),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Colors.white.withOpacity(0.20),
        ),
      ),
      child: const Text(
        "RENTALS",
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w900,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget buildInfoCard({
    required String title,
    required String subtitle,
    required IconData icon,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white.withOpacity(0.20),
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 24,
            ),
            const Gap(8),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
            Text(
              subtitle,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildEmptyRentals() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 42),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 86,
            height: 86,
            decoration: const BoxDecoration(
              color: Color(0xffffeeee),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              CupertinoIcons.cube_box,
              color: Color(0xffdf251c),
              size: 42,
            ),
          ),

          const Gap(20),

          const Text(
            "No rental activity yet",
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.w900,
            ),
          ),

          const Gap(10),

          Text(
            "When you rent an item, your rental requests and active rentals will appear here.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 14,
              height: 1.5,
              fontWeight: FontWeight.w500,
            ),
          ),

          const Gap(24),

          SizedBox(
            width: double.infinity,
            height: 54,
            child: ElevatedButton.icon(
              onPressed: () {
                // بعدين ممكن تفتح Browse tab
              },
              icon: const Icon(CupertinoIcons.search),
              label: const Text("Browse listings"),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: const Color(0xffdf251c),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                textStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRentalsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildSectionHeader(),

        const Gap(16),

        ListView.separated(
          itemCount: rentals.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          separatorBuilder: (context, index) {
            return const Gap(14);
          },
          itemBuilder: (context, index) {
            final rental = rentals[index];

            return buildRentalCard(
              index: index,
              title: rental["title"]!,
              owner: rental["owner"]!,
              city: rental["city"]!,
              status: rental["status"]!,
              date: rental["date"]!,
              price: rental["price"]!,
              image: rental["image"]!,
            );
          },
        ),
      ],
    );
  }

  Widget buildSectionHeader() {
    return Row(
      children: [
        const Expanded(
          child: Text(
            "MY RENTALS",
            style: TextStyle(
              color: Color.fromARGB(255, 12, 12, 12),
              fontSize: 22,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.6,
            ),
          ),
        ),
        Text(
          "${rentals.length} total",
          style: TextStyle(
            color: const Color.fromARGB(255, 255, 224, 224),
            fontSize: 13,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }

  Widget buildRentalCard({
    required int index,
    required String title,
    required String owner,
    required String city,
    required String status,
    required String date,
    required String price,
    required String image,
  }) {
    final bool isActive = status == "Active";
    final Color statusColor =
        isActive ? const Color(0xff138a36) : const Color(0xffd98b00);
    final Color statusBackground =
        isActive ? const Color(0xffeaf8ee) : const Color(0xfffff4df);

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 15,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.asset(
              image,
              width: 92,
              height: 110,
              fit: BoxFit.cover,
            ),
          ),

          const Gap(12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 9,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: statusBackground,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        status,
                        style: TextStyle(
                          color: statusColor,
                          fontSize: 11,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),

                    const Spacer(),

                    GestureDetector(
                      onTap: () {
                        cancelRental(index);
                      },
                      child: Icon(
                        CupertinoIcons.xmark_circle_fill,
                        color: Colors.grey.shade400,
                        size: 22,
                      ),
                    ),
                  ],
                ),

                const Gap(9),

                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                  ),
                ),

                const Gap(5),

                Text(
                  "Owner: $owner",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const Gap(5),

                Row(
                  children: [
                    Icon(
                      CupertinoIcons.location_solid,
                      size: 14,
                      color: Colors.grey.shade600,
                    ),
                    const Gap(4),
                    Expanded(
                      child: Text(
                        city,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),

                const Gap(5),

                Row(
                  children: [
                    Icon(
                      CupertinoIcons.calendar,
                      size: 14,
                      color: Colors.grey.shade600,
                    ),
                    const Gap(4),
                    Expanded(
                      child: Text(
                        date,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),

                const Gap(8),

                Row(
                  children: [
                    Text(
                      price,
                      style: const TextStyle(
                        color: Color(0xffdf251c),
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                      ),
                    ),

                    const Spacer(),

                    SizedBox(
                      height: 34,
                      child: OutlinedButton(
                        onPressed: () {
                          // بعدين تفتح التفاصيل
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xffdf251c),
                          side: const BorderSide(
                            color: Color(0xffffc8c8),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          "Details",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}