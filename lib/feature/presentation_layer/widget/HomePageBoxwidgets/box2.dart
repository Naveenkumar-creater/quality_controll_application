import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Box2 extends StatelessWidget {
  const Box2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text("Control",style: TextStyle(fontSize: 18.sp),)),
      ],
    );
  }
}