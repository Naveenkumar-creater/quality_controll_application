import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:qc_control_app/constant/Exception/show_pop_error.dart';
import 'package:qc_control_app/feature/domain_layer/entity/eventquee_entity.dart';
import 'package:qc_control_app/feature/presentation_layer/api_service.dart/actionstep_di.dart';
import 'package:qc_control_app/feature/presentation_layer/api_service.dart/eventsample_di.dart';
import 'package:qc_control_app/feature/presentation_layer/api_service.dart/inspectionparameter_di.dart';
import 'package:qc_control_app/feature/presentation_layer/api_service.dart/interruption_status_di.dart';
import 'package:qc_control_app/feature/presentation_layer/api_service.dart/listofrestart_di.dart';
import 'package:qc_control_app/feature/presentation_layer/api_service.dart/reaction_di.dart';
import 'package:qc_control_app/feature/presentation_layer/api_service.dart/sampleoverallstatus_di.dart';
import 'package:qc_control_app/feature/presentation_layer/layout/eventsamplelayout.dart';
import 'package:qc_control_app/feature/presentation_layer/layout/inspectionpagelayout.dart';
import 'package:qc_control_app/feature/presentation_layer/local_stored_data_model/eventqueelocaldata_model.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/eventquee_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/eventqueelocaldata_provider.dart';

import '../../api_service.dart/inspectionsample_di.dart';

class Eventqueewidget extends StatefulWidget {
  const Eventqueewidget({super.key});

  @override
  State<Eventqueewidget> createState() => _EventqueewidgetState();
}

class _EventqueewidgetState extends State<Eventqueewidget> {
  bool shemmer = true;
  InspectionparameterDi inspectionparam = InspectionparameterDi();
  InspectionsampleDi inspectionsampleDi = InspectionsampleDi();
  EventsampleDi eventsampleDi=EventsampleDi();
  InterruptionStatusDi interruptionStatusDi =InterruptionStatusDi();
  // ReactionDi reactionDi=ReactionDi(); 
  SampleoverallstatusDi overallstaus=SampleoverallstatusDi(); 
  ActionstepDi actionstepDi =ActionstepDi();
  ListofrestartDi listofrestartDi =ListofrestartDi();
   List<TextEditingController> enterDescription = [];

  @override
  void initState() {
    super.initState();
     
  }


//   void fetchDatafromDatabase({
// EventQueueListEntity? eventlist
//   })async{

//     try {

// await listofrestartDi.getRestartEvent(context: context, imfgpid: eventlist?.imfgpId ?? 0, activityid: eventlist?.imfgpPaId ?? 0);
// await overallstaus.getAction(context: context, clgroup: "LINE_STATUS");
// await actionstepDi.getAction(clgroup: "ACTION_TAKEN_STATUS", context: context);
// await reactionDi.getReaction(context: context, queeid: eventlist?.iqcIiqId ?? 0 , queestatus:   eventlist?.iqcIiqStatus ?? 0, eventtriggerid:  eventlist?.iqcIiqIieId ?? 0, imfgpid: eventlist?.imfgpId ?? 0, cphid:   eventlist?.iqcIieCphId ?? 0,previouseventid: eventlist?.previouseventid ?? 0);

// await interruptionStatusDi.getInterruptionEventStatus(
//   activityId:   eventlist?.imfgpPaId ?? 0 ,context:context ,imfgpid: eventlist?.imfgpId ?? 0
// );

//      await inspectionparam.getInpectionParam(
//                                             context: context,
//                                             headerId:
//                                                 eventlist?.iqcIieCphId ?? 0,
//                                             activityId:
//                                                 eventlist?.imfgpPaId ?? 0);

//                                   //  await inspectionsampleDi.getSampleList(
//                                   //           context: context,
//                                   //           headerid:
//                                   //               eventlist?.iqcIieCphId ?? 0,
//                                   //           activityid:
//                                   //               eventlist?.imfgpPaId ?? 0,
//                                   //           eventid: eventlist?.iqcIieIeId ?? 0,
//                                   //           eventtriggerid:
//                                   //               eventlist?.iqcIiqIieId ?? 0,
//                                   //           imfgpid: eventlist?.imfgpId ?? 0,
//                                   //           processid:
//                                   //               eventlist?.imfgpMpmId ?? 0,
//                                   //           queeid: eventlist?.iqcIiqId ?? 0,
//                                   //           queestatus:
//                                   //               eventlist?.iqcIiqStatus ?? 0,
//                                   //           samplesize: eventlist
//                                   //                   ?.iqcIiqMaxSampleSize ??
//                                   //               0);
      
//     } catch (e) {
//       ShowError.showAlert(context,e.toString());
//     }



//   }

  void getEvenqueedata(EventQueueListEntity? eventlist) {
    final evenqueedata = EventQueuelocalDataModel(
      pcid: eventlist?.pcid,
        iqcIiqDate: eventlist?.iqcIiqDate,
        pcCardNo: eventlist?.pcCardNo,
        imfgpPaId: eventlist?.imfgpPaId,
        mpmName: eventlist?.mpmName,
        iqcIiqSampleUomId: eventlist?.iqcIiqSampleUomId,
        itemName: eventlist?.itemName,
        pcItemCode: eventlist?.pcItemCode,
        iqcIiqIieId: eventlist?.iqcIiqIieId,
        iqcIiqMaxSampleSize: eventlist?.iqcIiqMaxSampleSize,
        pcItemId: eventlist?.pcItemId,
        paActivityName: eventlist?.paActivityName,
        iqcIiqInspectionType: eventlist?.iqcIiqInspectionType,
        iqcIieAssetId: eventlist?.iqcIieAssetId,
        iqcIiqStatus: eventlist?.iqcIiqStatus,
        iqcIieCphId: eventlist?.iqcIieCphId,
        iqcIeEventName: eventlist?.iqcIeEventName,
        imfgpMpmId: eventlist?.imfgpMpmId,
        imfgpProcessSeq: eventlist?.imfgpProcessSeq,
        iqcIiqAssignedTo: eventlist?.iqcIiqAssignedTo,
        imfgpId: eventlist?.imfgpId,
        iqcIiqId: eventlist?.iqcIiqId,
         natureEvent: eventlist?.natureEvent,
         iqcIieIeId: eventlist?.iqcIieIeId,
        previouseventid: eventlist?.previouseventid,
        cavityflag: eventlist?.cavityflag,
        iqcpreviousid: eventlist?.iqcpreviousid,
        toolId: eventlist?.toolid
      );

    Provider.of<EventqueelocaldataProvider>(context, listen: false)
        .setEventqueedata(evenqueedata);
  }


  Widget _infoRow(IconData icon, String title, String value) {
    return Row(
      children: [
        Icon(icon, size: 20.sp, color: Colors.blueGrey.shade700),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade700,
              fontFamily: "Lexend",
            ),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
            fontFamily: "Lexend",
          ),
        ),
      ],
    );
  }


   Widget _infoBadge(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.w500,
        color: Colors.black,
        fontFamily: "Lexend",
      ),
    );
  }



 Widget _divider() {
    return Divider(thickness: 1, color: Colors.grey.shade300, height: 16.h);
  }

  


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width < 600;
    return size
        ?  Expanded(
      child: Consumer<EventqueeProvider>(
        builder: (context, eventqueeProvider, child) {
          final event = eventqueeProvider.event?.eventQueueListEntity ?? [];

          return ListView.builder(
            itemCount: event.length,
     
            itemBuilder: (context, index) {
              final eventlist = event[index];

              return Card(
                elevation: 4, // Subtle shadow
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.r),
                ),
                margin: EdgeInsets.only(bottom: 14.h),
            
                child: Theme(
                  data: Theme.of(context).copyWith(
                    dividerColor: Colors.transparent,
                    splashColor: Colors.transparent,
                  ),
                  child: ExpansionTile(
                    // tilePadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    leading: CircleAvatar(
                      radius: 18.r,
                      backgroundColor:const Color(0xFF5060CB),
                      child: Text(
                        "${index + 1}",
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Lexend",
                        ),
                      ),
                    ),
                    title: Text(
                      eventlist.iqcIeEventName ?? "No Event Name",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontFamily: "Lexend",
                      ),
                    ),
                    subtitle: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _infoBadge(eventlist.itemName ?? "N/A"),
                        _infoBadge(eventlist.statusName ?? "Pending"),
                      ],
                    ),
                    trailing: Icon(Icons.keyboard_arrow_down, color: Colors.grey.shade600),
                    children: [
                      Container(
                        padding: EdgeInsets.all(14.w),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16.r)),
                        ),
                        child: Column(
                          children: [
                            _infoRow(Icons.assignment, "Job Card", eventlist.pcCardNo ?? "N/A"),
                            _divider(),
                            _infoRow(Icons.build, "Asset", eventlist.assetName ?? "N/A"),
                            _divider(),
                            _infoRow(Icons.calendar_month, "Date", eventlist.iqcIiqDate.toString().substring(0,19) ),
                            _divider(),

                                        Row(
      children: [
        Icon(Icons.open_in_new		, size: 20.sp, color: Colors.blueGrey.shade700),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            "Open",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade700,
              fontFamily: "Lexend",
            ),
          ),
        ),
         IconButton(onPressed: () async{

                                   getEvenqueedata(eventlist);
                                    //  await   inspectionparam.getInpectionParam(
                                    //         context: context,
                                    //         headerId:
                                    //             eventlist.iqcIieCphId ?? 0,
                                    //         activityId:
                                    //             eventlist.imfgpPaId ?? 0);

                                       await eventsampleDi.getEventSampleList(
                                            context: context,
                                            headerid:
                                                eventlist.iqcIieCphId ?? 0,
                                            activityid:
                                                eventlist.imfgpPaId ?? 0,
                                            eventid: eventlist.iqcIieIeId ?? 0,
                                            eventtriggerid:
                                                eventlist.iqcIiqIieId ?? 0,
                                            imfgpid: eventlist.imfgpId ?? 0,
                                            processid:
                                                eventlist.imfgpMpmId ?? 0,
                                            queeid: eventlist.iqcIiqId ?? 0,
                                            queestatus:
                                                eventlist.iqcIiqStatus ?? 0,
                                            samplesize: eventlist
                                                    .iqcIiqMaxSampleSize ??
                                                0);
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                          builder: (context) {
                                            return const EventSampleLayout();
                                          },
                                        ));
                                  }, 
                                  
                                  icon:const Align(
                                    alignment: Alignment.centerRight,
                                    child:  Icon(Icons.arrow_forward_rounded, size: 30,color: Color(0xFF5060CB),))
                                  
                                  )
      ],
    )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    )
        : SizedBox(
            height: 685.h,
            child: Column(
              children: [
                Container(
                  height: 80.h,
                  decoration: BoxDecoration(
                      color:const  Color.fromARGB(255, 45, 54, 104),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5.r),
                          topRight: Radius.circular(5.r))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.centerLeft,
                                             
                            child: Text(
                              "S.No",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Lexend",
                                  fontSize: 18.sp),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.centerLeft,
                   
                            child: Text(
                              "Event",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Lexend",
                                  fontSize: 18.sp),
                            ),
                          ),
                        ),
                     Expanded(
                          flex: 3,
                          child: Container(
                            alignment: Alignment.centerLeft,
                      
                            child: Text(
                              "Production Card",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Lexend",
                                  fontSize: 18.sp),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.centerLeft,
                                          
                            child: Text(
                              "Item",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Lexend",
                                  fontSize: 18.sp),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.centerLeft,
                                  
                            child: Text(
                              "Assets",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Lexend",
                                  fontSize: 18.sp),
                            ),
                          ),
                        ),
                     Expanded(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.centerLeft,         
                            child: Text(
                              "Status",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Lexend",
                                  fontSize: 18.sp),
                            ),
                          ),
                        ),
                    Expanded(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.centerLeft,
                  
                            child: Text(
                              "Issued Time",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Lexend",
                                  fontSize: 18.sp),
                            ),
                          ),
                        ),
                                  Expanded(
                          flex:1 ,
                          child: Container(
                            alignment: Alignment.centerLeft,
                  
                            child: Text(
                              "",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Lexend",
                                  fontSize: 18.sp),
                            ),
                          ),
                        ),


                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Consumer<EventqueeProvider>(
                      builder: (context, eventqueeProvider, child) {
                    final event = eventqueeProvider.event?.eventQueueListEntity;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: event?.length,
                      itemBuilder: (context, index) {
                        final eventlist = event?[index];
                        final issuedDate=eventlist?.iqcIiqDate.toString().substring(0,16);
                        return Container(
                          decoration: BoxDecoration(
                              color: index % 2 == 0
                                  ? Colors.grey.shade50
                                  : Colors.grey.shade200,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(5.r),
                                  bottomRight: Radius.circular(5.r))),
                          height: 85.h,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                             Expanded(
                          flex: 1,
                                  child: Container(
                                                               alignment: Alignment.centerLeft,
                                                          
                                    child: Text(
                                      "${index + 1}",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontFamily: "Lexend",
                                          fontSize: 15.sp),
                                    ),
                                  ),
                                ),
                                  Expanded(
                          flex: 2,
                                  child: Container(
                                                       alignment: Alignment.centerLeft,
                                   padding: const EdgeInsets.only(right: 10 ),
                                    child: Text(
                                      "${eventlist?.iqcIeEventName}",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontFamily: "Lexend",
                                          fontSize: 15.sp),
                                    ),
                                  ),
                                ),
                               Expanded(
                          flex: 3,
                                  child: Container(
                                                       alignment: Alignment.centerLeft,
                                                                
                                    child: Text(
                                      "${eventlist?.pcCardNo}",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontFamily: "Lexend",
                                          fontSize: 15.sp),
                                    ),
                                  ),
                                ),
                        Expanded(
                          flex: 2,
                                  child: Container(
                                                       alignment: Alignment.centerLeft,
                                                              
                                    child: Text(
                                      "${eventlist?.itemName}",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontFamily: "Lexend",
                                          fontSize: 15.sp),
                                    ),
                                  ),
                                ),
                                     Expanded(
                          flex: 2,
                                  child: Container(
                                                       alignment: Alignment.centerLeft,
                                                         
                                    child: Text(
                                      "${eventlist?.assetName}",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontFamily: "Lexend",
                                          fontSize: 15.sp),
                                    ),
                                  ),
                                ),
                                     Expanded(
                          flex: 2,
                                  child: Container(
                                                       alignment: Alignment.centerLeft,
                                                                
                                    child: Text(
                                      "${eventlist?.statusName}",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontFamily: "Lexend",
                                          fontSize: 15.sp),
                                    ),
                                  ),
                                ),
                                    Expanded(
                          flex: 2,
                                  child: Container(
                                                       alignment: Alignment.centerLeft,
                                                      
                                    child: Text(
                                     issuedDate ?? "",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontFamily: "Lexend",
                                          fontSize: 15.sp),
                                    ),
                                  ),
                                ),
                              
                                Expanded(
                          flex: 1,
                                  child: Container(
                                                               alignment: Alignment.center,
                                                             
                                      child: IconButton(
                                          onPressed: () async{
                                          getEvenqueedata(eventlist);
    await eventsampleDi.getEventSampleList(
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


                                             
                                                             
                                     if (context.mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const EventSampleLayout(),
            ),
          );
        }
      
                                          },
                                          icon: const Icon(Icons.arrow_forward_outlined))),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }),
                )
              ],
            ),
          );
  }
}
