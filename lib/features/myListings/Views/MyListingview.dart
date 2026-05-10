import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Mylistingview extends StatefulWidget {
  const Mylistingview({super.key});

  @override
  State<Mylistingview> createState() => _MylistingviewState();
}

class _MylistingviewState extends State<Mylistingview> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController priceHourController = TextEditingController();
  final TextEditingController priceDayController = TextEditingController();
  final TextEditingController priceWeekController = TextEditingController();
  final TextEditingController priceMonthController = TextEditingController();
  final TextEditingController depositController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController minPeriodController = TextEditingController();
  final TextEditingController maxPeriodController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController tagsController = TextEditingController();
  final TextEditingController termsController = TextEditingController();

  String? selectedCategory;
  String? selectedCondition;
  String selectedStatus = "All statuses";

  final List<String> categories = [
    "Vehicles",
    "Electronics",
    "Furniture",
    "Sports Equipment",
    "Tools",
    "Books",
    "Cameras",
    "Fashion",
    "Home Appliances",
    "Other",
  ];

  final List<String> conditions = [
    "New",
    "Like new",
    "Good",
    "Used",
  ];

  final List<String> statuses = [
    "All statuses",
    "Active",
    "Pending",
    "Rejected",
  ];

  List<Map<String, String>> myListings = [];

  @override
  void dispose() {
    titleController.dispose();
    priceHourController.dispose();
    priceDayController.dispose();
    priceWeekController.dispose();
    priceMonthController.dispose();
    depositController.dispose();
    cityController.dispose();
    minPeriodController.dispose();
    maxPeriodController.dispose();
    descriptionController.dispose();
    addressController.dispose();
    tagsController.dispose();
    termsController.dispose();
    super.dispose();
  }

  void createListing() {
    final String title = titleController.text.trim();
    final String city = cityController.text.trim();
    final String priceDay = priceDayController.text.trim();

    if (selectedCategory == null || title.isEmpty || city.isEmpty) {
      showMessage("Please fill category, title, and city");
      return;
    }

    setState(() {
      myListings.add({
        "title": title,
        "category": selectedCategory ?? "Other",
        "city": city,
        "price": priceDay.isEmpty ? "0 / day" : "$priceDay / day",
        "condition": selectedCondition ?? "Not selected",
        "status": "Pending",
        "image": "images/rentit.png",
      });

      clearForm();
    });

    showMessage("Listing created successfully");
  }

  void clearForm() {
    titleController.clear();
    priceHourController.clear();
    priceDayController.clear();
    priceWeekController.clear();
    priceMonthController.clear();
    depositController.clear();
    cityController.clear();
    minPeriodController.clear();
    maxPeriodController.clear();
    descriptionController.clear();
    addressController.clear();
    tagsController.clear();
    termsController.clear();

    selectedCategory = null;
    selectedCondition = null;
  }

  void deleteListing(int index) {
    setState(() {
      myListings.removeAt(index);
    });
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: const Color(0xffdf251c),
      ),
    );
  }

  List<Map<String, String>> getFilteredListings() {
    if (selectedStatus == "All statuses") {
      return myListings;
    }

    return myListings.where((item) {
      return item["status"] == selectedStatus;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filteredListings = getFilteredListings();

    return Scaffold(
      backgroundColor: const Color(0xfff7f7f7),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildHeader(),

            const Gap(24),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: buildCreateProductCard(),
            ),

            const Gap(24),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: buildListingsSection(filteredListings),
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
            "Create and\nmanage listings.",
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.w900,
              height: 1.05,
            ),
          ),

          const Gap(14),

          const Text(
            "Publish rental products, set pricing, and track your listed items from one place.",
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
              buildHeaderInfoCard(
                title: myListings.length.toString(),
                subtitle: "Listings",
                icon: CupertinoIcons.cube_box,
              ),
              const Gap(12),
              buildHeaderInfoCard(
                title: "Easy",
                subtitle: "Create",
                icon: CupertinoIcons.plus_circle_fill,
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
        "MY LISTINGS",
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w900,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget buildHeaderInfoCard({
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
                    fontSize: 18,
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

  Widget buildCreateProductCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildCardTitle("CREATE A PRODUCT"),

          const Gap(18),

          buildDropdownField(
            label: "Category",
            hint: "Choose a category",
            value: selectedCategory,
            items: categories,
            onChanged: (value) {
              setState(() {
                selectedCategory = value;
              });
            },
          ),

          const Gap(14),

          buildTextField(
            label: "Title",
            controller: titleController,
            hint: "Product title",
            icon: CupertinoIcons.textformat,
          ),

          const Gap(14),

          Row(
            children: [
              Expanded(
                child: buildTextField(
                  label: "Price / hour",
                  controller: priceHourController,
                  hint: "0",
                  icon: CupertinoIcons.money_dollar,
                  keyboardType: TextInputType.number,
                ),
              ),
              const Gap(12),
              Expanded(
                child: buildTextField(
                  label: "Price / day",
                  controller: priceDayController,
                  hint: "0",
                  icon: CupertinoIcons.money_dollar,
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),

          const Gap(14),

          Row(
            children: [
              Expanded(
                child: buildTextField(
                  label: "Price / week",
                  controller: priceWeekController,
                  hint: "0",
                  icon: CupertinoIcons.money_dollar,
                  keyboardType: TextInputType.number,
                ),
              ),
              const Gap(12),
              Expanded(
                child: buildTextField(
                  label: "Price / month",
                  controller: priceMonthController,
                  hint: "0",
                  icon: CupertinoIcons.money_dollar,
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),

          const Gap(14),

          buildTextField(
            label: "Security deposit",
            controller: depositController,
            hint: "Deposit amount",
            icon: CupertinoIcons.lock_shield,
            keyboardType: TextInputType.number,
          ),

          const Gap(14),

          buildTextField(
            label: "City",
            controller: cityController,
            hint: "City",
            icon: CupertinoIcons.location,
          ),

          const Gap(14),

          buildDropdownField(
            label: "Condition",
            hint: "Select condition",
            value: selectedCondition,
            items: conditions,
            onChanged: (value) {
              setState(() {
                selectedCondition = value;
              });
            },
          ),

          const Gap(14),

          Row(
            children: [
              Expanded(
                child: buildTextField(
                  label: "Minimum period",
                  controller: minPeriodController,
                  hint: "1 day",
                  icon: CupertinoIcons.calendar,
                ),
              ),
              const Gap(12),
              Expanded(
                child: buildTextField(
                  label: "Maximum period",
                  controller: maxPeriodController,
                  hint: "30 days",
                  icon: CupertinoIcons.calendar_badge_plus,
                ),
              ),
            ],
          ),

          const Gap(14),

          buildTextField(
            label: "Description",
            controller: descriptionController,
            hint: "Write product description",
            icon: CupertinoIcons.doc_text,
            maxLines: 4,
          ),

          const Gap(14),

          buildTextField(
            label: "Address",
            controller: addressController,
            hint: "Product address",
            icon: CupertinoIcons.map,
          ),

          const Gap(14),

          buildTextField(
            label: "Tags",
            controller: tagsController,
            hint: "camera, canon, travel",
            icon: CupertinoIcons.tag,
          ),

          const Gap(14),

          buildTextField(
            label: "Terms and conditions",
            controller: termsController,
            hint: "Write rental terms",
            icon: CupertinoIcons.doc_plaintext,
            maxLines: 4,
          ),

          const Gap(16),

          buildImagesBox(),

          const Gap(20),

          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton.icon(
              onPressed: createListing,
              icon: const Icon(CupertinoIcons.plus_circle_fill),
              label: const Text("Create Listing"),
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

  Widget buildCardTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.w900,
        letterSpacing: 1.7,
      ),
    );
  }

  Widget buildTextField({
    required String label,
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w900,
            letterSpacing: 0.8,
          ),
        ),

        const Gap(8),

        TextField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: const Color(0xffdf251c),
            ),
            hintText: hint,
            hintStyle: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            filled: true,
            fillColor: const Color(0xfffafafa),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(
                color: Colors.grey.shade300,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(
                color: Color(0xffdf251c),
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildDropdownField({
    required String label,
    required String hint,
    required String? value,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w900,
            letterSpacing: 0.8,
          ),
        ),

        const Gap(8),

        DropdownButtonFormField<String>(
          value: value,
          isExpanded: true,
          hint: Text(
            hint,
            style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          dropdownColor: Colors.white,
          borderRadius: BorderRadius.circular(18),
          icon: Container(
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
              color: Color(0xffffeeee),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              CupertinoIcons.chevron_down,
              color: Color(0xffdf251c),
              size: 18,
            ),
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xfffafafa),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(
                color: Colors.grey.shade300,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(
                color: Color(0xffdf251c),
                width: 1.5,
              ),
            ),
          ),
          items: items.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget buildImagesBox() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Product images",
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w900,
            letterSpacing: 0.8,
          ),
        ),

        const Gap(8),

        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xfffafafa),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: Colors.grey.shade300,
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 13,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xffffeeee),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: const Color(0xffffc8c8),
                  ),
                ),
                child: const Text(
                  "Choose files",
                  style: TextStyle(
                    color: Color(0xffdf251c),
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),

              const Gap(12),

              Expanded(
                child: Text(
                  "No file chosen",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildListingsSection(List<Map<String, String>> filteredListings) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
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
          Row(
            children: [
              const Expanded(
                child: Text(
                  "YOUR LISTINGS",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.7,
                  ),
                ),
              ),

              SizedBox(
                width: 145,
                child: DropdownButtonFormField<String>(
                  value: selectedStatus,
                  isExpanded: true,
                  dropdownColor: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  icon: const Icon(
                    CupertinoIcons.chevron_down,
                    color: Color(0xffdf251c),
                    size: 18,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xfffafafa),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: const BorderSide(
                        color: Color(0xffdf251c),
                        width: 1.5,
                      ),
                    ),
                  ),
                  items: statuses.map((status) {
                    return DropdownMenuItem<String>(
                      value: status,
                      child: Text(
                        status,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value == null) return;

                    setState(() {
                      selectedStatus = value;
                    });
                  },
                ),
              ),
            ],
          ),

          const Gap(18),

          filteredListings.isEmpty
              ? buildEmptyListings()
              : buildListingCards(filteredListings),
        ],
      ),
    );
  }

  Widget buildEmptyListings() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 32),
      decoration: BoxDecoration(
        color: const Color(0xfffafafa),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),
      child: Column(
        children: [
          const Icon(
            CupertinoIcons.cube_box,
            color: Color(0xffdf251c),
            size: 44,
          ),

          const Gap(14),

          const Text(
            "No listings match the current filter",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.w900,
            ),
          ),

          const Gap(8),

          Text(
            "Create your first listing and it will appear here.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildListingCards(List<Map<String, String>> listings) {
    return ListView.separated(
      itemCount: listings.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      separatorBuilder: (context, index) {
        return const Gap(14);
      },
      itemBuilder: (context, index) {
        final listing = listings[index];

        return buildListingCard(
          index: myListings.indexOf(listing),
          title: listing["title"]!,
          category: listing["category"]!,
          city: listing["city"]!,
          price: listing["price"]!,
          condition: listing["condition"]!,
          status: listing["status"]!,
          image: listing["image"]!,
        );
      },
    );
  }

  Widget buildListingCard({
    required int index,
    required String title,
    required String category,
    required String city,
    required String price,
    required String condition,
    required String status,
    required String image,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xfffafafa),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.asset(
              image,
              width: 92,
              height: 105,
              fit: BoxFit.cover,
            ),
          ),

          const Gap(12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildStatusChip(status),

                const Gap(8),

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
                  "$category • $condition",
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

                    GestureDetector(
                      onTap: () {
                        deleteListing(index);
                      },
                      child: Icon(
                        CupertinoIcons.trash,
                        color: Colors.grey.shade500,
                        size: 21,
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

  Widget buildStatusChip(String status) {
    Color textColor;
    Color backgroundColor;

    if (status == "Active") {
      textColor = const Color(0xff138a36);
      backgroundColor = const Color(0xffeaf8ee);
    } else if (status == "Pending") {
      textColor = const Color(0xffd98b00);
      backgroundColor = const Color(0xfffff4df);
    } else {
      textColor = const Color(0xffdf251c);
      backgroundColor = const Color(0xffffeeee);
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: textColor,
          fontSize: 11,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}