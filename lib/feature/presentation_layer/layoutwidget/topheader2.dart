import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qc_control_app/constatnt/customwidgets/customtheme.dart';

class TopHeader2Widget extends StatelessWidget {
  Widget ?child;
 TopHeader2Widget({
  this.child
  
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 85.h,

        decoration: BoxDecoration(color: ThemeClass.backgroundcolor,
        
        borderRadius: BorderRadius.all(Radius.circular(5.r)) ),
        child:child ,
      ),
    );
  }
}