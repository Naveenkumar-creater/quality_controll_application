import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:qc_control_app/constatnt/Exception/show_pop_error.dart';
import 'package:qc_control_app/constatnt/api_connection.dart';
import 'package:qc_control_app/constatnt/customwidgets/custombutton.dart';
import 'package:qc_control_app/constatnt/customwidgets/customtheme.dart';
import 'package:qc_control_app/constatnt/request_data_model.dart/sample_submit_model.dart';
import 'package:qc_control_app/feature/domain_layer/entity/inspectionsample_entity.dart';
import 'package:qc_control_app/feature/presentation_layer/api_service.dart/inspectionparameter_di.dart';
import 'package:qc_control_app/feature/presentation_layer/api_service.dart/inspectionsample_di.dart';
import 'package:qc_control_app/feature/presentation_layer/api_service.dart/interruption_status_di.dart';
import 'package:qc_control_app/feature/presentation_layer/api_service.dart/liststatus_di.dart';
import 'package:qc_control_app/feature/presentation_layer/api_service.dart/obs_parameter_di.dart';
import 'package:qc_control_app/feature/presentation_layer/layout/obsparameterlayout.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/eventqueelocaldata_provider.dart';
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
  const InspecSampletabelwidget({super.key});

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
    super.initState();
    fetchDatafromDatabase();
  }

  void fetchDatafromDatabase() async {
    try {

      final eventlist =
          Provider.of<EventqueelocaldataProvider>(context, listen: false)
              .queedata;
              final samplestatus =  Provider.of<InspecsampleLocalDataProvider>(context, listen: false)
              .sampledata?.iqcIiqStatus ?? 0;

           int?  status=  samplestatus == 0 ?  eventlist?.iqcIiqStatus : samplestatus;
            final sample = Provider.of<InspectionsampleProvider>(context, listen: false)
            .sample
            ?.listOfSamplesEntity ??
        [];

      await inspectionparam.getInpectionParam(
          context: context,
          headerId: eventlist?.iqcIieCphId ?? 0,
          activityId: eventlist?.imfgpPaId ?? 0);

      await inspectionsampleDi.getSampleList(
          context: context,
          headerid: eventlist?.iqcIieCphId ?? 0,
          activityid: eventlist?.imfgpPaId ?? 0,
          eventid: eventlist?.iqcIieIeId ?? 0,
          eventtriggerid: eventlist?.iqcIiqIieId ?? 0,
          imfgpid: eventlist?.imfgpId ?? 0,
          processid: eventlist?.imfgpMpmId ?? 0,
          queeid: eventlist?.iqcIiqId ?? 0,
          queestatus: status ?? 0,
          samplesize: eventlist?.iqcIiqMaxSampleSize ?? 0);

  await interruptionStatusDi.getInterruptionEventStatus(
  activityId:   eventlist?.imfgpPaId ?? 0 ,context:context ,imfgpid: eventlist?.imfgpId ?? 0 );
  enterDescription = List.generate(sample.length, (index) {
      final value =  "";
      return TextEditingController(text: value.toString()); 
    });


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

   _submitPop(BuildContext context) {
    final optionList =
        Provider.of<InterruptioneventStatusProvider>(context, listen: false)
                .interruptionStatus
                ?.listOfInterruptionEvent ??
            [];
    final sample = Provider.of<InspectionsampleProvider>(context, listen: false)
            .sample
            ?.listOfSamplesEntity ??
        [];

    final inspectionstatus =
        sample.any((e) => e.insStatus?.toLowerCase() == "failed") ? 2 : 1;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          content: StatefulBuilder(
            builder: (context, setState) {
              return WillPopScope(
                onWillPop: () async => false,
                child: Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Confirm Your Submission",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 20),
                  //  if(inspectionstatus == 2)   
                     SizedBox(
                              width: double.infinity,
                              child: DropdownButtonFormField<String>(
                                value: optionList.any(
                                        (e) => e.eventName == selectedValue)
                                    ? selectedValue
                                    : null, // Ensure value exists in list
                                hint: const Text("Select"),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(8),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                icon: const Icon(Icons.keyboard_arrow_down,
                                    color: Colors.black54),
                                onChanged: (String? newValue) {
                                  if (newValue != null) {
                                    final selectedStatus =
                                        optionList.firstWhere((status) =>
                                            status.eventName == newValue);

                                    setState(() {
                                      selectedValue = newValue;
                                      selectedStatusId =
                                          selectedStatus.iqcCppeIeId ?? 0;
                                      selectedeventtype =
                                          selectedStatus.iqcIeEventType;
                                    });
                                  }
                                },
                                items: optionList
                                    .map((entry) => entry
                                        .eventName) // Ensure unique values
                                    .toSet() // Remove duplicates
                                    .map((eventName) {
                                  return DropdownMenuItem<String>(
                                    value: eventName,
                                    child: Text(
                                      eventName ?? "",
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.black87),
                                    ),
                                  );  
                                }).toList(),
                              ),
                            ),
                 
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomButton(
                            width: ThemeClass.buttonwidth,
                            height: ThemeClass.buttonheight,
                            backgroundColor: ThemeClass.cancelbuttonColor,
                            borderRadius: BorderRadius.circular(
                                ThemeClass.butborderradious),
                            onPressed: () => Navigator.pop(context),
                            child: const Text("Cancel",
                                style: TextStyle(color: Colors.white)),
                          ),
                          CustomButton(
                            width: ThemeClass.buttonwidth,
                            height: ThemeClass.buttonheight,
                            backgroundColor: ThemeClass.buttonColor,
                            borderRadius: BorderRadius.circular(
                                ThemeClass.butborderradious),
                            onPressed:
                            
                            //  ((selectedStatusId != 0 &&
                            //             inspectionstatus == 2) ||
                            //         (selectedStatusId == 0 &&
                            //             inspectionstatus == 1))
                            //     ? 
                                
                                () async {
                                    try {
                                      await sendServerParamdata(
                                          context, "list_of_sample_submit", 4);
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(builder: (context) {
                                        return ResponsiveTabletHomepage();
                                      }));
                                    } catch (e) {
                                      ShowError.showAlert(
                                          context, e.toString());
                                    }
                                  },
                                // : null,
                            child: const Text("Submit",
                                style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Future<void> sendServerParamdata(
    BuildContext context, String apifor, int status) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString("client_token") ?? "";

    final observationSample =
        Provider.of<ObsparameterProvider>(context, listen: false)
                .obsparam
                ?.observationBySamples ??
            [];

    final sample = Provider.of<InspectionsampleProvider>(context, listen: false)
            .sample
            ?.listOfSamplesEntity ??
        [];

    final inspectionstatus = sample.any((e) => e.insStatus?.toLowerCase() == "failed") ? 2 : 1;

    final eventqueelocaldata =
        Provider.of<EventqueelocaldataProvider>(context, listen: false)
            .queedata;

    final eventtriggerid =
        Provider.of<EventqueelocaldataProvider>(context, listen: false)
            .queedata
            ?.iqcIiqIieId;

    final queid =
        Provider.of<EventqueelocaldataProvider>(context, listen: false)
            .queedata
            ?.iqcIiqId;

    final eventid =
        Provider.of<EventqueelocaldataProvider>(context, listen: false)
            .queedata
            ?.iqcIieIeId;

    final pcid = Provider.of<EventqueelocaldataProvider>(context, listen: false)
        .queedata
        ?.pcid;
    final assetId =
        Provider.of<EventqueelocaldataProvider>(context, listen: false)
            .queedata
            ?.iqcIieAssetId;

    final headerId = eventqueelocaldata?.iqcIieCphId;

    final imfgpid = eventqueelocaldata?.imfgpId;

    int? orgid = Provider.of<LoginProvider>(context, listen: false)
            .user
            ?.userLoginEntity
            ?.orgId ??
        0;

    final requestdata = SampleSubmitModel(
        apiFor: apifor,
        clientAutToken: token,
        eventStatus: status,
        eventQueId: queid,
        eventTriggerId: eventtriggerid,
        eventtype: selectedeventtype,
        nexteventId: selectedStatusId,
        assetId: assetId,
        headerId: headerId,
        pccardid: pcid,
        orgid: orgid,
        inspectionStatus: inspectionstatus,
        eventid: eventid,
        imfgpid: imfgpid,
        
        listOfsampledata: []
        );

        for (int i = 0; i < sample.length; i++) {
      final sampleList  = sample[i];
      final sampleData = ListSampledata(
        cavityValue: enterDescription[i].text ?? "" ,
        sampleId: sampleList.iqciisId ,
         
          );
          
      requestdata.listOfsampledata?.add(sampleData);
    }


    print(requestdata);
    try {
      final response =
          await ApiConstant.makeApiRequest(requestBody: requestdata);
      print(response);
      return response;
    } catch (e) {
      ShowError.showAlert(context, e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width < 600;
       final optionList =
        Provider.of<InterruptioneventStatusProvider>(context, listen: false)
                .interruptionStatus
                ?.listOfInterruptionEvent ??
            [];
    final sample = Provider.of<InspectionsampleProvider>(context, listen: false)
            .sample
            ?.listOfSamplesEntity ??
        [];

    final inspectionstatus =
                       sample.any((e) => e.insStatus?.toLowerCase() == "failed") ? 2 : 1;

final dataenter=sample.every((e)=>e.datanoenter==0);

print(dataenter);

           final cavityflag =
        Provider.of<EventqueelocaldataProvider>(context, listen: false)
            .queedata
            ?.cavityflag;

            
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
                      "Samples",
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
                            onPressed: () {
                              
                            },
                          ),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
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
                                backgroundColor: Color(0xFF5060CB),
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
                                                            0);

                                                liststatusDi.getStatus(
                                                    context: context);

                                                Navigator.push(context,
                                                    MaterialPageRoute(
                                                  builder: (context) {
                                                    return Obsparameterlayout();
                                                  },
                                                ));
                                              },
                                              icon: Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: const Icon(
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
        :
        
        isLoading ? Center(child: CircularProgressIndicator()) :
        
         Form(
                key:  _sampleformkey,
                child: Container(
                            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding:  EdgeInsets.only(left: 15.w,right: 40.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Samples",
                              style: TextStyle(
                               fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                              ),
                            ),
                            Row(
                              children: [

                                
                                Padding(
                                  padding: EdgeInsets.only(left: 16.w, right: 16.0),
                                  child: CustomButton(
                                    width: ThemeClass.buttonwidth,
                                    height: ThemeClass.buttonheight,
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
                                    onPressed:
                // dataenter?
                                        () async{

                                          

                                          // if(_sampleformkey.currentState!.validate()){
                                          
                                             await  _submitPop(context);

                                          // }
                                     
                                    } 
                                    // : null
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 80.h,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 45, 54, 104),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5.r),
                              topRight: Radius.circular(5.r))),
                      child:  Padding(
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
                    Expanded(
                          flex: 2, // Same flex as data row
                          child: Align(
                                        alignment: Alignment.centerLeft,
                            child: Text(
                                      "Batch No",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Lexend",
                                        fontSize: 18.sp,
                                      ),
                            ),
                          ),
                        ) ,
                
                             
                 if(cavityflag == 0)
                               Expanded(
                          flex: 3, // Same flex as data row
                          child: Align(
                                        alignment: Alignment.centerLeft,
                            child: Text(
                                      "Cavity Value",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Lexend",
                                        fontSize: 18.sp,
                                      ),
                            ),
                          ),
                        ),
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
                          flex: 2, // Same flex as data row
                          child: Align(
                                        alignment: Alignment.centerLeft,
                            child: Text(
                                      "Status",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Lexend",
                                        fontSize: 18.sp,
                                      ),
                            ),
                          ),
                        ),
                        
                        Expanded(
                          flex: 2 , // Same flex as data row
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
                        final sample = inspectionSample.sample?.listOfSamplesEntity;
                
                        return ListView.builder(
                          itemCount: sample?.length,
                          itemBuilder: (context, index) {
                            final sampleList = sample?[index];
                            return Container(
                                decoration:BoxDecoration(
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
                         padding: const EdgeInsets.symmetric(horizontal: 16),
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
                  Expanded(
                                      flex: 2,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "${sampleList?.batchNo}",
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontFamily: "Lexend",
                                              fontSize: 15.sp),
                                        ),
                                      ),
                                    ),
                
                if(cavityflag == 0)   
                
                 Expanded(
                      flex: 3, // Matching header
                      child:  Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                              width: 180,
                          child: index < enterDescription.length
                              ? TextFormField(
                                  controller: enterDescription[index],
                                  decoration: InputDecoration(
                                    hintText: "Enter Cavity Value",
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: borderRadious,
                                    focusedBorder: borderstyle,
                                    enabledBorder: borderstyle
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Enter the Notes';
                                    }
                                    if (value.startsWith(' ')) {
                                      return 'Notes cannot start with a space';
                                    }
                                    return null;
                                  },
                                  style: TextStyle(fontSize: 16.sp, color: Colors.black),
                                )
                              : SizedBox(),
                        ),
                      ),
                    ),
                
                
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
                                      flex: 2,
                                      child:Align(
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
                                        child: CustomButton(
                                          width: ThemeClass.buttonwidth,
                                          height: ThemeClass.buttonheight,
                                          backgroundColor: ThemeClass.buttonColor,
                                          borderRadius: BorderRadius.circular(
                                              ThemeClass.butborderradious),
                                          onPressed: () async {
                                            // Fetch sample list
                                            // await obsSampleDi.getSampleList(
                                            //     inspectionid: parameter?.iqcIiId ?? 0, context: context);
                                        
                                            // Fetch sample data
                                            getSampledata(sampleList);
                                        
                                            await obsParameterDi.getParameterList(
                                                context: context,
                                                inspectionid:
                                                    sampleList?.iqciisId ?? 0);
                                        
                                            await liststatusDi.getStatus(
                                                context: context);
                                        
                                            // Navigate only after all data is loaded
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      Obsparameterlayout(),
                                                ));
                                          },
                                          child: Text("Record",
                                              style: TextStyle(
                                                  fontFamily: "lexend",
                                                  fontSize: ThemeClass.buttonTextSize,
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
                          ),
              );
  }
}



