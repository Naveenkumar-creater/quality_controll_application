import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../provider/obsparameter_provider.dart';

class ObsPararmeterWidget extends StatefulWidget {
  const ObsPararmeterWidget({super.key});

  @override
  State<ObsPararmeterWidget> createState() => _ObsPararmeterWidgetState();
}

class _ObsPararmeterWidgetState extends State<ObsPararmeterWidget> {
  List<TextEditingController> controllers = [];
  List<String> selectedValue = [];
  List<String> optionList = ["Passed", "Conditionally Passed", "Failed"];

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
      controllers =
          List.generate(sample.length, (_) => TextEditingController());
      selectedValue = List.generate(sample.length, (_) => "");
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
              ElevatedButton(
                onPressed: () {
                  // Add save functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child: Text(
                  "Save",
                  style: TextStyle(fontSize: 16.sp, color: Colors.white),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
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

              // Ensure controllers match sample length
              if (controllers.length != sample.length) {
                _initializeControllers();
              }

              return ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: sample.length,
                separatorBuilder: (context, index) => Divider(
                  color: Colors.grey.shade300,
                  thickness: 1,
                  height: 30.h,
                ),
                itemBuilder: (context, index) {
                  final sampleList = sample[index];
                  final specType = sampleList.iqcCpsSpecType;

                  return Container(
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
                      children: [
                        // Parameter Description
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: Text(
                              sampleList.iqcCpsSpecDesc ??
                                  "Parameter ${index + 1}",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),

                        // Text Field
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            keyboardType: specType != 1
                                ? TextInputType.text
                                : TextInputType.number,
                            controller: controllers.isNotEmpty
                                ? controllers[index]
                                : TextEditingController(),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey.shade100,
                              hintText: "Enter Value",
                              hintStyle: TextStyle(
                                color: Colors.black38,
                                fontSize: 14.sp,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12.w, vertical: 12.h),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.r),
                                borderSide: BorderSide(
                                    color: Colors.grey.shade400, width: 1),
                              ),
                            ),
                            style: TextStyle(fontSize: 14.sp),
                          ),
                        ),
                        SizedBox(width: 10.w),

                        // Dropdown
                        Expanded(
                          flex: 2,
                          child: DropdownButtonFormField<String>(
                                  value: (selectedValue!=null&&selectedValue.length>index) ? selectedValue[index] :null,
                            decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.r),
                                borderSide: BorderSide(
                                    color: Colors.grey.shade400, width: 1),
                              ),
                            ),
                            hint: Text(
                              "Select",
                              style: TextStyle(fontSize: 14.sp),
                            ),
                            icon: Icon(Icons.keyboard_arrow_down),
                            isExpanded: true,
                            onChanged: (value) {
                              setState(() {
                                if(selectedValue!=null&&selectedValue.length>index){
     selectedValue[index] = value!;
                                }
                           
                              });
                            },
                            items: optionList
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 14.sp),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(width: 10.w),

                        // Spec Range
                        Expanded(
                          flex: 2,
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
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
