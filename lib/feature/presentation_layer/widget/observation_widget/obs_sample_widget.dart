import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:qc_control_app/constatnt/customwidgets/custombutton.dart';
import 'package:qc_control_app/constatnt/customwidgets/customtheme.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/obs_sample_provider.dart';

class ObsSampleWidget extends StatefulWidget {
  const ObsSampleWidget({super.key});

  @override
  State<ObsSampleWidget> createState() => _ObsSampleWidgetState();
}

class _ObsSampleWidgetState extends State<ObsSampleWidget> {
  List<TextEditingController> parameteController = [];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.w),
          child: SingleChildScrollView(
            child: Column(
              
              children: [
                Text(
                  "Observation",
                  style: TextStyle(
                    fontFamily: "Lexend",
                    color: Colors.black87,
                    fontSize: 20.sp,
                  ),
                ),
                SizedBox(height: 10.h),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.4,
                  ),
                  child: Consumer<ObsSampleProvider>(
                      builder: (context, ObsSample, child) {
                    final sample =
                        ObsSample?.obssample?.observationBySampleEntity;

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: sample?.length,
                      itemBuilder: (context, index) {
                        final samplelist = sample?[index];
                        return Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 100.w,
                                  child: Text(
                                    "${samplelist?.iqcIisSampleTag}",
                                    style: TextStyle(
                                      fontFamily: "Lexend",
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 380.w,
                                  height: 60,
                                  child: Column(
                                    children: [   
                                      TextFormField(
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                          contentPadding: EdgeInsets.all(5),
                                          hintText: "Enter Value",
                                          hintStyle: TextStyle(
                                            color: Colors.black38,
                                            fontSize: 16,
                                          ),
                                          labelStyle:
                                              const TextStyle(fontSize: 12),
                                          constraints: BoxConstraints(
                                            maxHeight: 50,
                                            maxWidth: 380,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade200),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade200),
                                          ),
                                        ),
                                        onChanged: (value) {},
                                        onEditingComplete: () {},
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    );
                  }),
                ),
                SizedBox(height: 10.h),
                Container(
                  alignment: Alignment.center,
                  width: 150.w,
                  child: CustomButton(
                    width: ThemeClass.buttonwidth,
                    height: ThemeClass.buttonheight,
                    backgroundColor: ThemeClass.buttonColor,
                    borderRadius:
                        BorderRadius.circular(ThemeClass.butborderradious),
                    onPressed: () {

                    },
                    child: Text(
                      "Save",
                      style: TextStyle(
                        fontFamily: "lexend",
                        fontSize: ThemeClass.buttonTextSize,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
