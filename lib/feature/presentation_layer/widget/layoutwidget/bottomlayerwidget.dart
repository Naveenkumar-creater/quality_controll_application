// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Thirdlayout extends StatelessWidget {
  Widget ? child;
   Thirdlayout({
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(
      height: 400.h,

      decoration: BoxDecoration(
         color: Color.fromARGB(150, 235, 236, 255),
        
        borderRadius: BorderRadius.all(Radius.circular(5.r)) ),
        child:child ,
      ),
    );
  }
}
