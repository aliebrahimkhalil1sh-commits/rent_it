import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rent_it/core/constants/app_color.dart';

class Wishlistview extends StatefulWidget {
  const Wishlistview({super.key});

  @override
  State<Wishlistview> createState() => _WishlistviewState();
}

class _WishlistviewState extends State<Wishlistview> {
  List<Map<String, String>> wishlistItems = [
    {
      "title": "Camera Stand",
      "category": "Tools",
      "city": "Aswan",
      "price": "100 / day",
      "image": "images/rentit.png",
    },
    {
      "title": "PlayStation 5",
      "category": "Electronics",
      "city": "Giza",
      "price": "100 / day",
      "image": "images/rentit.png",
    },
  ];

  void removeFromWishlist(int index) {
    setState(() {
      wishlistItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildHeader(),

            const Gap(24),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: wishlistItems.isEmpty
                  ? buildEmptyWishlist()
                  : buildWishlistGrid(),
            ),

            const Gap(120),
          ],
        ),
      ),
    );
  }

  Widget buildHeader() {
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
            "Your saved\nrentals.",
            style: TextStyle(
              color: Colors.white,
              fontSize: 42,
              fontWeight: FontWeight.w900,
              height: 1.05,
            ),
          ),

          const Gap(14),

          const Text(
            "Keep your favorite rental items in one place and come back to them anytime.",
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
              buildSmallInfoCard(
                title: wishlistItems.length.toString(),
                subtitle: "Saved items",
                icon: CupertinoIcons.heart_fill,
              ),
              const Gap(12),
              buildSmallInfoCard(
                title: "Fast",
                subtitle: "Access",
                icon: CupertinoIcons.bolt_fill,
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
        "WISHLIST",
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w900,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget buildSmallInfoCard({
    required String title,
    required String subtitle,
    required IconData icon,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white.withOpacity(0.20),
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 24,
            ),

            const Gap(10),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
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
          ],
        ),
      ),
    );
  }

  Widget buildEmptyWishlist() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 40),
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
              CupertinoIcons.heart,
              color: Color(0xffdf251c),
              size: 42,
            ),
          ),

          const Gap(20),

          const Text(
            "No saved items yet",
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.w900,
            ),
          ),

          const Gap(10),

          Text(
            "When you like a rental item, it will appear here so you can find it quickly.",
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
                // بعدين ممكن تخليها تفتح Browse tab
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

  Widget buildWishlistGrid() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildSectionHeader(),

        const Gap(16),

        GridView.builder(
          itemCount: wishlistItems.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            childAspectRatio: 0.67,
          ),
          itemBuilder: (context, index) {
            final item = wishlistItems[index];

            return buildWishlistCard(
              index: index,
              title: item["title"]!,
              category: item["category"]!,
              city: item["city"]!,
              price: item["price"]!,
              image: item["image"]!,
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
            "SAVED LISTINGS",
            style: TextStyle(
              color: Color.fromARGB(255, 5, 5, 5),
              fontSize: 22,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.6,
            ),
          ),
        ),

        Text(
          "${wishlistItems.length} item(s)",
          style: TextStyle(
            color: const Color.fromARGB(255, 240, 216, 216),
            fontSize: 13,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }

  Widget buildWishlistCard({
    required int index,
    required String title,
    required String category,
    required String city,
    required String price,
    required String image,
  }) {
    return Container(
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
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(24),
                  ),
                  child: Image.asset(
                    image,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                Positioned(
                  top: 10,
                  right: 10,
                  child: GestureDetector(
                    onTap: () {
                      removeFromWishlist(index);
                    },
                    child: const CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.white,
                      child: Icon(
                        CupertinoIcons.heart_fill,
                        color: Color(0xffdf251c),
                        size: 20,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  left: 10,
                  bottom: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 9,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      category,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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

                const Gap(7),

                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                ),

                const Gap(6),

                Text(
                  price,
                  style: const TextStyle(
                    color: Color(0xffdf251c),
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                  ),
                ),

                const Gap(10),

                SizedBox(
                  width: double.infinity,
                  height: 38,
                  child: OutlinedButton(
                    onPressed: () {
                      // بعدين تفتح Product Details
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
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}