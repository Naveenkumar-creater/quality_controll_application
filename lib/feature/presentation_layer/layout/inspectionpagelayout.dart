import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:qc_control_app/constant/customwidgets/customtheme.dart';
import 'package:qc_control_app/feature/data_layer/remote/inspectionsample_datasource.dart';
import 'package:qc_control_app/feature/presentation_layer/api_service.dart/eventsample_di.dart';
import 'package:qc_control_app/feature/presentation_layer/layout/eventsamplelayout.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/eventqueelocaldata_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/widget/inspectionpage_widget/inspectionheader_widget.dart';
import 'package:qc_control_app/feature/presentation_layer/widget/inspectionpage_widget/tapbar_widget.dart';
import 'package:qc_control_app/feature/presentation_layer/layoutwidget/advancetablayout_widget.dart';
import 'package:qc_control_app/feature/presentation_layer/layoutwidget/topheader2.dart';
import '../provider/inspectionsample_provider.dart';
import '../widget/homepage_widget/topheader/currenttimewidget.dart';
import '../widget/inspectionpage_widget/inspesampletabelwidget .dart';

class Inspectionpagelayout extends StatefulWidget {
  const Inspectionpagelayout({super.key});

  @override
  State<Inspectionpagelayout> createState() => _Inspectionpagelayout();
}

class _Inspectionpagelayout extends State<Inspectionpagelayout> {
  String layoutwidgetname = "Inspecparam";
     EventsampleDi eventsampleDi=EventsampleDi();

  @override
  Widget build(BuildContext context) {
    // Widget? inpectionparamtable = WidgetMappingFile.getwidget(layoutwidgetname);
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
                        color:const  Color.fromARGB(255, 80, 96, 203),
                        fontFamily: "Lexend",
                        fontWeight: FontWeight.w500),
                  ),
                  const Currenttimewidget(),
                ],
              ),
              automaticallyImplyLeading: true,
              leading: const BackButton(
                color: Color.fromARGB(255, 80, 96, 203),
              ),
              backgroundColor: ThemeClass.backgroundcolor,
            ),
            body: SingleChildScrollView(
              child: Container(
                  decoration: const  BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InspectionHeaderWidget(),
                         const  SizedBox(
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
  canPop: false,
  onPopInvoked: (didPop) async {
    if (!didPop) {
      final eventsamplesetqueestatus =
          Provider.of<InspectionsampleProvider>(context, listen: false)
              .sample?.listOfSamplesEntity.first.iqcIiqStatus;

      final eventlist =
          Provider.of<EventqueelocaldataProvider>(context, listen: false)
              .queedata;

      // ✅ Await the API call to finish
      await eventsampleDi.getEventSampleList(
        context: context,
        headerid: eventlist?.iqcIieCphId ?? 0,
        activityid: eventlist?.imfgpPaId ?? 0,
        eventid: eventlist?.iqcIieIeId ?? 0,
        eventtriggerid: eventlist?.iqcIiqIieId ?? 0,
        imfgpid: eventlist?.imfgpId ?? 0,
        processid: eventlist?.imfgpMpmId ?? 0,
        queeid: eventlist?.iqcIiqId ?? 0,
        queestatus: eventsamplesetqueestatus ?? 0,
        samplesize: eventlist?.iqcIiqMaxSampleSize ?? 0,
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const EventSampleLayout(),
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
                      "InspectionSamples",
                      style: TextStyle(
                          fontSize: 24.sp,
                          color: const Color.fromARGB(255, 80, 96, 203),
                          fontFamily: "Lexend",
                          fontWeight: FontWeight.w500),
                    ),
                   const Currenttimewidget(),
                  ],
                ),
               
                leading: const BackButton(
                  color: Color.fromARGB(255, 80, 96, 203),
                ),
                backgroundColor: ThemeClass.backgroundcolor,
              ),
              body: SingleChildScrollView(
                child: Container(
                    decoration:const  BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                HeaderLayoutWidget(child: InspectionHeaderWidget()),
                              ],
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Row(
                              children: [
                                AdvancetableyoutWidget(
                                  
                                      child:  const InspecSampletabelwidget(), 
                              //     child: natureEvent == 2 ?
                              // const ReactionTableWidget() : const InspecSampletabelwidget(), 
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
