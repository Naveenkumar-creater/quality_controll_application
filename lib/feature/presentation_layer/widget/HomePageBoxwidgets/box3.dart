import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Box3 extends StatelessWidget {
  const Box3({super.key});

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