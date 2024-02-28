import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:badges/badges.dart' as badges;
import 'package:job_task/Controllers/notification_controller.dart';
import 'package:job_task/Views/Screens/notification_screen.dart';
import 'package:provider/provider.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.list,
          size: 25.sp,
        ),
      ),
      actions: [
        Consumer<NotificationController>(
          builder: (context, value, child) {
            return badges.Badge(
              badgeAnimation: const badges.BadgeAnimation.slide(),
              badgeStyle: const badges.BadgeStyle(),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const NotificationScreen();
                    },
                  ),
                );
              },
              badgeContent: Text(
                value.notifications.data!.totalunread.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const NotificationScreen();
                      },
                    ),
                  );
                },
                child: Icon(
                  Icons.notifications_outlined,
                  size: 30.sp,
                ),
              ),
            );
          },
        ),
        SizedBox(
          width: 25.w,
        )
      ],
    );
  }
}
