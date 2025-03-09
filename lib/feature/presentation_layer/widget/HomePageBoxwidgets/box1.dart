import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Box1 extends StatelessWidget {
  const Box1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text("Quality",style: TextStyle(fontSize: 18.sp),)),
      ],
    );
  }
}