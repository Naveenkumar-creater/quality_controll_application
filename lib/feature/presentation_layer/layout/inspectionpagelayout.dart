import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:qc_control_app/constatnt/customwidgets/customtheme.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/eventqueelocaldata_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/inspecSampleLocalData_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/responsive_screen/tablet_body.dart';

import 'package:qc_control_app/feature/presentation_layer/widget/inspectionpage_widget/inspectionheader_widget.dart';
import 'package:qc_control_app/feature/presentation_layer/widget/inspectionpage_widget/tapbar_widget.dart';
import 'package:qc_control_app/feature/presentation_layer/layoutwidget/advancetablayout_widget.dart';
import 'package:qc_control_app/feature/presentation_layer/layoutwidget/topheader2.dart';
import 'package:qc_control_app/feature/presentation_layer/widget_mapping_file.dart';

import '../widget/homepage_widget/topheader/currenttimewidget.dart';
import '../widget/inspectionpage_widget/inspesampletabelwidget .dart';
import '../widget/interruption_widget/reactiontable_widget.dart';

class Inspectionpagelayout extends StatefulWidget {
  const Inspectionpagelayout({super.key});

  @override
  State<Inspectionpagelayout> createState() => _Inspectionpagelayout();
}

class _Inspectionpagelayout extends State<Inspectionpagelayout> {
  String layoutwidgetname = "Inspecparam";

  @override
  Widget build(BuildContext context) {
    Widget? inpectionparamtable = WidgetMappingFile.getwidget(layoutwidgetname);
      // final natureEvent =
      //   Provider.of<EventqueelocaldataProvider>(context, listen: false)?.queedata?.natureEvent ?? 0;

   int   natureEvent = Provider.of<EventqueelocaldataProvider>(context, listen: false).queedata?.natureEvent ?? 0;

    final Size = MediaQuery.of(context).size.width < 600;

    return Size
        ? Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Inspection",
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: Color.fromARGB(255, 80, 96, 203),
                        fontFamily: "Lexend",
                        fontWeight: FontWeight.w500),
                  ),
                  Currenttimewidget(),
                ],
              ),
              automaticallyImplyLeading: true,
              leading: BackButton(
                color: Color.fromARGB(255, 80, 96, 203),
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
                          InspectionHeaderWidget(),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              AdvancetableyoutWidget(child: TabBarWidget()),
                            ],
                          ),
                        ]),
                  )),
            ),
          )

        :   PopScope(
  canPop: false, // Prevents default back button behavior
  onPopInvoked: (didPop) {
    if (!didPop) {
      // Navigate back to MainPage and replace the current page

     Provider.of<InspecsampleLocalDataProvider>(context, listen: false).reset();
     
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const ResponsiveTabletHomepage(),
        ),
      );
    }
  },
  
      child: Scaffold(
       appBar: AppBar(
         automaticallyImplyLeading: true,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Inspection",
                      style: TextStyle(
                          fontSize: 24.sp,
                          color: Color.fromARGB(255, 80, 96, 203),
                          fontFamily: "Lexend",
                          fontWeight: FontWeight.w500),
                    ),
                    Currenttimewidget(),
                  ],
                ),
               
                leading: BackButton(
                  color: Color.fromARGB(255, 80, 96, 203),
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
                                TopHeader2Widget(child: InspectionHeaderWidget()),
                              ],
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Row(
                              children: [
                                AdvancetableyoutWidget(
                                  
                                  child: natureEvent == 2 ?
                                ReactionTableWidget() : InspecSampletabelwidget(), 
                                //  TabBarWidget()
                                 
                                 ),
                              ],
                            ),
                          ]),
                    )),
              ),
            ),
        );
  }
}
