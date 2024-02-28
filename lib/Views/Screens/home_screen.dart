// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_task/Controllers/auth_controller.dart';
import 'package:job_task/Controllers/notification_controller.dart';
import 'package:job_task/Utils/loading_widget.dart';
import 'package:job_task/Views/Widgets/home_appbar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void getData() async {
    final provider = Provider.of<AuthController>(context, listen: false);
    final provider2 =
        Provider.of<NotificationController>(context, listen: false);
    await provider.getLogin();
    await provider2.getNotification2(page: "1",context: context);
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
              backgroundColor: Colors.grey.shade400,
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(70.h),
                child: const HomeAppBar(),
              ),
            ),
    );
  }
}
