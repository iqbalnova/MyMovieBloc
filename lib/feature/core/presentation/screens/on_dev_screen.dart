import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnDevScreen extends StatelessWidget {
  const OnDevScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "ON DEV",
        style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
      ),
    );
  }
}
