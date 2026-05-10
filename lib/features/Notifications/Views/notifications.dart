import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rent_it/core/constants/app_color.dart';

class Notificationsview extends StatefulWidget {
  const Notificationsview({super.key});

  @override
  State<Notificationsview> createState() => _NotificationsviewState();
}

class _NotificationsviewState extends State<Notificationsview> {
  List<Map<String, dynamic>> notifications = [
    {
      "title": "Booking request received",
      "message": "Someone requested to rent your Camera Stand.",
      "time": "10 min ago",
      "type": "booking",
      "isRead": false,
    },
    {
      "title": "Rental approved",
      "message": "Your rental request for PlayStation 5 was approved.",
      "time": "1 hour ago",
      "type": "success",
      "isRead": false,
    },
    {
      "title": "Payment reminder",
      "message": "Remember to complete your rental payment.",
      "time": "Yesterday",
      "type": "warning",
      "isRead": true,
    },
  ];

  void markAllAsRead() {
    setState(() {
      for (var notification in notifications) {
        notification["isRead"] = true;
      }
    });
  }

  void deleteNotification(int index) {
    setState(() {
      notifications.removeAt(index);
    });
  }

  void markOneAsRead(int index) {
    setState(() {
      notifications[index]["isRead"] = true;
    });
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
              child: notifications.isEmpty
                  ? buildEmptyNotifications()
                  : buildNotificationsSection(),
            ),

            const Gap(120),
          ],
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

  Widget buildNotificationsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildSectionHeader(),

        const Gap(16),

        ListView.separated(
          itemCount: notifications.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          separatorBuilder: (context, index) {
            return const Gap(14);
          },
          itemBuilder: (context, index) {
            final notification = notifications[index];

            return buildNotificationCard(
              index: index,
              title: notification["title"],
              message: notification["message"],
              time: notification["time"],
              type: notification["type"],
              isRead: notification["isRead"],
            );
          },
        ),
      ],
    );
  }

  Widget buildSectionHeader() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0xffffeeee),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xffffc8c8)),
          ),
          child: const Text(
            "LATEST ALERTS",
            style: TextStyle(
              color: Color.fromARGB(255, 32, 19, 223),
              fontSize: 12,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        Spacer(),

        GestureDetector(
          onTap: markAllAsRead,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xffffeeee),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xffffc8c8)),
            ),
            child: const Text(
              "Mark all read",
              style: TextStyle(
                color: Color(0xffdf251c),
                fontSize: 12,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildNotificationCard({
    required int index,
    required String title,
    required String message,
    required String time,
    required String type,
    required bool isRead,
  }) {
    return GestureDetector(
      onTap: () {
        markOneAsRead(index);
      },
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: isRead ? Colors.white : const Color(0xfffff7f7),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isRead ? Colors.grey.shade200 : const Color(0xffffc8c8),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 14,
              offset: const Offset(0, 7),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildNotificationIcon(type),

            const Gap(12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),

                      if (!isRead)
                        Container(
                          width: 9,
                          height: 9,
                          decoration: const BoxDecoration(
                            color: Color(0xffdf251c),
                            shape: BoxShape.circle,
                          ),
                        ),
                    ],
                  ),

                  const Gap(6),

                  Text(
                    message,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 13,
                      height: 1.4,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const Gap(10),

                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.clock,
                        size: 14,
                        color: Colors.grey.shade500,
                      ),
                      const Gap(4),
                      Text(
                        time,
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const Spacer(),

                      GestureDetector(
                        onTap: () {
                          deleteNotification(index);
                        },
                        child: Icon(
                          CupertinoIcons.trash,
                          color: Colors.grey.shade500,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNotificationIcon(String type) {
    IconData icon;
    Color color;
    Color backgroundColor;

    if (type == "booking") {
      icon = CupertinoIcons.calendar_badge_plus;
      color = const Color(0xffdf251c);
      backgroundColor = const Color(0xffffeeee);
    } else if (type == "success") {
      icon = CupertinoIcons.check_mark_circled_solid;
      color = const Color(0xff138a36);
      backgroundColor = const Color(0xffeaf8ee);
    } else if (type == "warning") {
      icon = CupertinoIcons.exclamationmark_triangle_fill;
      color = const Color(0xffd98b00);
      backgroundColor = const Color(0xfffff4df);
    } else {
      icon = CupertinoIcons.bell_fill;
      color = const Color(0xffdf251c);
      backgroundColor = const Color(0xffffeeee);
    }

    return Container(
      width: 52,
      height: 52,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Icon(icon, color: color, size: 25),
    );
  }

  Widget buildEmptyNotifications() {
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
              CupertinoIcons.bell,
              color: Color(0xffdf251c),
              size: 42,
            ),
          ),

          const Gap(20),

          const Text(
            "No notifications yet",
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.w900,
            ),
          ),

          const Gap(10),

          Text(
            "When something important happens, your notifications will appear here.",
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
}
