import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qc_control_app/feature/presentation_layer/widget/homepage_widget/eventqueewidget.dart';
import 'package:qc_control_app/feature/presentation_layer/widget/homepage_widget/homeheaderwidget.dart';
import 'package:qc_control_app/feature/presentation_layer/layoutwidget/boxwidget.dart';
import 'package:qc_control_app/feature/presentation_layer/layoutwidget/tablelayetwidget.dart';
import 'package:qc_control_app/feature/presentation_layer/layoutwidget/topheader2.dart';
import 'package:qc_control_app/feature/presentation_layer/widget_mapping_file.dart';

class Hompagelayout extends StatefulWidget {
  const Hompagelayout({super.key});

  @override
  State<Hompagelayout> createState() => _HompagelayoutState();
}

class _HompagelayoutState extends State<Hompagelayout> {



  String layoutwidgetname = "event";
   String box1="box1";
   String box2="box2";
   String box3="box3";
   String box4="box4";

  @override
  Widget build(BuildContext context) {

  Widget ? thirdwidget =WidgetMappingFile.getwidget(layoutwidgetname);
  Widget ? box1widget =WidgetMappingFile.getwidget(box1);
  Widget ? box2widget =WidgetMappingFile.getwidget(box2);
  Widget ? box3widget =WidgetMappingFile.getwidget(box3);
  Widget ? box4widget =WidgetMappingFile.getwidget(box4);

    return Expanded(
      child: Container(
        
        decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      TopHeader2Widget(child:Homeheaderwidget()
                                     ),
                                  
                                    ],
                                  ),
                                  SizedBox(height: 8.h,),

                                   Container(
                                   
                                    height: 170.h,
                                     child: Row(
                                          children: [
                                            Boxwidget(child: box1widget ?? Container(),),
                                              SizedBox(width: 8,),
                                              Boxwidget(child:box2widget??Container() ,),
                                                      SizedBox(width: 8,),
                                              Boxwidget(child: box3widget??Container(),),
                                                      SizedBox(width: 8,),
                                              Boxwidget(child: box4widget??Container(),),
                                              
                                                     
                                          ],
                                        ),
                                   ),
 SizedBox(height: 8.h,),
                                Row(
                                    children: [
                                      Tablelayout(child:Eventqueewidget()
                                     ),
                                  
                                    ],
                                  ),
                                ]
                              )

      ),
    );
  }
}