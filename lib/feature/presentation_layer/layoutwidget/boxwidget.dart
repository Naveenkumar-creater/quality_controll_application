import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qc_control_app/constant/customwidgets/customtheme.dart';

class Boxwidget extends StatelessWidget {
  final double width ;
  final double height;
  Widget child;
 Boxwidget({ required this.child,
 required this.width,
 required this.height,
 
 
 
 });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: ThemeClass.backgroundcolor,
        borderRadius: BorderRadius.all(Radius.circular(5.r))
      ),
      child: child,
    );
  }
}