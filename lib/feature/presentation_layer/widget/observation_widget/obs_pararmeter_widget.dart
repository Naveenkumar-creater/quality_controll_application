import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:qc_control_app/constatnt/Exception/show_pop_error.dart';
import 'package:qc_control_app/constatnt/customwidgets/custombutton.dart';
import 'package:qc_control_app/constatnt/customwidgets/customtheme.dart';
import 'package:qc_control_app/constatnt/request_data_model.dart/obs_parameter_save_model.dart';
import 'package:qc_control_app/feature/domain_layer/entity/list_status_entity.dart';
import 'package:qc_control_app/feature/presentation_layer/layout/inspectionpagelayout.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/eventqueelocaldata_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/inspecSampleLocalData_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/list_status_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/login_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../provider/obsparameter_provider.dart';
import 'package:qc_control_app/constatnt/api_connection.dart';

class ObsPararmeterWidget extends StatefulWidget {
  const ObsPararmeterWidget({super.key});

  @override
  State<ObsPararmeterWidget> createState() => _ObsPararmeterWidgetState();
}

class _ObsPararmeterWidgetState extends State<ObsPararmeterWidget> {
  List<String?> selectedValuesMap = [];

  List<int> storeActualValue = [];

  // List<String> optionList = ["Passed", "Conditionally Passed", "Failed"];
  String? selectename;
  final _formKey = GlobalKey<FormState>();

  List<TextEditingController> controllers = [];
  List<TextEditingController?> enterDescription = [];
  List<bool> dropdownEnabled = [];

  bool _isEnable = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    // await Future.delayed(Duration(seconds: 1));
    final sample =
        context.read<ObsparameterProvider>().obsparam?.observationBySamples ??
            [];
    final optionList = Provider.of<ListStatusProvider>(context, listen: false)
        .status
        ?.listOfStatusLable;

    if (sample.isNotEmpty) {
      // Generate lists
      storeActualValue = List.generate(sample.length, (index) {
        final value = sample[index].iqcIioObservationStatus;
        return (value != null && value != 0) ? value : 0;
      });

      selectedValuesMap = List.generate(sample.length, (index) {
        final value = sample[index].iqcIioObservationStatus;
        final hasMatchingOption =
            optionList?.any((item) => item.clId == value) ?? false;

//  dropdownEnabled = List<bool>.filled(sample.length, true);
        final matchingOption = hasMatchingOption
            ? optionList!.firstWhere((item) => item.clId == value)
            : ListOfStatusLabelEntity(clId: -1, clLabel: "Unknown");

        return (matchingOption?.clId != -1) ? matchingOption?.clLabel : null;
      });

      controllers = List.generate(sample.length, (index) {
        final value = sample[index].iqcCpsSpecType == 3
            ? sample[index].iqcIioObservationTextValue
            : sample[index].iqcIioObservationNumericValue;
        return value != null&& value != 0
            ? TextEditingController(text: value.toString())
            : TextEditingController();
      });

      enterDescription = List.generate(sample.length, (index) {
        final value = sample[index].iqcIioObservationNotes ?? "";
        return TextEditingController(text: value.toString());
      });

      // 🔥 Ensure UI updates after setting values
      setState(() {});
    } else {
      setState(() {
        controllers = [];
        enterDescription = [];
      });
    }
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Map<String, int> productStatus = {"Stop": 1, "Monitor": 2, "Continue": 3};

  String? selectedStatusValue = ""; // Store the selected label
  int? selectedStatusId = 0; // Store the corresponding ID

  Future<void> sendServerParamdata(
      BuildContext context, String apifor, int status) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    String token = pref.getString("client_token") ?? "";
    final observationSample =
        Provider.of<ObsparameterProvider>(context, listen: false)
                .obsparam
                ?.observationBySamples ??
            [];

    final eventtriggerid =
        Provider.of<InspecsampleLocalDataProvider>(context, listen: false)
            .sampledata
            ?.iqcIiqIieId;

    final queid =
        Provider.of<EventqueelocaldataProvider>(context, listen: false)
            .queedata
            ?.iqcIiqId;

    int? orgid = Provider.of<LoginProvider>(context, listen: false)
            .user
            ?.userLoginEntity
            ?.orgId ??
        0;

    final requestdata = EventQueeModel(
        apiFor: apifor,
        clientAutToken: token,
        eventStatus: status,
        eventQueId: queid,
        eventTriggerId: eventtriggerid,
        orgid: orgid,
        listOfParamValue: []);

    for (int i = 0; i < observationSample.length; i++) {
      final observation = observationSample[i];
      double value = double.tryParse(controllers[i].text) ?? 0.0;

      final paramData = ListOfParamValueModel(
          paramId: observation.iqcCpsIspId,
          inspectionId: observation.iqcIioIiId,
          paramValue: observation.iqcCpsSpecType == 3  ? 0.0
              : value, // Ensure valid integer input
          paramNotes:
              observation.iqcCpsSpecType == 3 ? controllers[i].text : '',
          parameterStatus: storeActualValue[i],
          obsrvationNotes: enterDescription[i]?.text ?? "",
          observationId: observation.iqcIioId);
          
      requestdata.listOfParamValue?.add(paramData);
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

  InputDecoration inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(fontSize: 14.sp, color: Colors.black87),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue, width: 1.5),
      ),
    );
  }

  TextStyle inputTextStyle() {
    return TextStyle(fontSize: 16.sp, color: Colors.black);
  }

  TextStyle _headerTextStyle() {
    return TextStyle(
      color: Colors.white,
      fontFamily: "Lexend",
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
    );
  }

bool _isValueInRange(double? lowerRangeValue, double? upperRangeValue, String enteredValue) {
  if (lowerRangeValue == null || upperRangeValue == null) return false;

  final lower = lowerRangeValue < upperRangeValue ? lowerRangeValue : upperRangeValue;
  final upper = lowerRangeValue > upperRangeValue ? lowerRangeValue : upperRangeValue;
  final value = double.tryParse(enteredValue) ?? double.nan;

  return value.isFinite && lower <= value && value <= upper;
}


  bool _isValueValid(dynamic item, String enteredValue) {
    final value = double.tryParse(enteredValue) ?? 0;

    return value == item;
  }

  void updateProductName(int index, int value) {
    final optionList = Provider.of<ListStatusProvider>(context, listen: false)
        .status
        ?.listOfStatusLable;

    final hasMatchingOption =
        optionList?.any((item) => item.clId == value) ?? false;

    final matchingOption = hasMatchingOption
        ? optionList!.firstWhere((item) => item.clId == value)
        : ListOfStatusLabelEntity(clId: -1, clLabel: "Unknown");
    storeActualValue[index] = matchingOption.clId ?? 0;
    selectedValuesMap[index] =
        (matchingOption.clId != -1) ? matchingOption.clLabel : null;
  }

  void validateAndMoveFocus(int index, int spectype, int singlevalue,
      double rangefrom, double rangeto) {
    final value = controllers[index].text;
    if (controllers[index].text.isNotEmpty) {
      final isValueInRange = _isValueInRange(rangefrom, rangeto, value);
      final isValueValid = _isValueValid(singlevalue, value);

      if (spectype == 1) {
        if (isValueValid) {
          setState(() {
            updateProductName(index, 3);
          });
          FocusScope.of(context).nextFocus();
        } else {
          setState(() {
            updateProductName(index, 4);
          });
          FocusScope.of(context).nextFocus();
        }
      } else if (spectype == 2) {
        if (isValueInRange) {
          setState(() {
            updateProductName(index, 3);
          });
          FocusScope.of(context).nextFocus();
        } else {
          setState(() {
            updateProductName(index, 4);
          });
          FocusScope.of(context).nextFocus();
        }
      } else if (spectype == 3) {
        setState(() {
          updateProductName(index, 0);
        });
        FocusScope.of(context).nextFocus();
      }
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final optionList = Provider.of<ListStatusProvider>(context, listen: false)
            .status
            ?.listOfStatusLable ??
        [];
    final groupedSamples = <String, List>{};

    final size = MediaQuery.of(context).size.width < 600;

    OutlineInputBorder borderstyle = const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 1.5),
    );

    OutlineInputBorder borderRadious = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
    );

    return size
        ? Padding(
            padding: EdgeInsets.all(8.w),
            child: Column(
              children: [
                // Header Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Observation Fields",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 200,
                      height: 45,
                      child: DropdownButtonFormField<String>(
                        value: (selectedStatusValue != null &&
                                selectedStatusValue!.isNotEmpty)
                            ? selectedStatusValue
                            : null,
                        hint: const Text("Select"),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(8),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        icon: Icon(Icons.keyboard_arrow_down,
                            color: Colors.black54),
                        onChanged: (value) {
                          setState(() {
                            selectedStatusValue = value; // Store selected label
                            selectedStatusId = productStatus[value] ??
                                0; // Store corresponding ID (default to 0 if null)
                          });

                          print("Selected Label: $selectedStatusValue");
                          print("Selected ID: $selectedStatusId");
                        },
                        items: productStatus.entries.map((entry) {
                          return DropdownMenuItem<String>(
                            value: entry.key,
                            child: Text(
                              entry.key, // Display the label
                              style: TextStyle(
                                  fontSize: 16.sp, color: Colors.black87),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    CustomButton(
                      width: ThemeClass.mobbuttonwidth,
                      height: ThemeClass.mobbuttonheight,
                      backgroundColor: ThemeClass.buttonColor,
                      borderRadius:
                          BorderRadius.circular(ThemeClass.butborderradious),
                      onPressed: () {
// obsSampleDi.getSampleList(inspectionid:parameter?.iqcIiId ?? 0 , context: context);
//                       _obsSample();
// getSampledata(sample);

                        print(groupedSamples);

                        sendServerParamdata(
                            context, "list_of_saved_parameter", 2);
                      },
                      child: Text("Save",
                          style: TextStyle(
                              fontFamily: "lexend",
                              fontSize: ThemeClass.buttonTextSize,
                              color: Colors.white)),
                    ),
                    SizedBox(width: 10.h),
                    CustomButton(
                      width: ThemeClass.mobbuttonwidth,
                      height: ThemeClass.mobbuttonheight,
                      backgroundColor: ThemeClass.buttonColor,
                      borderRadius:
                          BorderRadius.circular(ThemeClass.butborderradious),
                      onPressed: () {
// obsSampleDi.getSampleList(inspectionid:parameter?.iqcIiId ?? 0 , context: context);
//                       _obsSample();
// getSampledata(sample);

                        print(groupedSamples);

                        sendServerParamdata(
                            context, "list_of_saved_parameter", 3);
                      },
                      child: Text("Submit",
                          style: TextStyle(
                              fontFamily: "lexend",
                              fontSize: ThemeClass.buttonTextSize,
                              color: Colors.white)),
                    )
                  ],
                ),
                SizedBox(height: 10.h),

                Consumer<ObsparameterProvider>(
                  builder: (context, obsParam, child) {
                    final sample = obsParam.obsparam?.observationBySamples;

                    if (sample == null || sample.isEmpty) {
                      return Center(
                        child: Text(
                          "No Parameters Found",
                          style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                        ),
                      );
                    }

                    groupedSamples.clear();
                    for (var sampleItem in sample) {
                      String groupName = sampleItem.iqcIsgGroupName ?? "Other";
                      groupedSamples.putIfAbsent(groupName, () => []);
                      if (!groupedSamples[groupName]!.contains(sampleItem)) {
                        groupedSamples[groupName]!.add(sampleItem);
                      }
                    }

                    return ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: groupedSamples.entries.map((entry) {
                        return Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 0),
                          child: Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                              ),
                              child: Theme(
                                data: Theme.of(context).copyWith(
                                  dividerColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                ),
                                child: ExpansionTile(
                                  title: Text(
                                    entry.key,
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(255, 80, 96, 203),
                                    ),
                                  ),
                                  iconColor: Colors.blueAccent,
                                  childrenPadding: EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 6),
                                  children: entry.value.map((sampleList) {
                                    int index = sample.indexOf(sampleList);
                                    return Container(
                                      margin: EdgeInsets.symmetric(vertical: 6),
                                      padding: EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        color: ThemeClass.backgroundcolor,
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                            color: Colors.grey.shade300),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ListTile(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 12,
                                                    vertical: 8),
                                            leading: CircleAvatar(
                                              radius: 18,
                                              backgroundColor:
                                                  Colors.blue.shade700,
                                              child: Text(
                                                "${index + 1}",
                                                style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            title: Text(
                                              sampleList.iqcIspParamName ??
                                                  "N/A",
                                              style: TextStyle(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black87,
                                              ),
                                            ),
                                            subtitle: Padding(
                                              padding: EdgeInsets.only(top: 4),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Specs: ",
                                                    style: TextStyle(
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      width:
                                                          6), // Add spacing between "Specs" and the value
                                                  Expanded(
                                                    child: Text(
                                                      sampleList.iqcCpsSpecType ==
                                                              1
                                                          ? "${sampleList.iqcCpsValue}"
                                                          : sampleList.iqcCpsSpecType ==
                                                                  2
                                                              ? "${sampleList.iqcCpsRangeFrom} - ${sampleList.iqcCpsRangeTo}"
                                                              : "${sampleList.iqcCpsSpecDesc}",
                                                      style: TextStyle(
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors
                                                            .blue.shade800,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 12),
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 2,
                                                child: (index <
                                                        controllers.length)
                                                    ? TextFormField(
                                                        controller:
                                                            controllers[index],
                                                        keyboardType: sampleList
                                                                    .iqcCpsSpecType ==
                                                                3
                                                            ? TextInputType.text
                                                            : TextInputType
                                                                .number,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText:
                                                              "Enter Value",
                                                          labelStyle: TextStyle(
                                                            fontSize: 14.sp,
                                                            color:
                                                                Colors.black87,
                                                          ),
                                                          filled: true,
                                                          fillColor:
                                                              Colors.white,
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .blue,
                                                                    width: 1.5),
                                                          ),
                                                        ),
                                                        style: TextStyle(
                                                            fontSize: 16.sp,
                                                            color:
                                                                Colors.black),
                                                      )
                                                    : SizedBox(),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 12),
                                          TextFormField(
                                            controller: enterDescription[index],
                                            decoration: InputDecoration(
                                              labelText: "Enter Description",
                                              labelStyle: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 14.sp,
                                              ),
                                              filled: true,
                                              fillColor: Colors.white,
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.blue,
                                                    width: 1.5),
                                              ),
                                            ),
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
              ],
            ),
          )
        : Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.all(8.0.w),
              child: Column(
                children: [
                  // Header Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Observation Fields",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      Row(
                        children: [
                          CustomButton(
                            width: ThemeClass.buttonwidth,
                            height: ThemeClass.buttonheight,
                            backgroundColor: ThemeClass.buttonColor,
                            borderRadius: BorderRadius.circular(
                                ThemeClass.butborderradious),
                            onPressed: () async {
                              // obsSampleDi.getSampleList(inspectionid:parameter?.iqcIiId ?? 0 , context: context);
                              //                       _obsSample();
                              // getSampledata(sample);

                              print(groupedSamples);

                              await sendServerParamdata(
                                  context, "list_of_saved_parameter", 3);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const Inspectionpagelayout(),
                                ),
                              );
                            },
                            child: Text("Save",
                                style: TextStyle(
                                    fontFamily: "lexend",
                                    fontSize: ThemeClass.buttonTextSize,
                                    color: Colors.white)),
                          ),
                          SizedBox(width: 10.h),
                          CustomButton(
                              width: ThemeClass.buttonwidth,
                              height: ThemeClass.buttonheight,
                              backgroundColor: ThemeClass.buttonColor,
                              borderRadius: BorderRadius.circular(
                                  ThemeClass.butborderradious),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  await sendServerParamdata(
                                      context, "list_of_saved_parameter", 3);

                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const Inspectionpagelayout(),
                                    ),
                                  );
                                }
                                ;

                                // obsSampleDi.getSampleList(inspectionid:parameter?.iqcIiId ?? 0 , context: context);
                                //                       _obsSample();
                                // getSampledata(sample);

                                print(groupedSamples);

                                //   sendServerParamdata(
                                //       context, "list_of_saved_parameter", 4);
                              },
                              child: Text("Submit",
                                  style: TextStyle(
                                      fontFamily: "lexend",
                                      fontSize: ThemeClass.buttonTextSize,
                                      color: Colors.white)))
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 10.h),

                  Container(
                    height: 80.h,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 45, 54, 104),
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        crossAxisAlignment:
                            CrossAxisAlignment.center, // Ensures text alignment
                        children: [
                          Expanded(
                            flex: 1,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "S.No",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Lexend",
                                    fontSize: 16.sp),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Specification Group",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Lexend",
                                    fontSize: 16.sp),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Parameters",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Lexend",
                                    fontSize: 16.sp),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Actual Values",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Lexend",
                                    fontSize: 16.sp),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Status",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Lexend",
                                    fontSize: 16.sp),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Notes",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Lexend",
                                    fontSize: 16.sp),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2, // Increased to align better with others
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Specification",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Lexend",
                                    fontSize: 16.sp),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Container(
                    height: 430.h,
                    child: Consumer<ObsparameterProvider>(
                        builder: (context, obsParam, child) {
                      final sample = obsParam.obsparam?.observationBySamples;

                      print(sample);

                      if (sample == null || sample.isEmpty) {
                        return Center(
                          child: Text(
                            "No Parameters Found",
                            style:
                                TextStyle(fontSize: 16.sp, color: Colors.grey),
                          ),
                        );
                      }

                      // selectedValuesMap = List.generate(sample.length, (index) {
                      //   return (optionList.isNotEmpty) ? "" : "";
                      // });

                      groupedSamples.clear();

                      // Grouping only for display
                      for (var sampleItem in sample) {
                        String groupName =
                            sampleItem.iqcIsgGroupName ?? "Other";

                        // Ensure the group exists
                        groupedSamples.putIfAbsent(groupName, () => []);

                        // Avoid adding duplicate items
                        if (!groupedSamples[groupName]!.contains(sampleItem)) {
                          groupedSamples[groupName]!.add(sampleItem);
                        }
                      }

                      print(groupedSamples);

                      return SingleChildScrollView(
                        child: Column(
                          children: groupedSamples.entries.map((entry) {
                            return Column(
                              children: entry.value.map((sampleList) {
                                int index = sample.indexOf(sampleList);

                                return Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: index % 2 == 0
                                        ? Colors.grey.shade50
                                        : Colors.grey.shade200,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(5.r),
                                      bottomRight: Radius.circular(5.r),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "${index + 1}",
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "${sampleList.iqcIsgGroupName}",
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "${sampleList.iqcIspParamName}",
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: controllers.isNotEmpty &&
                                                index < controllers.length
                                            ? Container(
                                                alignment: Alignment.centerLeft,
                                                padding: const EdgeInsets.only(
                                                    right: 10.0),
                                                child: FocusScope(
                                                  onFocusChange: (onfocus) {
                                                    if (!onfocus) {
                                                      validateAndMoveFocus(
                                                          index,
                                                          sampleList
                                                              .iqcCpsSpecType,
                                                          sampleList
                                                              .iqcCpsValue,
                                                          sampleList
                                                              .iqcCpsRangeFrom,
                                                          sampleList
                                                              .iqcCpsRangeTo);
                                                      // Explicitly unfocus the field
                                                    }
                                                  },
                                                  child: Container(
                                                    width: 180,
                                                    child: TextFormField(
                                                      controller:
                                                          controllers[index],
                                                      keyboardType: sampleList
                                                                  .iqcCpsSpecType ==
                                                              3
                                                          ? TextInputType.text
                                                          : TextInputType
                                                              .number,
                                                      decoration: InputDecoration(
                                                          hintText:
                                                              "Enter Actual Value",
                                                          filled: true,
                                                          fillColor:
                                                              Colors.white,
                                                          border: borderRadious,
                                                          enabledBorder:
                                                              borderstyle,
                                                          focusedBorder:
                                                              borderstyle),
                                                      onChanged: (text) {
                                                        if (text.isEmpty) {
                                                          setState(() {
                                                            selectedValuesMap[
                                                                    index] =
                                                                null; // Reset dropdown to "Select Status"
                                                          });
                                                        }
                                                      },
                                                      validator: (value) {
                                                        {
                                                          if (value == null ||
                                                              value.isEmpty) {
                                                            return 'Enter the Actual Value';
                                                          }
                                                          if (value.startsWith(
                                                              ' ')) {
                                                            return 'cannot start with a space';
                                                          }
                                                        }
                                                        return null; // Return null when "Passed" is selected
                                                      },
                                                      onEditingComplete: () =>
                                                          validateAndMoveFocus(
                                                              index,
                                                              sampleList
                                                                  .iqcCpsSpecType,
                                                              sampleList
                                                                  .iqcCpsValue,
                                                              sampleList
                                                                  .iqcCpsRangeFrom,
                                                              sampleList
                                                                  .iqcCpsRangeTo),
                                                      style: TextStyle(
                                                          fontSize: 16.sp,
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : SizedBox(), // If empty, show nothing
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 10.0),
                                          child: Container(
                                            alignment: Alignment.centerLeft,
                                            width: 20.w,
                                            child:
                                                DropdownButtonFormField<String>(
                                              value: (index <
                                                          selectedValuesMap
                                                              .length &&
                                                      optionList.any((item) =>
                                                          item.clLabel ==
                                                          selectedValuesMap[
                                                              index]))
                                                  ? selectedValuesMap[index]
                                                  : null,
                                              hint: Text("Select Status"),
                                              decoration: InputDecoration(

                                                  // labelText: "Select Status",
                                                  // labelStyle: TextStyle(
                                                  //   fontSize: 14.sp,
                                                  //   color: Colors.black87,
                                                  // ),

                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  border: borderRadious,
                                                  enabledBorder: borderstyle,
                                                  focusedBorder: borderstyle),
                                              isExpanded: true,
                                              icon: Icon(
                                                  Icons.keyboard_arrow_down,
                                                  color: Colors.black54),
                                              onChanged: (sampleList.iqcCpsSpecType !=  3 && controllers[index].text.isNotEmpty)  ?
                                              
                                              null :
                                              (value) {
                                                if (value == null) return;

                                                /// Ensure `selectedValuesMap` and `storeActualValue` have enough elements
                                                if (index >=
                                                    selectedValuesMap.length) {
                                                  setState(() {
                                                    selectedValuesMap = List.generate(
                                                        index + 1,
                                                        (i) => i <
                                                                selectedValuesMap
                                                                    .length
                                                            ? selectedValuesMap[
                                                                i]
                                                            : "");
                                                  });
                                                }
                                                if (index >=
                                                    storeActualValue.length) {
                                                  setState(() {
                                                    storeActualValue = List.generate(
                                                        index + 1,
                                                        (i) => i <
                                                                storeActualValue
                                                                    .length
                                                            ? storeActualValue[
                                                                i]
                                                            : 0);
                                                  });
                                                }

                                                setState(() {
                                                  selectedValuesMap[index] =
                                                      value;

                                                  final selectedStatus =
                                                      optionList.firstWhere(
                                                    (activity) =>
                                                        activity.clLabel ==
                                                        value,
                                                    // Prevents exception if not found
                                                  );

                                                  if (selectedStatus != null) {
                                                    storeActualValue[index] =
                                                        selectedStatus.clId ??
                                                            0;
                                                  }
                                                });
                                              },
                                              validator: (value) =>
                                                  value == null
                                                      ? 'Select Status'
                                                      : null,
                                              items:
                                                  optionList.map((selectValue) {
                                                return DropdownMenuItem<String>(
                                                  value: selectValue.clLabel,
                                                  child: Text(
                                                    selectValue.clLabel ?? "",
                                                    style: TextStyle(
                                                        fontSize: 14.sp,
                                                        color: Colors.black87),
                                                  ),
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          padding: const EdgeInsets.only(
                                              right: 10.0),
                                          child: enterDescription.isNotEmpty &&
                                                  index <
                                                      enterDescription.length
                                              ? TextFormField(
                                                  controller:
                                                      enterDescription[index],
                                                  decoration: InputDecoration(
                                                      hintText: "Enter Notes",
                                                      filled: true,
                                                      fillColor: Colors.white,
                                                      border: borderRadious,
                                                      enabledBorder:
                                                          borderstyle,
                                                      focusedBorder:
                                                          borderstyle),
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      color: Colors.black),
                                                )
                                              : SizedBox(),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.w),
                                          alignment: Alignment.centerLeft,
                                          child: sampleList.iqcCpsSpecType == 1
                                              ? Text(
                                                  "${sampleList.iqcCpsValue}",
                                                  style: TextStyle(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.blue.shade800,
                                                  ),
                                                )
                                              : sampleList.iqcCpsSpecType == 2
                                                  ? Text(
                                                      "${sampleList.iqcCpsRangeFrom} to ${sampleList.iqcCpsRangeTo}",
                                                      style: TextStyle(
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors
                                                            .blue.shade800,
                                                      ),
                                                    )
                                                  : Text(
                                                      "${sampleList.iqcCpsSpecDesc}",
                                                      style: TextStyle(
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors
                                                            .blue.shade800,
                                                      ),
                                                    ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            );
                          }).toList(),
                        ),
                      );
                    }),
                  )
                ],
              ),
            ),
          );
  }
}
