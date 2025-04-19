import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:qc_control_app/constant/Exception/show_pop_error.dart';
import 'package:qc_control_app/constant/api_connection.dart';
import 'package:qc_control_app/constant/customwidgets/custombutton.dart';
import 'package:qc_control_app/constant/customwidgets/customtheme.dart';
import 'package:qc_control_app/constant/request_data_model.dart/reaction_request_model.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/eventqueelocaldata_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/listofrestartevent_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/login_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/obsparameter_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/reaction_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/responsive_screen/tablet_body.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NexteventSlidepopup extends StatefulWidget {
  
  NexteventSlidepopup(
      {required this.reactionNotes, required this.actionstatus});

  List<String>? reactionNotes;
  List<int> actionstatus;
  @override
  State<NexteventSlidepopup> createState() => _NexteventSlidepopupState();
}

class _NexteventSlidepopupState extends State<NexteventSlidepopup> {
  bool _isLoading = false;
  int _radioSelected = 0;
  String selectRestartEvent = "";
  int selectrestartStatusId = 0;
  TextEditingController overallDescription = TextEditingController();

  Future<void> sendServerParamdata(BuildContext context, String apifor) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString("client_token") ?? "";

    final observationSample =
        Provider.of<ObsparameterProvider>(context, listen: false)
                .obsparam
                ?.observationBySamples ??
            [];

    final reaction = Provider.of<ReactionProvider>(context, listen: false)
            .reaction
            ?.listOfReaction ??
        [];

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

    final requestdata = ReactionrequestModel(
      apiFor: apifor,
      clientAutToken: token,
      reactionStatus: _radioSelected,
      eventQueId: queid,
      eventTriggerId: eventtriggerid,
      nextEventid: _radioSelected == 2 ? selectrestartStatusId : 0,
      eventId: eventid,
      imfgpId: imfgpid,
      iqcIieCphId: headerId,
      iqcIieAssetId: assetId,
      pcId: pcid,
      orgId: orgid,
      overallNotes: overallDescription.text,
      reactionId: reaction.first.iqcIirId,
      reactionData: [],
    );

    for (int i = 0; i < reaction.length; i++) {
      final reactionList = reaction[i];

      final sampleData = ReactionData(
        actionStatus: widget.actionstatus[i],
        reactionactionId: reactionList.iqcIraId,
        reactionNotes: widget.reactionNotes?[i],
      );
      requestdata.reactionData.add(sampleData);
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
    final restartEvent =
        Provider.of<ListofrestarteventProvider>(context, listen: false)
                .restartEvent
                ?.listOfNormalEvent ??
            [];
    return Drawer(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: Color.fromARGB(150, 235, 236, 255),
        child: _isLoading
            ? const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Next Action',
                      style: TextStyle(
                          fontSize: 24.sp,
                          color: Color.fromARGB(255, 80, 96, 203),
                          fontFamily: "Lexend",
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 1,
                          groupValue: _radioSelected,
                          activeColor: Colors.green,
                          onChanged: (value) {
                            setState(() {
                              _radioSelected = value ?? 0;
                            });
                          },
                        ),
                        Text(
                          'Hold',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Lexend",
                              fontSize: 18.sp),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 2,
                          groupValue: _radioSelected,
                          activeColor: Colors.blue,
                          onChanged: (value) {
                            setState(() {
                              _radioSelected = value ?? 0;
                            });
                          },
                        ),
                        Text('Restart',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Lexend",
                                fontSize: 18.sp)),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 3,
                          groupValue: _radioSelected,
                          activeColor: Colors.red,
                          onChanged: (value) {
                            setState(() {
                              _radioSelected = value ?? 0;
                            });
                          },
                        ),
                        Text('Abandon',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Lexend",
                                fontSize: 18.sp)),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    _radioSelected == 0
                        ? SizedBox()
                        : Column(
                            children: [
                              if (_radioSelected == 2)
                                Padding(
                                  padding: EdgeInsets.only(bottom: 12.h),
                                  child: DropdownButtonFormField<String>(
                                    value: restartEvent.any((e) =>
                                            e.eventName == selectRestartEvent)
                                        ? selectRestartEvent
                                        : null,
                                    hint: Text("Select Event"),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 18),
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    icon: Icon(Icons.keyboard_arrow_down,
                                        color: Colors.black54),
                                    onChanged: (String? newValue) {
                                      if (newValue != null) {
                                        final selectedStatus =
                                            restartEvent.firstWhere((status) =>
                                                status.eventName == newValue);
                                        setState(() {
                                          selectRestartEvent = newValue;
                                          selectrestartStatusId =
                                              selectedStatus.iqcCppeIeId ?? 0;
                                        });
                                      }
                                    },
                                    items: restartEvent
                                        .map((entry) => entry.eventName)
                                        .toSet()
                                        .map((eventName) {
                                      return DropdownMenuItem<String>(
                                        value: eventName,
                                        child: Text(
                                          eventName ?? "",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black87),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 16.h),
                                child: TextFormField(
                                  controller: overallDescription,
                                  maxLines: 3,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 16),
                                    hintText: "Enter Notes",
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 1.5),
                                    ),
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
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomButton(
                                    width: ThemeClass.buttonwidth,
                                    height: ThemeClass.buttonheight,
                                    backgroundColor: ThemeClass.buttonColor,
                                    borderRadius: BorderRadius.circular(
                                        ThemeClass.butborderradious),
                                    onPressed: (_radioSelected == 2 &&
                                                overallDescription
                                                    .text.isNotEmpty &&
                                                selectrestartStatusId != 0) ||
                                            (_radioSelected != 2 &&
                                                overallDescription
                                                    .text.isNotEmpty)
                                        ? () async {
                                            try {
                                              await sendServerParamdata(context,
                                                  "list_reaction_submit");
                                              Navigator.pushReplacement(context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return ResponsiveTabletHomepage();
                                              }));
                                            } catch (e) {
                                              ShowError.showAlert(
                                                  context, e.toString());
                                            }
                                          }
                                        : null,
                                    child: const Text("Ok",
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                  CustomButton(
                                    width: ThemeClass.buttonwidth,
                                    height: ThemeClass.buttonheight,
                                    backgroundColor:
                                        ThemeClass.cancelbuttonColor,
                                    borderRadius: BorderRadius.circular(
                                        ThemeClass.butborderradious),
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text("Cancel",
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                ],
                              )
                            ],
                          ),
                  ],
                ),
              ));
  }
}
