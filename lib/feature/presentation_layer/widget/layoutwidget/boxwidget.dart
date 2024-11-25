import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Boxwidget extends StatelessWidget {
  Widget child;
 Boxwidget({ required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 248.w,
      height: 170.h,
      decoration: BoxDecoration(
        color: Color.fromARGB(150, 235, 236, 255),
        borderRadius: BorderRadius.all(Radius.circular(5.r))
      ),
      child: child,
    );
  }
}