// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:qc_control_app/constant/customwidgets/customtheme.dart';


class HeaderLayoutWidget extends StatelessWidget {
  Widget ?child;
  HeaderLayoutWidget({
    super.key,
    required this.child,
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
