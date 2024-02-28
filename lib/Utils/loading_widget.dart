import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Widget spinkit = SpinKitWave(
      color: const Color.fromARGB(255, 2, 11, 61),
      size: 40.sp,
    );
    return Scaffold(
      body: Center(child: spinkit),
    );
  }
}
