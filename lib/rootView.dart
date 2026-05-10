import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rent_it/features/Auth/Views/profileview.dart';
import 'package:rent_it/features/Bookings/Views/bookview.dart';
import 'package:rent_it/features/Browse/Views/browseview.dart';
import 'package:rent_it/features/Home/Views/homeview.dart';
import 'package:rent_it/features/Notifications/Views/notifications.dart';
import 'package:rent_it/features/Wish_Lists/Views/wishlistview.dart';

class RootView extends StatefulWidget {
  const RootView({super.key});

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  late PageController controller;
  late List<Widget> screens;
  int currentscreen = 0;

  @override
  void initState() {
    screens = [
      Homeview(),
      Bookview(),

      Wishlistview(),
      // Mylistingview(),
      // Bookview(),
      // Rentelsview(),
      Profileview(),
      Notificationsview(),
    ];
    controller = PageController(initialPage: currentscreen);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: screens,
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.redAccent,
          unselectedItemColor: Colors.black,
          currentIndex: currentscreen,

          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home, size: 35),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.calendar_badge_plus, size: 35),
              label: "Booking",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.square_favorites, size: 35),
              label: "wishList",
            ),

            // BottomNavigationBarItem(
            //   icon: Icon(CupertinoIcons.square_favorites),
            //   label: "MyList",
            // ),
            // BottomNavigationBarItem(
            //   icon: Icon(CupertinoIcons.square_favorites),
            //   label: "booking",
            // ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.profile_circled, size: 35),
              label: "profile",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.bell, size: 35),
              label: "notification",
            ),
          ],
          onTap: (value) {
            setState(() {
              currentscreen = value;
              controller.jumpToPage(currentscreen);
            });
          },
        ),
      ),
    );
  }
}
