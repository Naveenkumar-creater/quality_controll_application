import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qc_control_app/feature/presentation_layer/widget/layoutwidget/boxwidget.dart';
import 'package:qc_control_app/feature/presentation_layer/widget/layoutwidget/topheaderwidget.dart';
import 'package:qc_control_app/feature/presentation_layer/widget_mapping_file.dart';

class Hompagelayout3 extends StatefulWidget {
  const Hompagelayout3({super.key});

  @override
  State<Hompagelayout3> createState() => _Hompagelayout3State();
}

class _Hompagelayout3State extends State<Hompagelayout3> {
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
           height: 758.h,
        decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      TopHeaderWidget(child:Text("") 
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
                                      TopHeaderWidget(child:Text("") 
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
                                 
                                  
                                  
                                   
                                ]
                              )

      ),
    );
  }
}