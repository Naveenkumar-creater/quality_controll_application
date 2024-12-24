import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qc_control_app/constatnt/customwidgets/customtheme.dart';
import 'package:qc_control_app/feature/presentation_layer/widget/inspectionpage_widget/inspectionheader_widget.dart';
import 'package:qc_control_app/feature/presentation_layer/widget/inspectionpage_widget/tapbar_widget.dart';
import 'package:qc_control_app/feature/presentation_layer/layoutwidget/advancetablayout_widget.dart';
import 'package:qc_control_app/feature/presentation_layer/layoutwidget/topheader2.dart';
import 'package:qc_control_app/feature/presentation_layer/widget_mapping_file.dart';

import '../widget/homepage_widget/topheader/currenttimewidget.dart';


class Inspectionpagelayout extends StatefulWidget {
  const Inspectionpagelayout({super.key});

  @override
  State<Inspectionpagelayout> createState() => _Hompagelayout3State();
}

class _Hompagelayout3State extends State<Inspectionpagelayout> {
  String layoutwidgetname = "Inspecparam";
  

  @override
  Widget build(BuildContext context) {

  Widget ? inpectionparamtable =WidgetMappingFile.getwidget(layoutwidgetname);
 

    return Scaffold(
      backgroundColor: Colors.white,
appBar: AppBar(
  title: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text("Inspection",style: TextStyle(fontSize: 24.sp,
                                        color: Color.fromARGB(255, 80, 96, 203),
                                        fontFamily: "Lexend",
                                        fontWeight: FontWeight.w500),),
                                          Currenttimewidget(),
                                        
                                        
    ],
  ),
  automaticallyImplyLeading: true,
  leading: BackButton(
     color:Color.fromARGB(255, 80, 96, 203),
   ), 
  backgroundColor: ThemeClass.backgroundcolor,
  
  
  ),

  body: SingleChildScrollView(
    child: Container(
     
        decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        TopHeader2Widget(child:InspectionHeaderWidget() 
                                       ),
                                    
                                      ],
                                    ),
                                    SizedBox(height: 8.h,),
                                  
                                  Row(
                                      children: [
                                        AdvancetableyoutWidget(child:TabBarWidget()
                                       ),
                                    
                                      ],
                                    ),
                                  
                                  ]
                                ),
                              )
    
      ),
  ),
    );
  }
}