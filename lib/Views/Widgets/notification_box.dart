import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:job_task/Controllers/notification_controller.dart';

import 'package:provider/provider.dart';

class NotificationBox extends StatefulWidget {
  final int index;
  const NotificationBox({super.key, required this.index});

  @override
  State<NotificationBox> createState() => _NotificationBoxState();
}

class _NotificationBoxState extends State<NotificationBox> {
  bool isCheck = true;
  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationController>(
      builder: (context, value, child) {
        int indicator = widget.index + 1;
        int id = value.notifications.data!.results![widget.index].id!.toInt();
        String title =
            value.notifications.data!.results![widget.index].title.toString();
        String readStatus = value
            .notifications.data!.results![widget.index].readStatus
            .toString();
        String date = DateFormat.yMMMEd().format(
          DateTime.parse(
            value.notifications.data!.results![widget.index].createdAt
                .toString(),
          ),
        );
        String description = value
            .notifications.data!.results![widget.index].description
            .toString();
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      readStatus == "No" ? redBox() : Container(),
                      Text(
                        title,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      numberBox(text: indicator.toString()),
                    ],
                  ),
                  Text(
                    date,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  )
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    description,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  value.isEdit
                      ? Checkbox(
                          value: value.selectedIds.contains(id.toInt()),
                          onChanged: (val) {
                            value.setIds(id);
                          })
                      : Container(),
                ],
              ),
              value.isEdit ? Container() : SizedBox(height: 10.h),
              Container(
                height: 1.h,
                width: MediaQuery.of(context).size.width,
                color: Colors.black.withOpacity(0.5),
              ),
              SizedBox(height: 10.h),
            ],
          ),
        );
      },
    );
  }

  Widget redBox() {
    return Container(
      height: 10.h,
      width: 10.w,
      decoration: const BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget numberBox({required String text}) {
    return Container(
      height: 25.h,
      width: 25.w,
      alignment: Alignment.center,
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Colors.indigo),
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 13.sp),
      ),
    );
  }
}
