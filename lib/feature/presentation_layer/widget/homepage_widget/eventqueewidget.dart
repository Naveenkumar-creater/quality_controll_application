import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:qc_control_app/feature/domain_layer/entity/eventquee_entity.dart';
import 'package:qc_control_app/feature/presentation_layer/api_service.dart/inspectionparameter_di.dart';
import 'package:qc_control_app/feature/presentation_layer/layout/inspectionpagelayout.dart';
import 'package:qc_control_app/feature/presentation_layer/local_stored_data_model/eventqueedata_model.dart';
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

  @override
  void initState() {
    super.initState();
  }


  void getEvenqueedata( EventQueueListEntity? eventlist){

   final evenqueedata =  EventQueuelocalDataModel(
                                      iqcIiqDate: eventlist?.iqcIiqDate,
                                      pcCardNo: eventlist?.pcCardNo,
                                      imfgpPaId: eventlist?.imfgpPaId,
                                      mpmName: eventlist?.mpmName,
                                      iqcIiqSampleUomId:
                                          eventlist?.iqcIiqSampleUomId,
                                      itemName: eventlist?.itemName,
                                      pcItemCode: eventlist?.pcItemCode,
                                      iqcIiqIieId: eventlist?.iqcIiqIieId,
                                      iqcIiqMaxSampleSize:
                                          eventlist?.iqcIiqMaxSampleSize,
                                      pcItemId: eventlist?.pcItemId,
                                      paActivityName: eventlist?.paActivityName,
                                      iqcIiqInspectionType:
                                          eventlist?.iqcIiqInspectionType,
                                      iqcIieAssetId: eventlist?.iqcIieAssetId,
                                      iqcIiqStatus: eventlist?.iqcIiqStatus,
                                      iqcIieCphId: eventlist?.iqcIieCphId,
                                      iqcIeEventName: eventlist?.iqcIeEventName,
                                      imfgpMpmId: eventlist?.imfgpMpmId,
                                      imfgpProcessSeq:
                                          eventlist?.imfgpProcessSeq,
                                      iqcIiqAssignedTo:
                                          eventlist?.iqcIiqAssignedTo,
                                      imfgpId: eventlist?.imfgpId);

        Provider.of<EventqueelocaldataProvider>(context,listen: false).setEventqueedata(evenqueedata);                              
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.h,
      child: Column(
        children: [
          Container(
            height: 80.h,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 45, 54, 104),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5.r),
                    topRight: Radius.circular(5.r))),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 60.w,
                  child: Text(
                    "S.No",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Lexend",
                        fontSize: 18.sp),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 150.w,
                  child: Text(
                    "Event",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Lexend",
                        fontSize: 18.sp),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 150.w,
                  child: Text(
                    "Job Id",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Lexend",
                        fontSize: 18.sp),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 150.w,
                  child: Text(
                    "Item Ref",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Lexend",
                        fontSize: 18.sp),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 150.w,
                  child: Text(
                    "Asset Id",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Lexend",
                        fontSize: 18.sp),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 100.w,
                  child: Text(
                    "Status",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Lexend",
                        fontSize: 18.sp),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 200.w,
                  child: Text(
                    "Issued Time",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Lexend",
                        fontSize: 18.sp),
                  ),
                ),
              ],
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
                  return Container(
                    decoration: BoxDecoration(
                        color: index % 2 == 0
                            ? Colors.grey.shade50
                            : Colors.grey.shade200,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5.r),
                            bottomRight: Radius.circular(5.r))),
                    height: 85.h,
                    child: Row(
                      children: [
                        Container(  
                          alignment: Alignment.center,
                          width: 60.w,
                          child: Text(
                            "${index + 1}",
                            style: TextStyle(
                                color: Colors.black54,
                                fontFamily: "Lexend",
                                fontSize: 15.sp),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 150.w,
                          child: Text(
                            "${eventlist?.iqcIeEventName}",
                            style: TextStyle(
                                color: Colors.black54,
                                fontFamily: "Lexend",
                                fontSize: 15.sp),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 150.w,
                          child: Text(
                            "${eventlist?.pcCardNo}",
                            style: TextStyle(
                                color: Colors.black54,
                                fontFamily: "Lexend",
                                fontSize: 15.sp),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 150.w,
                          child: Text(
                            "${eventlist?.itemName}",
                            style: TextStyle(
                                color: Colors.black54,
                                fontFamily: "Lexend",
                                fontSize: 15.sp),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 150.w,
                          child: Text(
                            "${eventlist?.iqcIieAssetId}",
                            style: TextStyle(
                                color: Colors.black54,
                                fontFamily: "Lexend",
                                fontSize: 15.sp),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 100.w,
                          child: Text(
                            "${eventlist?.iqcIiqStatus}",
                            style: TextStyle(
                                color: Colors.black54,
                                fontFamily: "Lexend",
                                fontSize: 15.sp),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 200.w,
                          child: Text(
                            "${eventlist?.iqcIiqDate ?? ""}",
                            style: TextStyle(
                                color: Colors.black54,
                                fontFamily: "Lexend",
                                fontSize: 15.sp),
                          ),
                        ),
                        Container(
                            alignment: Alignment.center,
                            width: 50.w,
                            child: IconButton(
                                onPressed: () {                    
getEvenqueedata(eventlist);
                                  inspectionparam.getInpectionParam(
                                      context: context,
                                      headerId: eventlist?.iqcIieCphId ?? 0,
                                      activityId: eventlist?.imfgpPaId ?? 0);
                                  inspectionsampleDi.getSampleList(
                                      context: context,
                                      headerid: eventlist?.iqcIieCphId ?? 0,
                                      activityid: eventlist?.imfgpPaId ?? 0);
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return Inspectionpagelayout();
                                    },
                                  )
                                  );
                                },
                                icon: Icon(Icons.arrow_forward_outlined)))
                      ],
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
