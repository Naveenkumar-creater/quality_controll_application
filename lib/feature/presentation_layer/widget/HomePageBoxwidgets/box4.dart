import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Box4 extends StatelessWidget {
  const Box4({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text("Hello",style: TextStyle(fontSize: 18.sp),)),
      ],
    );
  }
}