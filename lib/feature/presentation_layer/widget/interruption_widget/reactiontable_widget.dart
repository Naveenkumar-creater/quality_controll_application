import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:qc_control_app/constant/Exception/show_pop_error.dart';
import 'package:qc_control_app/constant/api_connection.dart';
import 'package:qc_control_app/constant/customwidgets/custombutton.dart';
import 'package:qc_control_app/constant/customwidgets/customtheme.dart';
import 'package:qc_control_app/constant/request_data_model.dart/reaction_save_request_model.dart';
import 'package:qc_control_app/feature/domain_layer/entity/actionstep_entity.dart';
import 'package:qc_control_app/feature/presentation_layer/api_service.dart/actionstep_di.dart';
import 'package:qc_control_app/feature/presentation_layer/api_service.dart/interruption_status_di.dart';
import 'package:qc_control_app/feature/presentation_layer/api_service.dart/reaction_di.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/actionstep_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/eventqueelocaldata_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/listofrestartevent_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/login_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/obsparameter_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/reaction_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/sampleoverallstatus_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/widget/slidepopup/nextevent_slidepopup.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api_service.dart/listofrestart_di.dart';
import '../../api_service.dart/sampleoverallstatus_di.dart';
import '../../responsive_screen/tablet_body.dart';

class ReactionTableWidget extends StatefulWidget {
  const ReactionTableWidget({super.key});

  @override
  State<ReactionTableWidget> createState() => _ReactionTableWidgetState();
}

class _ReactionTableWidgetState extends State<ReactionTableWidget> {
  List<String?> selectedValuesMap = [];

  List<int> storeActualValue = [];
  List<TextEditingController> enterDescription = [];
  InterruptionStatusDi interruptionStatusDi = InterruptionStatusDi();
  ReactionDi reactionDi = ReactionDi();
  SampleoverallstatusDi overallstaus = SampleoverallstatusDi();
  ActionstepDi actionstepDi = ActionstepDi();
  ListofrestartDi listofrestartDi = ListofrestartDi();

  TextEditingController overallDescription = TextEditingController();
  int _radioSelected = 0;
  String? _radioVal;

  int? selectedStatusId = 0;
  String? statusValue = "";
  final _reactionformKey = GlobalKey<FormState>();
  String selectRestartEvent = "";
  int selectrestartStatusId = 0;
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      final eventlist =
          Provider.of<EventqueelocaldataProvider>(context, listen: false)
              .queedata;

      await listofrestartDi.getRestartEvent(
          context: context,
          imfgpid: eventlist?.imfgpId ?? 0,
          activityid: eventlist?.imfgpPaId ?? 0);
      await overallstaus.getAction(context: context, clgroup: "LINE_STATUS");
      await actionstepDi.getAction(
          clgroup: "ACTION_TAKEN_STATUS", context: context);
      await reactionDi.getReaction(
          context: context,
          queeid: eventlist?.iqcIiqId ?? 0,
          queestatus: eventlist?.iqcIiqStatus ?? 0,
          eventtriggerid: eventlist?.iqcIiqIieId ?? 0,
          imfgpid: eventlist?.imfgpId ?? 0,
          cphid: eventlist?.iqcIieCphId ?? 0,
          previouseventid: eventlist?.previouseventid ?? 0);

      final reaction = Provider.of<ReactionProvider>(context, listen: false)
              .reaction
              ?.listOfReaction ??
          [];
      final action = Provider.of<ActionstepProvider>(context, listen: false)
              .action
              ?.codeList ??
          [];
      if (reaction.isNotEmpty) {
        // Generate lists
        storeActualValue = List.generate(reaction.length, (index) {
          final value = reaction[index].iqcIraActionStatus;
          return (value != null && value != 0) ? value : 0;
        });

        selectedValuesMap = List.generate(reaction.length, (index) {
          final value = reaction[index].iqcIraActionStatus;
          final hasMatchingOption =
              action.any((item) => item.clId == value) ?? false;

          final matchingOption = hasMatchingOption
              ? action.firstWhere((item) => item.clId == value)
              : CodeListEntity(clId: -1, clLabel: "Unknown", clAlternateId: "");

          return (matchingOption.clId != -1) ? matchingOption.clLabel : null;
        });

        enterDescription = List.generate(reaction.length, (index) {
          final value = reaction[index].iqcIraActionNotes ?? "";
          return TextEditingController(text: value.toString());
        });

        setState(() {
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
          enterDescription = [];
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ShowError.showAlert(context, e.toString());
    }
  }



   Future<void> sendSaveServerReactiondata(BuildContext context, String apifor) async {
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

    final requestdata = ReactionSaverequestModel(
      apiFor: apifor,
      clientAutToken: token,
      eventQueId: queid,
      eventTriggerId: eventtriggerid,
      nextEventid: _radioSelected == 2 ? selectrestartStatusId : 0,
      eventId: eventid,
      imfgpId: imfgpid,
      iqcIieCphId: headerId,
      iqcIieAssetId: assetId,
      pcId: pcid,
      orgId: orgid,
      reactionId: reaction.first.iqcIirId,
      reactionData: [],
    );

    for (int i = 0; i < reaction.length; i++) {
      final reactionList = reaction[i];
   
      final sampleData = ReactionSaveData(
        actionStatus: storeActualValue[i],
        reactionactionId: reactionList.iqcIraId,
        reactionNotes: enterDescription[i].text,
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


  // @override
  // void dispose() {
  //   // TODO: implement dispose

  //   for (var description in enterDescription) {
  //     description.dispose();
  //   }
  //   super.dispose();
  // }

  Future<void> nextEventPopup() async {
    List<int> actionstatus = [];
    List<String> reactionnotes = [];

    final reaction = Provider.of<ReactionProvider>(context, listen: false)
            .reaction
            ?.listOfReaction ??
        [];
    for (int i = 0; i < reaction.length; i++) {
      final statusid = storeActualValue[i];
      final notes = enterDescription[i].text;

      actionstatus.add(statusid);
      reactionnotes.add(notes);
    }

    showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: '',
      transitionDuration: const Duration(milliseconds: 800),
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return Container();
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset.zero)
              .animate(animation),
          child: FadeTransition(
            opacity: Tween(begin: 0.5, end: 1.0).animate(animation),
            child: Align(
                alignment:
                    Alignment.centerRight, // Align the drawer to the right
                child: Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width *
                      0.30.w, // Set the width to half of the screen
                  height: MediaQuery.of(context)
                      .size
                      .height, // Set the height to full screen height
                  child: NexteventSlidepopup(
                    actionstatus: actionstatus,
                    reactionNotes: reactionnotes,
                  ),
                )),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final action = Provider.of<ActionstepProvider>(context, listen: false)
            .action
            ?.codeList ??
        [];

    final sampleoverallstatus =
        Provider.of<SampleoverallstatusProvider>(context, listen: false)
                .overrallstatus
                ?.codeList ??
            [];

    final restartEvent =
        Provider.of<ListofrestarteventProvider>(context, listen: false)
                .restartEvent
                ?.listOfNormalEvent ??
            [];

    OutlineInputBorder borderstyle = const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 1.5),
    );

    OutlineInputBorder borderRadious = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
    );

    return isLoading
        ? Center(child: CircularProgressIndicator())
        : Form(
            key: _reactionformKey,
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Reactions",
                            style: TextStyle(
                              fontSize: 18.sp,
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
                                     await sendSaveServerReactiondata(context,
                                                  "list_reaction_save");
                                              Navigator.pushReplacement(context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return ResponsiveTabletHomepage();
                                              }));
                                },
                                child: const Text("Save",
                                    style: TextStyle(color: Colors.white)),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              CustomButton(
                                width: ThemeClass.buttonwidth,
                                height: ThemeClass.buttonheight,
                                backgroundColor: ThemeClass.buttonColor,
                                borderRadius: BorderRadius.circular(
                                    ThemeClass.butborderradious),
                                onPressed: () async {
                                  if (_reactionformKey.currentState!
                                      .validate()) {
                                    await nextEventPopup();
                                  }
                                },
                                child: const Text("Submit",
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ],
                          )
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
                      color: const Color.fromARGB(255, 45, 54, 104),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5.r),
                        topRight: Radius.circular(5.r),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Container(
                            width: 100, // Same flex as data row
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "S.No",
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
                                "Reaction",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Lexend",
                                  fontSize: 18.sp,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1, // Same flex as data row
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Parameter",
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
                                "Action Step",
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
                                "Notes",
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
                    child: Consumer<ReactionProvider>(
                      builder: (context, reactionList, child) {
                        final reaction = reactionList.reaction?.listOfReaction;

                        return ListView.builder(
                          itemCount: reaction?.length,
                          itemBuilder: (context, index) {
                            final reactionItem = reaction?[index];
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
                              height: 90.h,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 100, // Matching header
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "${index + 1}",
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontFamily: "Lexend",
                                            fontSize: 15.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2, // Matching header
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "${reactionItem?.iqcCrpReactionDesc}",
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontFamily: "Lexend",
                                            fontSize: 15.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1, // Matching header
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "${reactionItem?.iqcIspParamName}",
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontFamily: "Lexend",
                                            fontSize: 15.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2, // Matching header
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                          width: 250,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 4.0),
                                            child:
                                                DropdownButtonFormField<String>(
                                              value: (index <
                                                          selectedValuesMap
                                                              .length &&
                                                      action.any((item) =>
                                                          item.clLabel ==
                                                          selectedValuesMap[
                                                              index]))
                                                  ? selectedValuesMap[index]
                                                  : null,
                                              hint: Text("Select Status"),
                                              decoration: InputDecoration(
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  border: borderRadious,
                                                  enabledBorder: borderstyle,
                                                  focusedBorder: borderstyle),
                                              isExpanded: true,
                                              icon: Icon(
                                                  Icons.keyboard_arrow_down,
                                                  color: Colors.black54),
                                              onChanged: (value) {
                                                if (value == null) return;

                                                if (index >=
                                                    selectedValuesMap.length) {
                                                  setState(() {
                                                    selectedValuesMap =
                                                        List.generate(
                                                      index + 1,
                                                      (i) => i <
                                                              selectedValuesMap
                                                                  .length
                                                          ? selectedValuesMap[i]
                                                          : "",
                                                    );
                                                  });
                                                }

                                                if (index >=
                                                    storeActualValue.length) {
                                                  setState(() {
                                                    storeActualValue =
                                                        List.generate(
                                                      index + 1,
                                                      (i) => i <
                                                              storeActualValue
                                                                  .length
                                                          ? storeActualValue[i]
                                                          : 0,
                                                    );
                                                  });
                                                }

                                                setState(() {
                                                  selectedValuesMap[index] =
                                                      value;

                                                  final selectedStatus =
                                                      action.firstWhere(
                                                    (activity) =>
                                                        activity.clLabel ==
                                                        value,
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
                                              items: action.map((selectValue) {
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
                                    ),
                                    Expanded(
                                      flex: 2, // Matching header
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                          child: index < enterDescription.length
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
                                                  // validator: (value) {
                                                  //   if (value == null || value.isEmpty) {
                                                  //     return 'Enter the Notes';
                                                  //   }
                                                  //   if (value.startsWith(' ')) {
                                                  //     return 'Notes cannot start with a space';
                                                  //   }
                                                  //   return null;
                                                  // },
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      color: Colors.black),
                                                )
                                              : SizedBox(),
                                        ),
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
                  ),
                ],
              ),
            ),
          );
  }
}
