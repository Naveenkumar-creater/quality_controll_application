import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopHeaderWidget extends StatelessWidget {
  Widget ?child;
 TopHeaderWidget({
  this.child
  
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 170.h,

        decoration: BoxDecoration(color: Color.fromARGB(150, 235, 236, 255),
        
        borderRadius: BorderRadius.all(Radius.circular(5.r)) ),
        child:child ,
      ),
    );
  }
}