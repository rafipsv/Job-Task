import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:job_task/Controllers/notification_controller.dart';
import 'package:job_task/Utils/loading_widget.dart';
import 'package:job_task/Views/Widgets/notification_actions.dart';
import 'package:job_task/Views/Widgets/notification_appbar.dart';
import 'package:job_task/Views/Widgets/notification_box.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool isLoading = true;
  int page = 1;
  final scrollController = ScrollController();
  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    final provider =
        Provider.of<NotificationController>(context, listen: false);
    scrollController.addListener(scrollListner);
    provider.setPage(1);
    await provider.getNotification2(page: page.toString(), context: context);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: isLoading
          ? const LoadingWidget()
          : Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(70.h),
                child: const NotificationAppBar(),
              ),
              backgroundColor: Colors.white,
              body: Consumer<NotificationController>(
                builder: (context, value, child) {
                  return Column(
                    children: [
                      SizedBox(height: 10.h),
                      Expanded(
                        child: ListView.builder(
                          controller: scrollController,
                          physics: const BouncingScrollPhysics(),
                          itemCount: value.notifications.data!.results!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return NotificationBox(index: index);
                          },
                        ),
                      ),
                      value.isLoading ? spinkit : Container(),
                      value.isEdit ? const NotificationAction() : Container()
                    ],
                  );
                },
              ),
            ),
    );
  }

  void scrollListner() async {
    final provider =
        Provider.of<NotificationController>(context, listen: false);
    if (provider.isLoading) return;
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      page = page + 1;
      provider.getNotification(page: page.toString(), context: context);
    }
  }

  Widget spinkit = Padding(
    padding: EdgeInsets.symmetric(vertical: 10.h),
    child: SpinKitWave(
      color: const Color.fromARGB(255, 2, 11, 61),
      size: 30.sp,
    ),
  );
}
