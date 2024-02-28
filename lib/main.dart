import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_task/Controllers/auth_controller.dart';
import 'package:job_task/Controllers/notification_controller.dart';
import 'package:job_task/Views/Screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => AuthController(),
            ),
            ChangeNotifierProvider(
              create: (_) => NotificationController(),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(scaffoldBackgroundColor: Colors.white),
            home: const HomeScreen(),
          ),
        );
      },
    );
  }
}
