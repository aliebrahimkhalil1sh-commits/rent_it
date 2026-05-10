import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rent_it/features/Home/Widgets/buildSectionHeader.dart';
import 'package:rent_it/features/Home/Widgets/productcard.dart';

class Buildfreshlistingssection extends StatelessWidget {
   Buildfreshlistingssection({super.key});
   final List<Map<String, dynamic>> products = [
      {
        "title": "Camera Stand",
        "category": "Tools",
        "city": "Aswan",
        "price": "100 / day",
        "image": "images/rentit.png",
      },
      {
        "title": "Bike",
        "category": "Sports",
        "city": "Ismailia",
        "price": "50 / day",
        "image": "images/rentit.png",
      },
      {
        "title": "PlayStation 5",
        "category": "Electronics",
        "city": "Giza",
        "price": "100 / day",
        "image": "images/rentit.png",
      },
      {
        "title": "Gaming Chair",
        "category": "Furniture",
        "city": "Fayoum",
        "price": "100 / day",
        "image": "images/rentit.png",
      },
    ];

  @override
  Widget build(BuildContext context) {

   

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Buildsectionheader(title: "Fresh listings", actionText: "See all"),

          const Gap(16),

          SizedBox(
            height: 280,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              separatorBuilder: (context, index) {
                return const Gap(14);
              },
              itemBuilder: (context, index) {
                return Productcard(
                  title: products[index]["title"],
                  category: products[index]["category"],
                  city: products[index]["city"],
                  price: products[index]["price"],
                  image: products[index]["image"],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}