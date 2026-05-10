import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rent_it/core/constants/app_color.dart';

class Bookview extends StatefulWidget {
  const Bookview({super.key});

  @override
  State<Bookview> createState() => _BookviewState();
}

class _BookviewState extends State<Bookview> {
  List<Map<String, String>> bookings = [
    {
      "title": "Camera Stand",
      "renter": "Ahmed Ali",
      "city": "Aswan",
      "status": "Pending",
      "date": "12 May - 15 May",
      "price": "300 EGP",
      "image": "images/rentit.png",
    },
    {
      "title": "Gaming Chair",
      "renter": "Omar Khaled",
      "city": "Fayoum",
      "status": "Approved",
      "date": "20 May - 22 May",
      "price": "200 EGP",
      "image": "images/rentit.png",
    },
  ];

  void cancelBooking(int index) {
    setState(() {
      bookings.removeAt(index);
    });
  }

  void approveBooking(int index) {
    setState(() {
      bookings[index]["status"] = "Approved";
    });
  }

  void rejectBooking(int index) {
    setState(() {
      bookings[index]["status"] = "Rejected";
    });
  }

  int getCountByStatus(String status) {
    return bookings.where((booking) => booking["status"] == status).length;
  }

  @override
  Widget build(BuildContext context) {
    final int totalBookings = bookings.length;
    final int pendingBookings = getCountByStatus("Pending");
    final int approvedBookings = getCountByStatus("Approved");

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildHeader(
              totalBookings: totalBookings,
              pendingBookings: pendingBookings,
              approvedBookings: approvedBookings,
            ),

            const Gap(24),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: bookings.isEmpty ? buildEmptyBookings() : buildBookingsList(),
            ),

            const Gap(120),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required int totalBookings,
    required int pendingBookings,
    required int approvedBookings,
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
            "Your booking\nrequests.",
            style: TextStyle(
              color: Colors.white,
              fontSize: 42,
              fontWeight: FontWeight.w900,
              height: 1.05,
            ),
          ),

          const Gap(14),

          const Text(
            "Manage booking requests, track approval status, and keep rental plans organized.",
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
                title: totalBookings.toString(),
                subtitle: "Total",
                icon: CupertinoIcons.calendar,
              ),
              const Gap(10),
              buildInfoCard(
                title: pendingBookings.toString(),
                subtitle: "Pending",
                icon: CupertinoIcons.clock_fill,
              ),
              const Gap(10),
              buildInfoCard(
                title: approvedBookings.toString(),
                subtitle: "Approved",
                icon: CupertinoIcons.check_mark_circled_solid,
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
        "BOOKINGS",
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

  Widget buildEmptyBookings() {
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
              CupertinoIcons.calendar_badge_plus,
              color: Color(0xffdf251c),
              size: 42,
            ),
          ),

          const Gap(20),

          const Text(
            "No bookings yet",
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.w900,
            ),
          ),

          const Gap(10),

          Text(
            "When someone books your item or you request a rental, booking activity will appear here.",
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

  Widget buildBookingsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildSectionHeader(),

        const Gap(16),

        ListView.separated(
          itemCount: bookings.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          separatorBuilder: (context, index) {
            return const Gap(14);
          },
          itemBuilder: (context, index) {
            final booking = bookings[index];

            return buildBookingCard(
              index: index,
              title: booking["title"]!,
              renter: booking["renter"]!,
              city: booking["city"]!,
              status: booking["status"]!,
              date: booking["date"]!,
              price: booking["price"]!,
              image: booking["image"]!,
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
            "MY BOOKINGS",
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 22,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.6,
            ),
          ),
        ),
        Text(
          "${bookings.length} total",
          style: TextStyle(
            color: const Color.fromARGB(255, 255, 254, 254),
            fontSize: 13,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }

  Widget buildBookingCard({
    required int index,
    required String title,
    required String renter,
    required String city,
    required String status,
    required String date,
    required String price,
    required String image,
  }) {
    final Color statusColor = getStatusColor(status);
    final Color statusBackground = getStatusBackground(status);

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
      child: Column(
        children: [
          Row(
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
                            cancelBooking(index);
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
                      "Renter: $renter",
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

                    Text(
                      price,
                      style: const TextStyle(
                        color: Color(0xffdf251c),
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          if (status == "Pending") ...[
            const Gap(14),

            Row(
              children: [
                Expanded(
                  child: buildSmallButton(
                    text: "Reject",
                    backgroundColor: const Color(0xffffeeee),
                    textColor: const Color(0xffdf251c),
                    onPressed: () {
                      rejectBooking(index);
                    },
                  ),
                ),

                const Gap(10),

                Expanded(
                  child: buildSmallButton(
                    text: "Approve",
                    backgroundColor: const Color(0xffdf251c),
                    textColor: Colors.white,
                    onPressed: () {
                      approveBooking(index);
                    },
                  ),
                ),
              ],
            ),
          ] else ...[
            const Gap(14),

            SizedBox(
              width: double.infinity,
              height: 42,
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
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Text(
                  "View details",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget buildSmallButton({
    required String text,
    required Color backgroundColor,
    required Color textColor,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      height: 42,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
            side: BorderSide(
              color: textColor.withOpacity(0.25),
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 13,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }

  Color getStatusColor(String status) {
    if (status == "Approved") {
      return const Color(0xff138a36);
    } else if (status == "Pending") {
      return const Color(0xffd98b00);
    } else if (status == "Rejected") {
      return const Color(0xffdf251c);
    } else {
      return Colors.grey;
    }
  }

  Color getStatusBackground(String status) {
    if (status == "Approved") {
      return const Color(0xffeaf8ee);
    } else if (status == "Pending") {
      return const Color(0xfffff4df);
    } else if (status == "Rejected") {
      return const Color(0xffffeeee);
    } else {
      return Colors.grey.shade100;
    }
  }
}