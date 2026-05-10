import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Browseview extends StatefulWidget {
  const Browseview({super.key});

  @override
  State<Browseview> createState() => _BrowseviewState();
}

class _BrowseviewState extends State<Browseview> {
  final TextEditingController searchController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  String? selectedCategory;

  final List<String> categories = [
    "All",
    "Books",
    "Cameras",
    "Electronics",
    "Fashion",
    "Furniture",
    "Home Appliances",
    "Other",
    "Sports Equipment",
    "Tools",
    "Vehicles",
  ];

  @override
  void dispose() {
    searchController.dispose();
    cityController.dispose();
    super.dispose();
  }

  void applyFilters() {
    final String searchText = searchController.text.trim();
    final String cityText = cityController.text.trim();
    final String category = selectedCategory ?? "All";

    debugPrint("Search: $searchText");
    debugPrint("City: $cityText");
    debugPrint("Category: $category");

    // بعدين هنا هتنادي API
    // مثال:
    // getProducts(searchText, cityText, category);
  }

  void clearFilters() {
    setState(() {
      searchController.clear();
      cityController.clear();
      selectedCategory = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // تثبيت الخلفية هنا يمنع اختفاء الألوان عند التمرير
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFD32F2F), Color(0xFF8B0000)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent, // شفاف ليظهر التدرج خلفه
        body: SafeArea(
          child: Column(
            children: [
              // الجزء العلوي ثابت (اختياري) أو نضعه داخل السكرول
              Expanded(
                child: SingleChildScrollView(
                  // ClampingScrollPhysics تمنع "المطة" القبيحة عند التمرير
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildTopSection(),
                      const Gap(25),

                      // عنوان قسم الفئات
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        child: Text(
                          "Categories",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Gap(12),

                      // عرض الفئات بشكل أفقي أنيق
                      buildCategoryCard(),

                      const Gap(25),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Nearby Results",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "13 found",
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Gap(15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: buildProductsGrid(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTopSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 85, left: 14, right: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "SEARCH LISTINGS",
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),

          const Gap(8),

          const Text(
            "Find rentals by title, city, or category",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),

          const Gap(28),

          buildFilterCard(),
        ],
      ),
    );
  }

  Widget buildFilterCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.18),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          buildTextField(
            controller: searchController,
            hintText: "Search by title or desc",
            icon: CupertinoIcons.search,
          ),

          const Gap(10),

          buildTextField(
            controller: cityController,
            hintText: "Filter by city",
            icon: CupertinoIcons.location,
          ),

          const Gap(10),

          Center(child: SizedBox(width: 180, child: buildDropdown())),

          const Gap(10),

          Row(
            children: [
              Expanded(
                child: buildButton(
                  text: "Apply",
                  backgroundColor: const Color(0xffd9281f),
                  textColor: Colors.white,
                  onPressed: applyFilters,
                ),
              ),

              const Gap(10),

              Expanded(
                child: buildButton(
                  text: "Clear",
                  backgroundColor: const Color(0xffffeeee),
                  textColor: const Color(0xffd9281f),
                  onPressed: clearFilters,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.grey),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey.shade500,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        fillColor: const Color(0xfffafafa),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 16,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: Color(0xffd9281f), width: 1.5),
        ),
      ),
    );
  }

  Widget buildDropdown() {
    return DropdownButtonFormField<String>(
      value: selectedCategory,
      isExpanded: true,

      hint: const Center(
        child: Text(
          "Category",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      dropdownColor: Colors.white,
      borderRadius: BorderRadius.circular(18),
      menuMaxHeight: 320,

      icon: Container(
        width: 32,
        height: 32,
        decoration: const BoxDecoration(
          color: Color(0xffffeeee),
          shape: BoxShape.circle,
        ),
        child: const Icon(
          CupertinoIcons.chevron_down,
          color: Color(0xffd9281f),
          size: 18,
        ),
      ),

      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xfffafafa),

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 14,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: Color(0xffd9281f), width: 1.5),
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
      ),

      selectedItemBuilder: (context) {
        return categories.map((category) {
          return Center(
            child: Text(
              category,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }).toList();
      },

      items: categories.map((category) {
        final bool isSelected = selectedCategory == category;

        return DropdownMenuItem<String>(
          value: category,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xffffeeee) : Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected
                    ? const Color(0xffd9281f)
                    : Colors.grey.shade200,
              ),
            ),
            child: Text(
              category,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isSelected ? const Color(0xffd9281f) : Colors.black87,
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
              ),
            ),
          ),
        );
      }).toList(),

      onChanged: (value) {
        if (value == null) {
          return;
        }

        setState(() {
          selectedCategory = value;
        });
      },
    );
  }

  Widget buildButton({
    required String text,
    required Color backgroundColor,
    required Color textColor,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      height: 54,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget buildCategoryCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(26),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.14),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(
                  CupertinoIcons.slider_horizontal_3,
                  color: Color(0xffd9281f),
                  size: 22,
                ),
                SizedBox(width: 8),
                Text(
                  "Categories",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 14),

            Wrap(
              spacing: 10,
              runSpacing: 12,
              children: categories.map((category) {
                final bool isSelected = selectedCategory == category;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = category;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xffd9281f)
                          : const Color(0xfffafafa),
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: isSelected
                            ? const Color(0xffd9281f)
                            : Colors.grey.shade300,
                        width: 1.2,
                      ),
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: const Color(
                                  0xffd9281f,
                                ).withOpacity(0.25),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ]
                          : [],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          getCategoryIcon(category),
                          size: 17,
                          color: isSelected
                              ? Colors.white
                              : Colors.grey.shade700,
                        ),

                        const SizedBox(width: 7),

                        Text(
                          category,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black87,
                            fontSize: 14,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProductsGrid() {
    return GridView.builder(
      itemCount: 6,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 120),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        childAspectRatio: 0.72,
      ),
      itemBuilder: (context, index) {
        return buildProductCard(index);
      },
    );
  }

  Widget buildProductCard(int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            blurRadius: 14,
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
                    top: Radius.circular(22),
                  ),
                  child: Image.asset(
                    "images/rentit.png",
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                Positioned(
                  top: 10,
                  right: 10,
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.white,
                    child: Icon(
                      CupertinoIcons.heart,
                      color: Colors.grey.shade800,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Text(
                  "Product ${index + 1}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const Gap(5),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      CupertinoIcons.location_solid,
                      size: 14,
                      color: Colors.grey.shade600,
                    ),
                    const Gap(4),
                    Text(
                      "Cairo",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),

                const Gap(5),

                const Text(
                  "150 EGP/day",
                  style: TextStyle(
                    color: Color(0xffd9281f),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  IconData getCategoryIcon(String category) {
    if (category == "All") {
      return CupertinoIcons.square_grid_2x2;
    } else if (category == "Books") {
      return CupertinoIcons.book;
    } else if (category == "Cameras") {
      return CupertinoIcons.camera;
    } else if (category == "Electronics") {
      return CupertinoIcons.device_phone_portrait;
    } else if (category == "Fashion") {
      return CupertinoIcons.bag;
    } else if (category == "Furniture") {
      return CupertinoIcons.house;
    } else if (category == "Home Appliances") {
      return CupertinoIcons.home;
    } else if (category == "Sports Equipment") {
      return CupertinoIcons.sportscourt;
    } else if (category == "Tools") {
      return CupertinoIcons.wrench;
    } else if (category == "Vehicles") {
      return CupertinoIcons.car;
    } else {
      return CupertinoIcons.circle_grid_hex;
    }
  }
}
