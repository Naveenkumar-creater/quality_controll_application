import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:qc_control_app/constatnt/customwidgets/custombutton.dart';
import 'package:qc_control_app/constatnt/customwidgets/customtheme.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/list_status_provider.dart';
import '../../provider/obsparameter_provider.dart';

class ObsPararmeterWidget extends StatefulWidget {
  const ObsPararmeterWidget({super.key});

  @override
  State<ObsPararmeterWidget> createState() => _ObsPararmeterWidgetState();
}

class _ObsPararmeterWidgetState extends State<ObsPararmeterWidget> {
  List<TextEditingController> controllers = [];
  List<String>? selectedValue;

  // List<String> optionList = ["Passed", "Conditionally Passed", "Failed"];
  String? selectename;

  @override
  void initState() {
    super.initState();
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeControllers();
    });
  }

void _initializeControllers() {
  final sample = Provider.of<ObsparameterProvider>(context, listen: false)
      .obsparam
      ?.observationBySamples;
  if (sample != null) {
    controllers = List.generate(sample.length, (_) => TextEditingController());
    selectedValue = List.generate(sample.length, (_) => ""); // ✅ Use null instead of ""
  }
}
  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
final  optionList = Provider.of<ListStatusProvider>(context , listen:  false).status?.listOfStatusLable;

print(optionList);

    return Padding(
      padding: EdgeInsets.all(16.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
              CustomButton(
                                              width: ThemeClass.buttonwidth,
                                              height: ThemeClass.buttonheight,
                                              backgroundColor:ThemeClass.buttonColor ,
                                              borderRadius: BorderRadius.circular(ThemeClass.butborderradious),
                          onPressed: (){
// obsSampleDi.getSampleList(inspectionid:parameter?.iqcIiId ?? 0 , context: context);
//                       _obsSample();
// getSampledata(sample);

              
              
           
                        }, 
                        child: Text("Save",style: TextStyle(fontFamily: "lexend",fontSize:ThemeClass.buttonTextSize,color: Colors.white)),
                        )
            ],
          ),
          SizedBox(height: 10.h),
             Container(
            height: 80.h,
            decoration: BoxDecoration(
              color:Color.fromARGB(255, 45, 54, 104),
              borderRadius: BorderRadius.circular(5.r)
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                     alignment: Alignment.center,
                      width: 50.w,
                      child: Text("S.No", style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Lexend",
                                  fontSize: 18.sp),),
                    ),
                    Container(
                   alignment: Alignment.center,
                      width: 150.w,
                      child: Text("Parameter", style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Lexend",
                                  fontSize: 18.sp),),
                    ),
                        Container(
                   alignment: Alignment.center,
                      width:200.w,
                      child: Text("Values",
                      textAlign: TextAlign.center,
                       style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Lexend",
                                  fontSize: 18.sp),),
                    ),
                         Container(
                   alignment: Alignment.center,
                      width: 200.w,
                      child: Text("Status", style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Lexend",
                                  fontSize: 18.sp),),
                    ),
                        Container(
                   alignment: Alignment.center,
                      width: 100.w,
                      child: Text("Evaluvation", style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Lexend",
                                  fontSize: 18.sp),),
                    ),
               
                  
                    Container(
                   alignment: Alignment.center,
                      width: 150.w,
                      child: Text("Actual Spec", style: TextStyle(
                                  color: Colors.white,  
                                  fontFamily: "Lexend",
                                  fontSize: 18.sp),),
                    )
                  
                  ],
              ),
            ),
          ),
    
          // Main Content
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

    // Group the list by `specgroup`
    final Map<String, List> groupedSamples = {};
    for (var sampleItem in sample) {
      String groupName = sampleItem.iqcIsgGroupName ?? "Other";
      groupedSamples.putIfAbsent(groupName, () => []).add(sampleItem);

    }

    print(groupedSamples);


    // Ensure controllers match sample length
    if (controllers.length != sample.length) {
      _initializeControllers();
    }

    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: groupedSamples.entries.map((entry) {
        String groupName = entry.key;
        List groupItems = entry.value;

        return ExpansionTile(
          title: Text(
            groupName,  // Group Name as the header
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
          children: groupItems.asMap().entries.map((entry) {
            int index = entry.key;
            var sampleList = entry.value;

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 6,
                      spreadRadius: 2,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 50.w,
                      child: Text(
                        "${index + 1}",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      width: 150.w,
                      child: Text(
                        sampleList.iqcCpsSpecDesc ?? "Parameter ${index + 1}",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 200.w,
                      height: 50.h,
                      child: TextFormField(
                        keyboardType: sampleList.iqcCpsSpecType != 1
                            ? TextInputType.text
                            : TextInputType.number,
                        controller: controllers.isNotEmpty
                            ? controllers[index]
                            : TextEditingController(),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Enter Value",
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.r),
                            borderSide: BorderSide(color: Colors.grey.shade400, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.r),
                            borderSide: BorderSide(color: Colors.black, width: 1),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.r),
                            borderSide: BorderSide(color: Colors.grey.shade400, width: 1),
                          ),
                        ),
                        style: TextStyle(fontSize: 16.sp, color: Colors.black),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 200,
                      height: 50,
                      child: DropdownButtonFormField<String>(
                        value: (selectedValue != null &&
                                selectedValue!.length > index &&
                                optionList?.any((item) => item.clLabel == selectedValue![index]) == true)
                            ? selectedValue![index]
                            : null, // ✅ Only set value if it exists in the list
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.r),
                            borderSide: BorderSide(color: Colors.grey.shade400, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.r),
                            borderSide: BorderSide(color: Colors.black, width: 1),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.r),
                            borderSide: BorderSide(color: Colors.grey.shade400, width: 1),
                          ),
                        ),
                        hint: Text(
                          "Select",
                          style: TextStyle(fontSize: 14.sp, color: Colors.black),
                        ),
                        icon: Icon(Icons.keyboard_arrow_down),
                        isExpanded: true,
                        onChanged: (value) {
                          setState(() {
                            if (value != null && selectedValue!.length > index) {
                              selectedValue![index] = value;
                            }
                          });
                        },
                        items: optionList
                            ?.map((selectvalue) => selectvalue.clLabel)
                            .where((label) => label != null)
                            .toSet()
                            .map((uniqueLabel) => DropdownMenuItem<String>(
                                  value: uniqueLabel,
                                  child: Text(
                                    uniqueLabel!,
                                    style: TextStyle(color: Colors.black87, fontSize: 14.sp),
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 100,
                      child: Text(
                        "Temperature Controller",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 150,
                      child: Text(
                        "${sampleList.iqcCpsRangeFrom}-${sampleList.iqcCpsRangeTo} ",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        );
      }).toList(),
    );
  },
),

        ],
      ),
    );
  }
}
