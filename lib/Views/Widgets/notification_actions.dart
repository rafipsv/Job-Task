import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:job_task/Controllers/notification_controller.dart';
import 'package:provider/provider.dart';

class NotificationAction extends StatefulWidget {
  const NotificationAction({super.key});

  @override
  State<NotificationAction> createState() => _NotificationActionState();
}

class _NotificationActionState extends State<NotificationAction> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      color: Colors.white,
      child: Consumer<NotificationController>(
        builder: (context, value, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: value.isAll,
                    onChanged: (val) {
                      value.setAll();
                    },
                  ),
                  const Text("All")
                ],
              ),
              Row(
                children: [
                  deleteButton(),
                  SizedBox(width: 15.w),
                  readButton(),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  Widget deleteButton() {
    return Consumer<NotificationController>(
      builder: (context, value, child) {
        return value.isDelete
            ? spinkit
            : GestureDetector(
                onTap: () {
                  value.deleteNotification(context: context);
                },
                child: Container(
                  height: 40.h,
                  width: 100.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: value.selectedIds.isEmpty
                        ? const Color.fromARGB(255, 219, 218, 218)
                        : const Color.fromARGB(255, 252, 189, 211),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    "Delete",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
              );
      },
    );
  }

  Widget readButton() {
    return Consumer<NotificationController>(
      builder: (context, value, child) {
        return value.isUpdate
            ? spinkit
            : GestureDetector(
                onTap: () {
                  value.updateNotifications(context: context);
                },
                child: Container(
                  height: 40.h,
                  width: 140.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: value.selectedIds.isEmpty
                        ? const Color.fromARGB(255, 219, 218, 218)
                        : const Color.fromARGB(255, 252, 189, 211),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    "Mark as read",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
              );
      },
    );
  }

  Widget spinkit = Padding(
    padding: EdgeInsets.symmetric(vertical: 10.h),
    child: SpinKitWave(
      color: const Color.fromARGB(255, 2, 11, 61),
      size: 30.sp,
    ),
  );
}
