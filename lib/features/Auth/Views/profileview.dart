import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rent_it/core/constants/app_color.dart';
import 'package:rent_it/core/utils/pref_Helpers.dart';
import 'package:rent_it/features/Auth/Views/loginview.dart';

class Profileview extends StatefulWidget {
  const Profileview({super.key});

  @override
  State<Profileview> createState() => _ProfileviewState();
}

class _ProfileviewState extends State<Profileview> {
  String name = "ali khalil";
  String email = "alikhalil@gmail.com";
  String phone = "Not added";
  String city = "Not added";
  String address = "Not added";
  String bio = "Add a short bio to make your profile feel more complete.";

  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController cityController;
  late TextEditingController addressController;
  late TextEditingController bioController;

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController(text: name);
    phoneController = TextEditingController(
      text: phone == "Not added" ? "" : phone,
    );
    cityController = TextEditingController(
      text: city == "Not added" ? "" : city,
    );
    addressController = TextEditingController(
      text: address == "Not added" ? "" : address,
    );
    bioController = TextEditingController(text: bio);
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    cityController.dispose();
    addressController.dispose();
    bioController.dispose();
    super.dispose();
  }

  void openEditProfileSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return buildEditProfileSheet();
      },
    );
  }

  void saveProfileChanges() {
    setState(() {
      name = nameController.text.trim().isEmpty
          ? "User"
          : nameController.text.trim();

      phone = phoneController.text.trim().isEmpty
          ? "Not added"
          : phoneController.text.trim();

      city = cityController.text.trim().isEmpty
          ? "Not added"
          : cityController.text.trim();

      address = addressController.text.trim().isEmpty
          ? "Not added"
          : addressController.text.trim();

      bio = bioController.text.trim().isEmpty
          ? "Add a short bio to make your profile feel more complete."
          : bioController.text.trim();
    });

    Navigator.pop(context);
  }

  Future<void> logout() async {
    await PrefHelper.clearToken();

    if (!mounted) return;

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginView()),
      (route) => false,
    );
  }

  void showLogoutDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          title: const Text(
            "Logout",
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
          content: const Text(
            "Are you sure you want to logout?",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Cancel",
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                logout();
              },
              child: const Text(
                "Logout",
                style: TextStyle(
                  color: Color(0xffdf251c),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.primaryColor),
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
         

            const Gap(24),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: buildProfileCard(),
            ),

            const Gap(20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: buildSummaryCard(),
            ),

            const Gap(120),
          ],
        ),
      ),
    );
  }



  Widget buildBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.16),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white.withOpacity(0.20)),
      ),
      child: const Text(
        "PROFILE",
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
          border: Border.all(color: Colors.white.withOpacity(0.20)),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 24),

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

  Widget buildProfileCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
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
          Stack(
            children: [
              Container(
                width: 124,
                height: 124,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xffeef2f7),
                  border: Border.all(color: const Color(0xffffeeee), width: 6),
                ),
                child: const Center(
                  child: Icon(
                    CupertinoIcons.person_fill,
                    size: 54,
                    color: Color(0xff9aa3af),
                  ),
                ),
              ),

              Positioned(
                right: 4,
                bottom: 8,
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: const BoxDecoration(
                    color: Color(0xffdf251c),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    CupertinoIcons.camera_fill,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),

          const Gap(16),

          Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 26,
              fontWeight: FontWeight.w900,
            ),
          ),

          const Gap(8),

          Text(
            email,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),

          const Gap(14),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
            decoration: BoxDecoration(
              color: const Color(0xffe9fbf3),
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: const Color(0xffb9ecd7)),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  CupertinoIcons.check_mark_circled_solid,
                  color: Color(0xff0b8f5a),
                  size: 18,
                ),
                SizedBox(width: 7),
                Text(
                  "Email verified",
                  style: TextStyle(
                    color: Color(0xff0b8f5a),
                    fontSize: 13,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),

          const Gap(22),

          SizedBox(
            width: double.infinity,
            height: 54,
            child: ElevatedButton.icon(
              onPressed: openEditProfileSheet,
              icon: const Icon(CupertinoIcons.pencil),
              label: const Text("Edit profile"),
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

          const Gap(12),

          SizedBox(
            width: double.infinity,
            height: 52,
            child: OutlinedButton.icon(
              onPressed: () {
                // بعدين هنا ممكن تعمل upload avatar
              },
              icon: const Icon(CupertinoIcons.cloud_upload),
              label: const Text("Upload avatar"),
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xffdf251c),
                side: const BorderSide(color: Color(0xffffc8c8)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                textStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),

          const Gap(12),

          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton.icon(
              onPressed: showLogoutDialog,
              icon: const Icon(CupertinoIcons.square_arrow_right),
              label: const Text("Logout"),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: const Color(0xffffeeee),
                foregroundColor: const Color(0xffdf251c),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                  side: const BorderSide(color: Color(0xffffc8c8)),
                ),
                textStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSummaryCard() {
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
          buildSummaryHeader(),

          const Gap(18),

          buildInfoTile(
            title: "Name",
            value: name,
            icon: CupertinoIcons.person,
          ),

          const Gap(12),

          buildInfoTile(
            title: "Email",
            value: email,
            icon: CupertinoIcons.mail,
          ),

          const Gap(12),

          Row(
            children: [
              Expanded(
                child: buildInfoTile(
                  title: "Phone",
                  value: phone,
                  icon: CupertinoIcons.phone,
                ),
              ),

              const Gap(12),

              Expanded(
                child: buildInfoTile(
                  title: "City",
                  value: city,
                  icon: CupertinoIcons.location,
                ),
              ),
            ],
          ),

          const Gap(12),

          buildInfoTile(
            title: "Address",
            value: address,
            icon: CupertinoIcons.map,
          ),

          const Gap(12),

          buildInfoTile(
            title: "Bio",
            value: bio,
            icon: CupertinoIcons.text_alignleft,
          ),
        ],
      ),
    );
  }

  Widget buildSummaryHeader() {
    return Row(
      children: [
        const Expanded(
          child: Text(
            "PROFILE SUMMARY",
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.6,
            ),
          ),
        ),

        GestureDetector(
          onTap: openEditProfileSheet,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xffdf251c),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xffdf251c).withOpacity(0.25),
                  blurRadius: 12,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: const Text(
              "Edit",
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildInfoTile({
    required String title,
    required String value,
    required IconData icon,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xfffafafa),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: const Color(0xffffeeee),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: const Color(0xffdf251c), size: 22),
          ),

          const Gap(12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title.toUpperCase(),
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 11,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.8,
                  ),
                ),

                const Gap(5),

                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildEditProfileSheet() {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 45,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),

              const Gap(18),

              const Text(
                "Edit profile",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),

              const Gap(20),

              buildEditTextField(
                controller: nameController,
                label: "Name",
                icon: CupertinoIcons.person,
              ),

              const Gap(12),

              buildEditTextField(
                controller: phoneController,
                label: "Phone",
                icon: CupertinoIcons.phone,
              ),

              const Gap(12),

              buildEditTextField(
                controller: cityController,
                label: "City",
                icon: CupertinoIcons.location,
              ),

              const Gap(12),

              buildEditTextField(
                controller: addressController,
                label: "Address",
                icon: CupertinoIcons.map,
              ),

              const Gap(12),

              buildEditTextField(
                controller: bioController,
                label: "Bio",
                icon: CupertinoIcons.text_alignleft,
                maxLines: 3,
              ),

              const Gap(20),

              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 54,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xffdf251c),
                          side: const BorderSide(color: Color(0xffffc8c8)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        child: const Text(
                          "Cancel",
                          style: TextStyle(fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                  ),

                  const Gap(12),

                  Expanded(
                    child: SizedBox(
                      height: 54,
                      child: ElevatedButton(
                        onPressed: saveProfileChanges,
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: const Color(0xffdf251c),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        child: const Text(
                          "Save",
                          style: TextStyle(fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const Gap(12),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildEditTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: const Color(0xffdf251c)),
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.grey.shade600,
          fontWeight: FontWeight.w600,
        ),
        filled: true,
        fillColor: const Color(0xfffafafa),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: Color(0xffdf251c), width: 1.5),
        ),
      ),
    );
  }
}
