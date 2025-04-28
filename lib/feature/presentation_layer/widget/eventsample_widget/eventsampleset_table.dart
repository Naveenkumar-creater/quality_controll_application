import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:qc_control_app/constant/Exception/show_pop_error.dart';
import 'package:qc_control_app/constant/api_connection.dart';
import 'package:qc_control_app/constant/customwidgets/custombutton.dart';
import 'package:qc_control_app/constant/customwidgets/customtheme.dart';
import 'package:qc_control_app/constant/request_data_model.dart/sample_submit_model.dart';
import 'package:qc_control_app/feature/domain_layer/entity/eventsampleset_entity.dart';
import 'package:qc_control_app/feature/presentation_layer/api_service.dart/inspectionsample_di.dart';
import 'package:qc_control_app/feature/presentation_layer/api_service.dart/interruption_status_di.dart';
import 'package:qc_control_app/feature/presentation_layer/api_service.dart/liststatus_di.dart';
import 'package:qc_control_app/feature/presentation_layer/layout/inspectionpagelayout.dart';
import 'package:qc_control_app/feature/presentation_layer/layout/obsparameterlayout.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/eventqueelocaldata_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/eventsampleset_localdata_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/eventsampleset_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/interruptionevent_status_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/login_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/obsparameter_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/responsive_screen/tablet_body.dart';
import 'package:qc_control_app/feature/presentation_layer/widget/observation_widget/obs_sample_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../local_stored_data_model/eventsamplesetdata_model.dart';
import '../../provider/inspectionsample_provider.dart';

class EventsamplesetTable extends StatefulWidget {
  const EventsamplesetTable({super.key});

  @override
  State<EventsamplesetTable> createState() => _EventsamplesetTableState();
}

class _EventsamplesetTableState extends State<EventsamplesetTable> {
  ListstatusDi liststatusDi = ListstatusDi();
InterruptionStatusDi interruptionStatusDi=InterruptionStatusDi();
  InspectionsampleDi inspectionsampleDi = InspectionsampleDi();
  

  bool isLoading = true;
  TextEditingController ProductionEntryController = TextEditingController();

  final _sampleformkey = GlobalKey<FormState>();
  // Map<String, int> optionList = {"Stop": 1, "Monitor": 2, "Continue": 3};
  String? selectedValue = ""; // Store the selected label
  int? selectedStatusId = 0;
  int? selectedeventtype = 0; // Store the corresponding ID
 int ?productionqtyvalue;
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

  bool get isProductionQtyValid {
    return productionqtyvalue != null && productionqtyvalue! > 0;
  }


  void fetchDatafromDatabase() async {
    try {
        //       final eventqueedata =
        // Provider.of<EventqueelocaldataProvider>(context, listen: false)
        //     .queedata;

        //        await interruptionStatusDi.getInterruptionEventStatus(
        //   activityId: eventqueedata?.imfgpPaId ?? 0,
        //   context: context,
        //   imfgpid: eventqueedata?.imfgpId ?? 0);

      final samplesetproductionqty =
          Provider.of<EventSampleSetProvider>(context, listen: false)
                  .sample
                  ?.listOfSamplesSet.first.iqciiqproductionqty;


              ProductionEntryController.text= samplesetproductionqty.toString();

              // ProductionEntryController.text= "0";

              productionqtyvalue = int.tryParse (ProductionEntryController.text);
           

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


    void fetchinspectionsamplelistfromDatabase() async {
    try {

                  final samplesetvalues =
          Provider.of<EventsamplesetLocaldataProvider>(context, listen: false)
                  .sampledata;

                 final eventqueedata =
        Provider.of<EventqueelocaldataProvider>(context, listen: false)
            .queedata;

            

              await inspectionsampleDi.getSampleList(
                                                        context: context,
                                                        headerid: eventqueedata
                                                                ?.iqcIieCphId ??
                                                            0,
                                                        activityid: eventqueedata
                                                                ?.imfgpPaId ??
                                                            0,
                                                        eventid: eventqueedata
                                                                ?.iqcIieIeId ??
                                                            0,
                                                        eventtriggerid:
                                                            eventqueedata
                                                                    ?.iqcIiqIieId ??
                                                                0,
                                                        imfgpid: eventqueedata
                                                                ?.imfgpId ??
                                                            0,
                                                        processid: eventqueedata
                                                                ?.imfgpMpmId ??
                                                            0,
                                                        queeid: eventqueedata
                                                                ?.iqcIiqId ??
                                                            0,
                                                        queestatus: eventqueedata
                                                                ?.iqcIiqStatus ??
                                                            0,
                                                        samplesize: eventqueedata
                                                                ?.iqcIiqMaxSampleSize ??
                                                            0, 
                                                            toolId: eventqueedata?.toolId ?? 0, 
                                                            productionqty:samplesetvalues?.productionqty ?? 0.0  ,
                                                            samplesetheaderid: samplesetvalues?.iqcIishId ?? 0,
                                                            samplesetindex:samplesetvalues?.samplesetindex ?? 0 ,
                                                            samplesetstatus: samplesetvalues?.status ?? 0,
                                                        
                                                            );
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
  void dispose() {
    ProductionEntryController.dispose();
    super.dispose();
  }

  void getSampledata(ListOfSamplesSetEntity? sample,double ? productionqty, int ? index) {
    final samplesetdata = EventsamplesetdatalocalModel(
        iqcIishId: sample?.iqcIishId,
        iqcIishIiqId: sample?.iqcIishId,
        iqcIishSampleBatchNo: sample?.iqcIishSampleBatchNo,
        orgId: sample?.orgId,
        status: sample?.status,
        userId: sample?.userId,
        productionqty: productionqty,
        samplesetindex: index
        
        );

    Provider.of<EventsamplesetLocaldataProvider>(context, listen: false)
        .setSamplesetdata(samplesetdata);
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
                      if(inspectionstatus == 2)
                      SizedBox(
                        width: double.infinity,
                        child: DropdownButtonFormField<String>(
                          value: optionList
                                  .any((e) => e.eventName == selectedValue)
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
                              final selectedStatus = optionList.firstWhere(
                                  (status) => status.eventName == newValue);

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
                              .map((entry) =>
                                  entry.eventName) // Ensure unique values
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
                                  return const ResponsiveTabletHomepage();
                                }));
                              } catch (e) {
                                ShowError.showAlert(context, e.toString());
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

    final inspectionstatus =
        sample.any((e) => e.insStatus?.toLowerCase() == "failed") ? 2 : 1;

    final eventqueelocaldata = Provider.of<EventqueelocaldataProvider>(context, listen: false)
            .queedata;

    final eventtriggerid =eventqueelocaldata
            ?.iqcIiqIieId;

    final queid =
       eventqueelocaldata
            ?.iqcIiqId;

    final eventid = eventqueelocaldata?.iqcIieIeId;

    final pcid =eventqueelocaldata?.pcid;
    final assetId =
       eventqueelocaldata?.iqcIieAssetId;

    final headerId = eventqueelocaldata?.iqcIieCphId;

    final imfgpid = eventqueelocaldata?.imfgpId;
    final activityId=eventqueelocaldata?.imfgpPaId;

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
        activityid:activityId ,
        listOfsampledata: []);

    for (int i = 0; i < sample.length; i++) {
      final sampleList = sample[i];
      final sampleData = ListSampledata(
        cavityValue: ProductionEntryController.text,
        sampleId: sampleList.iqciisId,
      );

      requestdata.listOfsampledata?.add(sampleData);
    }

    // print(requestdata);
    try {
      final response =
          await ApiConstant.makeApiRequest(requestBody: requestdata);
      // print(response);
      return response;
    } catch (e) {
      ShowError.showAlert(context, e.toString());
    }
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
         final sampleset = Provider.of<EventSampleSetProvider>(context, listen: false).sample?.listOfSamplesSet ??
        [];

    // final inspectionstatus =
    //     sample.any((e) => e.insStatus?.toLowerCase() == "failed") ? 2 : 1;

    final dataenter = sample.every((e) => e.datanoenter == 0);

    final samplesetcount= sampleset.every((e)=>e.samplesetstatuscount==0);


print("samplecount:  " + "${samplesetcount}");

    final cavityflag =
        Provider.of<EventqueelocaldataProvider>(context, listen: false)
            .queedata
            ?.cavityflag;

    final eventqueedata =
        Provider.of<EventqueelocaldataProvider>(context, listen: false)
            .queedata;

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
                      "Sample Sets",
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
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Consumer<EventSampleSetProvider>(
                      builder: (context, inspectionSample, child) {
                    final sample = inspectionSample.sample?.listOfSamplesSet;

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
                                backgroundColor: const Color(0xFF5060CB),
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
                                sampleList?.iqcIishSampleBatchNo ??
                                    "No Event Name",
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
                                  // _infoBadge(sampleList?.status ?? "N/A"),
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
                                          sampleList?.iqcIishSampleBatchNo ??
                                              "N/A"),
                                      _divider(),
                                      _infoRow(
                                          Icons.build,
                                          "No Fail",
                                          sampleList?.iqcIishSampleBatchNo ??
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
                                                 double productionvalue=double.parse(ProductionEntryController.text ) ;
                                                    getSampledata(sampleList,productionvalue, index+1);

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
                                                  child: Icon(
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
                     Container(
  decoration: BoxDecoration(

    borderRadius: BorderRadius.circular(12),
    boxShadow: [
      BoxShadow(
     color:ThemeClass.backgroundcolor ,
        blurRadius: 8,
        offset: Offset(0, 4),
      ),
    ],
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Sample Set List",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),

            CustomButton(
           width: ThemeClass.buttonwidth,
                                            height: ThemeClass.buttonheight,
                                            backgroundColor:
                                                ThemeClass.buttonColor,
                                            borderRadius: BorderRadius.circular(
                                                ThemeClass.butborderradious),
          
            onPressed: samplesetcount ? () async {
              await _submitPop(context);
            } : null,
            child: Text(
              "Submit",
              style: TextStyle(
                fontFamily: "Lexend",
                fontSize: ThemeClass.buttonTextSize,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      SizedBox(height: 10),
      Text(
        "Enter Production Quantity",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
      ),
      SizedBox(height: 10),
      TextFormField(
        controller: ProductionEntryController,
        keyboardType: TextInputType.number,
        enabled: (productionqtyvalue == 0 || productionqtyvalue == null),
        onEditingComplete: () {
          setState(() {
            productionqtyvalue = int.tryParse(ProductionEntryController.text);
          });
        },
        decoration: InputDecoration(
          hintText: "Enter production quantity",
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
        style: TextStyle(fontSize: 16, color: Colors.black),
      ),

    ],
  ),
),

                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 80.h,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 45, 54, 104),
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
                                    "Sampleset No",
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
                                    "Batch No",
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
                                    "Size",
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
                        child: Consumer<EventSampleSetProvider>(
                            builder: (context, inspectionSample, child) {
                          final sample =
                              inspectionSample.sample?.listOfSamplesSet;

                          return ListView.builder(
                            itemCount: sample?.length,
                            itemBuilder: (context, index) {
                              final sampleList = sample?[index];

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
                                      Expanded(
                                        flex: 3,
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "${sampleList?.iqcIishSampleBatchNo}",
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
                                            "${sampleList?.samplesize}",
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
                                            sampleList?.status == 1
                                                ? "Open" :   sampleList?.status == 2 ? "Inprogress"
                                                : "Completed",
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
                                            borderRadius: BorderRadius.circular(
                                                ThemeClass.butborderradious),
                                            onPressed: isProductionQtyValid
                                                ? () async {

                                                double productionvalue=double.parse(ProductionEntryController.text ) ;
                                                    getSampledata(sampleList,productionvalue,index+1);

                                                    // await inspectionsampleDi.getSampleList(
                                                    //     context: context,
                                                    //     headerid: eventqueedata
                                                    //             ?.iqcIieCphId ??
                                                    //         0,
                                                    //     activityid: eventqueedata
                                                    //             ?.imfgpPaId ??
                                                    //         0,
                                                    //     eventid: eventqueedata
                                                    //             ?.iqcIieIeId ??
                                                    //         0,
                                                    //     eventtriggerid:
                                                    //         eventqueedata
                                                    //                 ?.iqcIiqIieId ??
                                                    //             0,
                                                    //     imfgpid: eventqueedata
                                                    //             ?.imfgpId ??
                                                    //         0,
                                                    //     processid: eventqueedata
                                                    //             ?.imfgpMpmId ??
                                                    //         0,
                                                    //     queeid: eventqueedata
                                                    //             ?.iqcIiqId ??
                                                    //         0,
                                                    //     queestatus: eventqueedata
                                                    //             ?.iqcIiqStatus ??
                                                    //         0,
                                                    //     samplesize: eventqueedata
                                                    //             ?.iqcIiqMaxSampleSize ??
                                                    //         0,  
                                                    //         productionqty: productionvalue ,
                                                    //         samplesetheaderid: sampleList?.iqcIishId ?? 0,
                                                    //         samplesetindex: index+1 ,
                                                    //         samplesetstatus: sampleList?.status ?? 0
                                                    //         );

                                                    await liststatusDi
                                                        .getStatus(
                                                            context: context);
fetchinspectionsamplelistfromDatabase();
                                                    // Navigate only after all data is loaded
                                                             if (context.mounted) {
     Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              const Inspectionpagelayout(),
                                                        ));
                                                             }
                                               
                                                  }
                                                : null,
                                            child: Text("Next",
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
