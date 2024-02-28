import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_task/Controllers/notification_controller.dart';
import 'package:provider/provider.dart';

class NotificationAppBar extends StatelessWidget {
  const NotificationAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, left: 5.w),
      child: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 25.sp,
          ),
        ),
        title: const Text(
          "Notifications",
        ),
        actions: [
          Consumer<NotificationController>(
            builder: (context, value, child) {
              return value.isEdit
                  ? TextButton(
                      onPressed: () {
                        value.changeEdit();
                      },
                      child: Text(
                        "Cancel",
                        style: TextStyle(fontSize: 18.sp),
                      ),
                    )
                  : IconButton(
                      onPressed: () {
                        value.changeEdit();
                      },
                      icon: Icon(
                        Icons.edit,
                        size: 30.sp,
                      ),
                    );
            },
          ),
          SizedBox(
            width: 20.w,
          )
        ],
      ),
    );
  }
}
