import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnDevScreen extends StatelessWidget {
  const OnDevScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            "ON DEV",
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
          // GridView.builder(
          //   shrinkWrap: true,
          //   physics: const NeverScrollableScrollPhysics(),
          //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 4,
          //     mainAxisExtent: 120.h,
          //   ),
          //   itemCount: 12, // Example itemCount
          //   itemBuilder: (context, index) {
          //     return Container(
          //       width: 100,
          //       height: 100,
          //       color: Colors.red,
          //       margin: const EdgeInsets.all(8.0),
          //       child: Center(
          //         child: Text(
          //           'Item $index',
          //           style: const TextStyle(color: Colors.white),
          //         ),
          //       ),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
