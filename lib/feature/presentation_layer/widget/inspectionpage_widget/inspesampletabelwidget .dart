import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:qc_control_app/constant/Exception/show_pop_error.dart';
import 'package:qc_control_app/constant/api_connection.dart';
import 'package:qc_control_app/constant/customwidgets/custombutton.dart';
import 'package:qc_control_app/constant/customwidgets/customtheme.dart';
import 'package:qc_control_app/constant/request_data_model.dart/sample_submit_model.dart';
import 'package:qc_control_app/feature/domain_layer/entity/inspectionsample_entity.dart';
import 'package:qc_control_app/feature/presentation_layer/api_service.dart/inspectionparameter_di.dart';
import 'package:qc_control_app/feature/presentation_layer/api_service.dart/inspectionsample_di.dart';
import 'package:qc_control_app/feature/presentation_layer/api_service.dart/interruption_status_di.dart';
import 'package:qc_control_app/feature/presentation_layer/api_service.dart/liststatus_di.dart';
import 'package:qc_control_app/feature/presentation_layer/api_service.dart/obs_parameter_di.dart';
import 'package:qc_control_app/feature/presentation_layer/layout/obsparameterlayout.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/eventqueelocaldata_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/eventsampleset_localdata_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/interruptionevent_status_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/login_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/obsparameter_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/responsive_screen/tablet_body.dart';
import 'package:qc_control_app/feature/presentation_layer/widget/observation_widget/obs_sample_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../local_stored_data_model/inpecsamplelocaldata_model.dart';
import '../../provider/inspecSampleLocalData_provider.dart';
import '../../provider/inspectionsample_provider.dart';

class InspecSampletabelwidget extends StatefulWidget {
  const   InspecSampletabelwidget({super.key});

  @override
  State<InspecSampletabelwidget> createState() =>
      _InspecSampletabelwidgetState();
}

class _InspecSampletabelwidgetState extends State<InspecSampletabelwidget> {
  InspectionparameterDi inspectionparam = InspectionparameterDi();
  ObsParameterDi obsParameterDi = ObsParameterDi();
  ListstatusDi liststatusDi = ListstatusDi();
 

  InspectionsampleDi inspectionsampleDi = InspectionsampleDi();
  InterruptionStatusDi interruptionStatusDi = InterruptionStatusDi();
  bool isLoading = true;
  List<TextEditingController> enterDescription = [];

  final _sampleformkey = GlobalKey<FormState>();
  // Map<String, int> optionList = {"Stop": 1, "Monitor": 2, "Continue": 3};
  String? selectedValue = ""; // Store the selected label
  int? selectedStatusId = 0;
  int? selectedeventtype = 0; // Store the corresponding ID

  void _obsSample() {
    showDialog(
        context: context,
        builder: (context) {
          return ObsSampleWidget();
        });
  }

  @override
  void initState() {
    fetchdata();
  }



  void fetchdata()async{

 await  Future.delayed(const Duration(seconds: 2));
  if (mounted) {
      setState(() {
        isLoading = false;
      });
  }

  }

  // void fetchDatafromDatabase() async {
  //   try {

  //     final samplestatus =
  //         Provider.of<InspecsampleLocalDataProvider>(context, listen: false)
  //                 .sampledata
  //                 ?.iqcIiqStatus ??

  //             0;

  //                 final samplesetvalues =
  //         Provider.of<EventsamplesetLocaldataProvider>(context, listen: false)
  //                 .sampledata;

  //                final eventqueedata =
  //       Provider.of<EventqueelocaldataProvider>(context, listen: false)
  //           .queedata;

            

  //             await inspectionsampleDi.getSampleList(
  //                                                       context: context,
  //                                                       headerid: eventqueedata
  //                                                               ?.iqcIieCphId ??
  //                                                           0,
  //                                                       activityid: eventqueedata
  //                                                               ?.imfgpPaId ??
  //                                                           0,
  //                                                       eventid: eventqueedata
  //                                                               ?.iqcIieIeId ??
  //                                                           0,
  //                                                       eventtriggerid:
  //                                                           eventqueedata
  //                                                                   ?.iqcIiqIieId ??
  //                                                               0,
  //                                                       imfgpid: eventqueedata
  //                                                               ?.imfgpId ??
  //                                                           0,
  //                                                       processid: eventqueedata
  //                                                               ?.imfgpMpmId ??
  //                                                           0,
  //                                                       queeid: eventqueedata
  //                                                               ?.iqcIiqId ??
  //                                                           0,
  //                                                       queestatus: eventqueedata
  //                                                               ?.iqcIiqStatus ??
  //                                                           0,
  //                                                       samplesize: eventqueedata
  //                                                               ?.iqcIiqMaxSampleSize ??
  //                                                           0, 
  //                                                           toolId: eventqueedata?.toolId ?? 0, 
  //                                                           productionqty:samplesetvalues?.productionqty ?? 0.0  ,
  //                                                           samplesetheaderid: samplesetvalues?.iqcIishId ?? 0,
  //                                                           samplesetindex:samplesetvalues?.samplesetindex ?? 0 ,
  //                                                           samplesetstatus: samplesetvalues?.status ?? 0,
                                                        
  //                                                           );
  //     setState(() {
  //       isLoading = false;
  //     });
  //   } catch (e) {
  //     setState(() {
  //       isLoading = false;
  //     });
  //     ShowError.showAlert(context, e.toString());
  //   }
  // }

  // @override
  // void dispose() {
  //   for (var controller in enterDescription) {
  //     controller.dispose();
  //   }
  //   super.dispose();
  // }

  void getSampledata(ListOfSampleEntity? sample) {
    final sampledata = InspectionSampleLocalModel(
      imfgpPaId: sample?.imfgpPaId,
      iqcIiqIieId: sample?.iqcIiqIieId,
      iqcIiqMaxSampleSize: sample?.iqcIiqMaxSampleSize,
      iqcIiqSampleUomId: sample?.iqcIiqSampleUomId,
      iqcIiqStatus: sample?.iqcIiqStatus,
      iqcIisSampleTag: sample?.iqcIisSampleTag,
      iqciisId: sample?.iqciisId,
    );

    Provider.of<InspecsampleLocalDataProvider>(context, listen: false)
        .setSampledata(sampledata);
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
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),

      child: Text(
        text,
        style: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.w500,
          color: Colors.black,
          fontFamily: "Lexend",
        ),
      ),
    );
  }

  Widget _divider() {
    return Divider(thickness: 1, color: Colors.grey.shade300, height: 16.h);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width < 600;
    // final optionList =
    //     Provider.of<InterruptioneventStatusProvider>(context, listen: false)
    //             .interruptionStatus
    //             ?.listOfInterruptionEvent ??
    //         [];
    final sample = Provider.of<InspectionsampleProvider>(context, listen: false)
            .sample
            ?.listOfSamplesEntity ??
        [];

    // final inspectionstatus =
    //     sample.any((e) => e.insStatus?.toLowerCase() == "failed") ? 2 : 1;

    final dataenter = sample.every((e) => e.datanoenter == 0);

    print(dataenter);

    final cavityflag =
        Provider.of<EventqueelocaldataProvider>(context, listen: false)
            .queedata
            ?.cavityflag;

               final previouseventid =
        Provider.of<EventqueelocaldataProvider>(context, listen: false)
            .queedata
            ?.iqcpreviousid;

    OutlineInputBorder borderstyle = const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 1.5),
    );

    OutlineInputBorder borderRadious = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
    );

    print(cavityflag);

    return size
        ? Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Samples List",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 16.w, right: 16.0),
                          child: CustomButton(
                            width: ThemeClass.mobbuttonwidth,
                            height: ThemeClass.mobbuttonheight,
                            backgroundColor: ThemeClass.buttonColor,
                            borderRadius: BorderRadius.circular(
                                ThemeClass.butborderradious),
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                fontFamily: "lexend",
                                fontSize: ThemeClass.buttonTextSize,
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        )
                      ],
                    )
                  ],
                ),
             const    SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Consumer<InspectionsampleProvider>(
                      builder: (context, inspectionSample, child) {
                    final sample = inspectionSample.sample?.listOfSamplesEntity;

                    return ListView.builder(
                      itemCount: sample?.length,
                      itemBuilder: (context, index) {
                        final sampleList = sample?[index];

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
                                sampleList?.iqcIisSampleTag ?? "No Event Name",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontFamily: "Lexend",
                                ),
                              ),
                              subtitle: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _infoBadge(sampleList?.insStatus ?? "N/A"),
                                  // _infoBadge(sampleList.statusName ?? "Pending"),
                                ],
                              ),
                              trailing: Icon(Icons.keyboard_arrow_down,
                                  color: Colors.grey.shade600),
                              children: [
                                Container(
                                  padding: EdgeInsets.all(14.w),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.vertical(
                                        bottom: Radius.circular(16.r)),
                                  ),
                                  child: Column(
                                    children: [
                                      _infoRow(
                                          Icons.assignment,
                                          "No Pass",
                                          sampleList?.noofpass.toString() ??
                                              "N/A"),
                                      _divider(),
                                      _infoRow(
                                          Icons.build,
                                          "No Fail",
                                          sampleList?.noofpass.toString() ??
                                              "N/A"),
                                      _divider(),
                                      Row(
                                        children: [
                                          Icon(Icons.open_in_new,
                                              size: 20.sp,
                                              color: Colors.blueGrey.shade700),
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
                                          IconButton(
                                              onPressed: () {
                                                getSampledata(sampleList);

                                                obsParameterDi.getParameterList(
                                                    context: context,
                                                    inspectionid:
                                                        sampleList?.iqciisId ??
                                                            0,
                                                          previousid: previouseventid ?? 0  
                                                            );

                                                liststatusDi.getStatus(
                                                    context: context);

                                                Navigator.push(context,
                                                    MaterialPageRoute(
                                                  builder: (context) {
                                                    return const Obsparameterlayout();
                                                  },
                                                ));
                                              },
                                              icon: const Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child:  Icon(
                                                    Icons.arrow_forward_rounded,
                                                    size: 30,
                                                    color: Color(0xFF5060CB),
                                                  )))
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
                  }),
                ),
              ],
            ),
          )
        : isLoading
            ? const Center(child: CircularProgressIndicator())
            : Form(
                key: _sampleformkey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.only(left: 15.w, right: 40.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Samples List",
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              // Row(
                              //   children: [
                              //     Padding(
                              //       padding: EdgeInsets.only(
                              //           left: 16.w, right: 16.0),
                              //       child: CustomButton(
                              //           width: ThemeClass.buttonwidth,
                              //           height: ThemeClass.buttonheight,
                              //           backgroundColor:
                              //               ThemeClass.buttonColor,
                              //           borderRadius: BorderRadius.circular(
                              //               ThemeClass.butborderradious),
                              //           child: Text(
                              //             "Submit",
                              //             style: TextStyle(
                              //               fontFamily: "lexend",
                              //               fontSize:
                              //                   ThemeClass.buttonTextSize,
                              //               color: Colors.white,
                              //             ),
                              //           ),
                              //           onPressed:
                              //               // dataenter?
                              //               () async {
                              //             // if(_sampleformkey.currentState!.validate()){
                
                              //             await _submitPop(context);
                
                              //             // }
                              //           }
                              //           // : null
                              //           ),
                              //     ),
                              //   ],
                              // ),
                            ],
                          ),
                        ),
                      ),
                    const  SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 80.h,
                        decoration: BoxDecoration(
                            color:const  Color.fromARGB(255, 45, 54, 104),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5.r),
                                topRight: Radius.circular(5.r))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2, // Same flex as data row
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Sample No",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Lexend",
                                      fontSize: 18.sp,
                                    ),
                                  ),
                                ),
                              ),
                              // Expanded(
                              //       flex: 2, // Same flex as data row
                              //       child: Align(
                              //                     alignment: Alignment.centerLeft,
                              //         child: Text(
                              //                   "Batch No",
                              //                   style: TextStyle(
                              //                     color: Colors.white,
                              //                     fontFamily: "Lexend",
                              //                     fontSize: 18.sp,
                              //                   ),
                              //         ),
                              //       ),
                              //     ) ,
                
                              // if (cavityflag == 0)
                              //   Expanded(
                              //     flex: 3, // Same flex as data row
                              //     child: Align(
                              //       alignment: Alignment.centerLeft,
                              //       child: Text(
                              //         "Cavity Value",
                              //         style: TextStyle(
                              //           color: Colors.white,
                              //           fontFamily: "Lexend",
                              //           fontSize: 18.sp,
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              //       Expanded(
                              //         flex: 2, // Same flex as data row
                              //         child: Center(
                              //           child: Text(
                              // "Samples",
                              // style: TextStyle(
                              //   color: Colors.white,
                              //   fontFamily: "Lexend",
                              //   fontSize: 18.sp,
                              // ),
                              //           ),
                              //         ),
                              //       ),
                              Expanded(
                                flex: 3, // Same flex as data row
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Parameters Passed ",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Lexend",
                                      fontSize: 18.sp,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3, // Same flex as data row
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Parameters Failed ",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Lexend",
                                      fontSize: 18.sp,
                                    ),
                                  ),
                                ),
                              ),
                           
                                   Expanded(
                                flex: 3, // Same flex as data row
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Observation Status",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Lexend",
                                      fontSize: 18.sp,
                                    ),
                                  ),
                                ),
                              ),
                
                   Expanded(
                                flex: 2, // Same flex as data row
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Overall Status",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Lexend",
                                      fontSize: 18.sp,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2, // Same flex as data row
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Observation",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Lexend",
                                      fontSize: 18.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Consumer<InspectionsampleProvider>(
                            builder: (context, inspectionSample, child) {
                          final sample =
                              inspectionSample.sample?.listOfSamplesEntity;
                
                          return ListView.builder(
                            itemCount: sample?.length,
                            itemBuilder: (context, index) {
                              final sampleList = sample?[index];
                              enterDescription = List.generate(
                                sample!.length,
                                (index) => TextEditingController(),
                              );
                              return Container(
                                decoration: BoxDecoration(
                                  color: index % 2 == 0
                                      ? Colors.grey.shade50
                                      : Colors.grey.shade200,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(5.r),
                                    bottomRight: Radius.circular(5.r),
                                  ),
                                ),
                                height: 80.h,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Align(
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
                                      // Expanded(
                                      //                     flex: 2,
                                      //                     child: Align(
                                      //                       alignment: Alignment.centerLeft,
                                      //                       child: Text(
                                      //                         "${sampleList?.batchNo}",
                                      //                         style: TextStyle(
                                      //                             color: Colors.black54,
                                      //                             fontFamily: "Lexend",
                                      //                             fontSize: 15.sp),
                                      //                       ),
                                      //                     ),
                                      //                   ),
                
                                      // if (cavityflag == 0)
                                      //   Expanded(
                                      //     flex: 3, // Matching header
                                      //     child: Align(
                                      //       alignment: Alignment.centerLeft,
                                      //       child: SizedBox(
                                      //           width: 180,
                                      //           child: TextFormField(
                                      //             controller:
                                      //                 enterDescription[index],
                                      //             decoration: InputDecoration(
                                      //                 hintText:
                                      //                     "Enter Cavity Value",
                                      //                 filled: true,
                                      //                 fillColor: Colors.white,
                                      //                 border: borderRadious,
                                      //                 focusedBorder:
                                      //                     borderstyle,
                                      //                 enabledBorder:
                                      //                     borderstyle),
                                      //             validator: (value) {
                                      //               if (value == null ||
                                      //                   value.isEmpty) {
                                      //                 return 'Enter the Notes';
                                      //               }
                                      //               if (value
                                      //                   .startsWith(' ')) {
                                      //                 return 'Notes cannot start with a space';
                                      //               }
                                      //               return null;
                                      //             },
                                      //             style: TextStyle(
                                      //                 fontSize: 16.sp,
                                      //                 color: Colors.black),
                                      //           )),
                                      //     ),
                                      //   ),
                
                                      // Expanded(
                                      //         flex: 2,
                                      //         child: Align(
                                      //           alignment: Alignment.center,
                                      //           child: Text(
                                      //             "${sampleList?.iqcIisSampleTag}",
                                      //             style: TextStyle(
                                      //                 color: Colors.black54,
                                      //                 fontFamily: "Lexend",
                                      //                 fontSize: 15.sp),
                                      //           ),
                                      //         ),
                                      //       ),
                                      Expanded(
                                        flex: 3,
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "${sampleList?.noofpass}",
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontFamily: "Lexend",
                                                fontSize: 15.sp),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "${sampleList?.nooffail}",
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontFamily: "Lexend",
                                                fontSize: 15.sp),
                                          ),
                                        ),
                                      ),
                                        Expanded(
                                        flex: 3,
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            sampleList?.nooffail == 0 &&
                                                    sampleList?.noofpass == 0
                                                ? ""
                                                : "${sampleList?.insStatus}",
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontFamily: "Lexend",
                                                fontSize: 15.sp),
                                          ),
                                        ),
                                      ),

                                          Expanded(
                                        flex: 2,
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            sampleList?.samplestatus == 1  
                                                ? "Open" : sampleList?.samplestatus == 2 ?
                                            "In Progress"    : "Completed",
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontFamily: "Lexend",
                                                fontSize: 15.sp),
                                          ),
                                        ),
                                      ),
                                    
                
                                      Expanded(
                                        flex: 2,
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: CustomButton(
                                            width: ThemeClass.buttonwidth,
                                            height: ThemeClass.buttonheight,
                                            backgroundColor:
                                                ThemeClass.buttonColor,
                                            borderRadius:
                                                BorderRadius.circular(
                                                    ThemeClass
                                                        .butborderradious),
                                            onPressed: () async {
                                              // Fetch sample list
                                              // await obsSampleDi.getSampleList(
                                              //     inspectionid: parameter?.iqcIiId ?? 0, context: context);
                
                                              // Fetch sample data
                                              getSampledata(sampleList);
                
                                              await obsParameterDi
                                                  .getParameterList(
                                                      context: context,
                                                      inspectionid: sampleList
                                                              ?.iqciisId ??
                                                          0,
                                                          previousid: previouseventid ?? 0
                                                          
                                                          );
                
                                              await liststatusDi.getStatus(
                                                  context: context);
                

                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
const Obsparameterlayout(),
                                                  ));
                                            },
                                            child: Text("Record",
                                                style: TextStyle(
                                                    fontFamily: "lexend",
                                                    fontSize: ThemeClass
                                                        .buttonTextSize,
                                                    color: Colors.white)),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              );
  }
}
