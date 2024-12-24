import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qc_control_app/constatnt/customwidgets/custombutton.dart';
import 'package:qc_control_app/constatnt/customwidgets/customtheme.dart';
import 'package:qc_control_app/feature/presentation_layer/layoutwidget/tablelayetwidget.dart';
import 'package:qc_control_app/feature/presentation_layer/widget/inspectionpage_widget/inspectionheader_widget.dart';
import 'package:qc_control_app/feature/presentation_layer/layoutwidget/topheader2.dart';
import 'package:qc_control_app/feature/presentation_layer/widget_mapping_file.dart';

import '../widget/inspectionpage_widget/obs_header_widget.dart';
import '../widget/inspectionpage_widget/obs_pararmeter_widget.dart';

class Obsparameterlayout extends StatefulWidget {
  const Obsparameterlayout({super.key});

  @override
  State<Obsparameterlayout> createState() => _Hompagelayout3State();
}

class _Hompagelayout3State extends State<Obsparameterlayout> {
  String layoutwidgetname = "Inspecparam";

  @override
  Widget build(BuildContext context) {
    Widget? inpectionparamtable = WidgetMappingFile.getwidget(layoutwidgetname);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Observation",
              style: TextStyle(
                fontSize: 24.sp,
                color: Color.fromARGB(255, 80, 96, 203),
                fontFamily: "Lexend",
                fontWeight: FontWeight.w500,
              ),
            ),
          
          ],
        ),
        automaticallyImplyLeading: true,
        leading: BackButton(
          color: Color.fromARGB(255, 80, 96, 203),
        ),
        backgroundColor: ThemeClass.backgroundcolor,
      ),
      resizeToAvoidBottomInset: true, // Ensures the layout adjusts when the keyboard appears
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
                    TopHeader2Widget(
                      child: ObsSampleHeaderWidget(),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Tablelayout(
                      child: ObsPararmeterWidget(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
    