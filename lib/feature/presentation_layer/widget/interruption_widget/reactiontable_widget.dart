import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:qc_control_app/constatnt/Exception/show_pop_error.dart';
import 'package:qc_control_app/constatnt/customwidgets/custombutton.dart';
import 'package:qc_control_app/constatnt/customwidgets/customtheme.dart';
import 'package:qc_control_app/feature/domain_layer/entity/actionstep_entity.dart';
import 'package:qc_control_app/feature/presentation_layer/api_service.dart/actionstep_di.dart';
import 'package:qc_control_app/feature/presentation_layer/api_service.dart/interruption_status_di.dart';
import 'package:qc_control_app/feature/presentation_layer/api_service.dart/reaction_di.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/actionstep_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/eventqueelocaldata_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/listofrestartevent_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/reaction_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/sampleoverallstatus_provider.dart';

import '../../api_service.dart/listofrestart_di.dart';
import '../../api_service.dart/sampleoverallstatus_di.dart';

class ReactionTableWidget extends StatefulWidget {
  const ReactionTableWidget({super.key});

  @override
  State<ReactionTableWidget> createState() => _ReactionTableWidgetState();
}

class _ReactionTableWidgetState extends State<ReactionTableWidget> {
  List<String?> selectedValuesMap = [];

  List<int> storeActualValue = [];
  List<TextEditingController> enterDescription = [];
    InterruptionStatusDi interruptionStatusDi =InterruptionStatusDi();
  ReactionDi reactionDi=ReactionDi(); 
  SampleoverallstatusDi overallstaus=SampleoverallstatusDi(); 
  ActionstepDi actionstepDi =ActionstepDi();
  ListofrestartDi listofrestartDi =ListofrestartDi();

  TextEditingController overallDescription= TextEditingController();

  int? selectedStatusId =0;
  String ? statusValue = "";

  String selectRestartEvent = "";
  int selectrestartStatusId= 0;
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
 
await listofrestartDi.getRestartEvent(context: context, imfgpid: eventlist?.imfgpId ?? 0, activityid: eventlist?.imfgpPaId ?? 0);
await overallstaus.getAction(context: context, clgroup: "LINE_STATUS");
await actionstepDi.getAction(clgroup: "ACTION_TAKEN_STATUS", context: context);
await reactionDi.getReaction(context: context, queeid: eventlist?.iqcIiqId ?? 0 , queestatus:   eventlist?.iqcIiqStatus ?? 0, eventtriggerid:  eventlist?.iqcIiqIieId ?? 0, imfgpid: eventlist?.imfgpId ?? 0, cphid:   eventlist?.iqcIieCphId ?? 0,previouseventid: eventlist?.previouseventid ?? 0);


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
    ShowError.showAlert(context,e.toString());
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


  void _submitPop(BuildContext context) {
  final restartEvent = Provider.of<ListofrestarteventProvider>(context, listen: false)
          .restartEvent
          ?.listOfNormalEvent ?? [];

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        content: StatefulBuilder(
          builder: (context, setState) {
            return WillPopScope(
              onWillPop: () async => false,
              child: Container(
                    width: 250,
                  height: 250,
                child: SingleChildScrollView(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Confirm Your Submission",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 16),
                  selectedStatusId == 3 ?
                      // Dropdown Button
                      DropdownButtonFormField<String>(
                        value: restartEvent.any((e) => e.eventName == selectRestartEvent)
                            ? selectRestartEvent
                            : null, // Ensure value exists in list
                        hint: const Text("Select Restart Event"),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black54),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            final selectedStatus = restartEvent.firstWhere(
                                (status) => status.eventName == newValue);
                            setState(() {
                              selectRestartEvent = newValue;
                              selectrestartStatusId = selectedStatus.iqcCppeIeId ?? 0;
                            });
                          }
                        },
                        items: restartEvent
                            .map((entry) => entry.eventName) // Ensure unique values
                            .toSet() // Remove duplicates
                            .map((eventName) {
                          return DropdownMenuItem<String>(
                            value: eventName,
                            child: Text(
                              eventName ?? "",
                              style: const TextStyle(fontSize: 16, color: Colors.black87),
                            ),
                          );
                        }).toList(),
                      ) : SizedBox(),
                  
                      const SizedBox(height: 8),
                  
                      // Text Field for Notes
                      TextFormField(
                        controller: overallDescription,
                        maxLines: 3,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                          hintText: "Enter Notes",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue, width: 1.5),
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
                        style: const TextStyle(fontSize: 16, color: Colors.black),
                      ),
                  
                      const SizedBox(height: 24),
                  
                      // Buttons (Cancel & Submit)
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
                            child: const Text("Cancel", style: TextStyle(color: Colors.white)),
                          ),
                            CustomButton(
                            width: ThemeClass.buttonwidth,
                            height: ThemeClass.buttonheight,
                            backgroundColor: ThemeClass.buttonColor,
                            borderRadius: BorderRadius.circular(
                                ThemeClass.butborderradious),
                            onPressed: () async {
                                    try {
                                      Navigator.pop(context);
                                    } catch (e) {
                                      ShowError.showAlert(context, e.toString());
                                    }
                                  },
                                
                            child: const Text("Submit", style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
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

                final sampleoverallstatus = Provider.of<SampleoverallstatusProvider>(context, listen: false)
            .overrallstatus
            ?.codeList ??
        [];
    return 
    
    
      isLoading
              ? Center(child: CircularProgressIndicator()):
              
              Container(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(top: 8,left: 8, right: 8),
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
              
                    SizedBox(
                        width:200 ,
                        child: DropdownButtonFormField<String>(
                          value: sampleoverallstatus.any((e) => e.clLabel == statusValue)
                              ? statusValue
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
                              final selectedStatus = sampleoverallstatus.firstWhere(
                                  (status) => status.clLabel == newValue);
              
                              setState(() {
                                statusValue = newValue;
                                selectedStatusId =
                                    selectedStatus.clId ?? 0;
              print(selectedStatusId);
                               _submitPop(context);
                              });
                            }
                          },
                          items: sampleoverallstatus
                              .map((entry) => entry.clLabel) // Ensure unique values
                              .toSet() // Remove duplicates
                              .map((eventName) {
                            return DropdownMenuItem<String>(
                              value: eventName,
                              child: Text(
                                eventName ?? "",
                                style: const TextStyle(fontSize: 16, color: Colors.black87),
                              ),
                            );
                          }).toList(),
                        ),
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
    color: const Color.fromARGB(255, 45, 54, 104),
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(5.r),
      topRight: Radius.circular(5.r),
    ),
  ),
  child: Row(
    children: [
      Expanded(
        flex: 1, // Same flex as data row
        child: Center(
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
        child: Center(
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
        flex: 2, // Same flex as data row
        child: Center(
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
        child: Center(
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
        child: Center(
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
            height: 80.h,
            child: Row(
              children: [
                Expanded(
                  flex: 1, // Matching header
                  child: Center(
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
                  child: Center(
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
                  flex: 2, // Matching header
                  child: Center(
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
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: DropdownButtonFormField<String>(
                      value: (index < selectedValuesMap.length &&
                              action.any((item) =>
                                  item.clLabel == selectedValuesMap[index]))
                          ? selectedValuesMap[index]
                          : null,
                      hint: Text("Select Status"),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      isExpanded: true,
                      icon: Icon(Icons.keyboard_arrow_down, color: Colors.black54),
                      onChanged: (value) {
                        if (value == null) return;

                        if (index >= selectedValuesMap.length) {
                          setState(() {
                            selectedValuesMap = List.generate(
                              index + 1,
                              (i) => i < selectedValuesMap.length ? selectedValuesMap[i] : "",
                            );
                          });
                        }

                        if (index >= storeActualValue.length) {
                          setState(() {
                            storeActualValue = List.generate(
                              index + 1,
                              (i) => i < storeActualValue.length ? storeActualValue[i] : 0,
                            );
                          });
                        }

                        setState(() {
                          selectedValuesMap[index] = value;

                          final selectedStatus = action.firstWhere(
                            (activity) => activity.clLabel == value,
                          );

                          if (selectedStatus != null) {
                            storeActualValue[index] = selectedStatus.clId ?? 0;
                          }
                        });
                      },
                      validator: (value) => value == null ? 'Select Status' : null,
                      items: action.map((selectValue) {
                        return DropdownMenuItem<String>(
                          value: selectValue.clLabel,
                          child: Text(
                            selectValue.clLabel ?? "",
                            style: TextStyle(fontSize: 14.sp, color: Colors.black87),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2, // Matching header
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: index < enterDescription.length
                        ? TextFormField(
                            controller: enterDescription[index],
                            decoration: InputDecoration(
                              hintText: "Enter Notes",
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue, width: 1.5),
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
                            style: TextStyle(fontSize: 16.sp, color: Colors.black),
                          )
                        : SizedBox(),
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  ),
),

        ],
      ),
    );
  }
}
