import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:qc_control_app/constant/Exception/show_pop_error.dart';
import 'package:qc_control_app/constant/customwidgets/customtheme.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/eventqueelocaldata_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/inspecSampleLocalData_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/responsive_screen/tablet_body.dart';
import 'package:qc_control_app/feature/presentation_layer/widget/eventsample_widget/eventsampleset_table.dart';

import 'package:qc_control_app/feature/presentation_layer/widget/inspectionpage_widget/inspectionheader_widget.dart';
import 'package:qc_control_app/feature/presentation_layer/widget/inspectionpage_widget/tapbar_widget.dart';
import 'package:qc_control_app/feature/presentation_layer/layoutwidget/advancetablayout_widget.dart';
import 'package:qc_control_app/feature/presentation_layer/layoutwidget/topheader2.dart';
import '../api_service.dart/eventsample_di.dart';
import '../api_service.dart/inspectionsample_di.dart';
import '../widget/homepage_widget/topheader/currenttimewidget.dart';
import '../widget/interruption_widget/reactiontable_widget.dart';

class EventSampleLayout extends StatefulWidget {
  const EventSampleLayout({super.key});

  @override
  State<EventSampleLayout> createState() => _EventSampleLayout();
}

class _EventSampleLayout extends State<EventSampleLayout> {
  // String layoutwidgetname = "Inspecparam";
  InspectionsampleDi inspectionsampleDi = InspectionsampleDi();
   EventsampleDi eventsampleDi=EventsampleDi();
     bool isLoading = true;

@override
  void initState() {
       WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchDatafromDatabase();
    }); 
    
    super.initState();
  }



  void fetchDatafromDatabase() async {
    try {
             final eventlist =
          Provider.of<EventqueelocaldataProvider>(context, listen: false)
              .queedata;

              eventsampleDi.getEventSampleList(
                                            context: context,
                                            headerid:
                                                eventlist?.iqcIieCphId ?? 0,
                                            activityid:
                                                eventlist?.imfgpPaId ?? 0,
                                            eventid: eventlist?.iqcIieIeId ?? 0,
                                            eventtriggerid:
                                                eventlist?.iqcIiqIieId ?? 0,
                                            imfgpid: eventlist?.imfgpId ?? 0,
                                            processid:
                                                eventlist?.imfgpMpmId ?? 0,
                                            queeid: eventlist?.iqcIiqId ?? 0,
                                            queestatus:
                                            eventlist?.iqcIiqStatus ?? 0,
                                            samplesize: eventlist
                                                    ?.iqcIiqMaxSampleSize ??
                                                0);   
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ShowError.showAlert(context, e.toString());
    }
  }


  
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
                    "Inspection Sample Sets",
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
  onPopInvoked: (didPop) {
    if (!didPop) {

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
                    natureEvent == 2 ?
                    Text(
                      "Reaction",
                      style: TextStyle(
                          fontSize: 24.sp,
                          color: const Color.fromARGB(255, 80, 96, 203),
                          fontFamily: "Lexend",
                          fontWeight: FontWeight.w500),
                    ):      Text(
                      "Inspection Sample Sets",
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
                                isLoading ? CircularProgressIndicator():
                                AdvancetableyoutWidget(
                                  
                                  child: natureEvent == 2 ?
                              const ReactionTableWidget() : const EventsamplesetTable(), 
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
