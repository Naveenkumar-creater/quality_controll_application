// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qc_control_app/constatnt/customwidgets/customtheme.dart';

class Tablelayout extends StatelessWidget {
  Widget ? child;
   Tablelayout({
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Expanded(
        child: Container(
       
        decoration: BoxDecoration(
          color: ThemeClass.backgroundcolor,
          borderRadius: BorderRadius.all(Radius.circular(5.r)) ),
        child:child ,
      ),
    );
  }
}
  