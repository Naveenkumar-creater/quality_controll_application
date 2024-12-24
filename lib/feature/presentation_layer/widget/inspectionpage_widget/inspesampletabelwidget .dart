import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:qc_control_app/constatnt/customwidgets/custombutton.dart';
import 'package:qc_control_app/constatnt/customwidgets/customtheme.dart';
import 'package:qc_control_app/feature/domain_layer/entity/inspectionsample_entity.dart';
import 'package:qc_control_app/feature/presentation_layer/api_service.dart/inspectionparameter_di.dart';
import 'package:qc_control_app/feature/presentation_layer/api_service.dart/obs_parameter_di.dart';
import 'package:qc_control_app/feature/presentation_layer/layout/obsparameterlayout.dart';
import 'package:qc_control_app/feature/presentation_layer/widget/homepage_widget/topheader/currenttimewidget.dart';
import 'package:qc_control_app/feature/presentation_layer/widget/inspectionpage_widget/obs_sample_widget.dart';

import '../../local_stored_data_model/inpecsamplelocaldata_model.dart';
import '../../provider/inspecSampleLocalData_provider.dart';
import '../../provider/inspectionsample_provider.dart';

class InspecSampletabelwidget extends StatefulWidget {
 
  const InspecSampletabelwidget({super.key});

  @override
  State<InspecSampletabelwidget> createState() => _InspecSampletabelwidgetState();
}

class _InspecSampletabelwidgetState extends State<InspecSampletabelwidget> {

InspectionparameterDi inspectionparam=InspectionparameterDi();
ObsParameterDi obsParameterDi = ObsParameterDi();

void _obsSample(){
  showDialog(context: 
  context, builder: (context){
return ObsSampleWidget();
  });
}


  void getSampledata( ListOfSampleEntity ? sample){

   final sampledata =  InspectionSampleLocalModel(
    imfgpPaId: sample?.imfgpPaId,
iqcIiqIieId:sample?.iqcIiqIieId ,
iqcIiqMaxSampleSize:sample?.iqcIiqMaxSampleSize ,
iqcIiqSampleUomId: sample?.iqcIiqSampleUomId,
iqcIiqStatus: sample?.iqcIiqStatus,
iqcIisSampleTag:sample?.iqcIisSampleTag ,
iqciisId: sample?.iqciisId,  
   );

        Provider.of<InspecsampleLocalDataProvider>(context,listen: false).setSampledata(sampledata);                              
  }

  @override
  Widget build(BuildContext context) {
    return Container(
 
      child: Column(
        children: [
Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Samples",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),

Row(children: [

         Padding(
                    padding:  EdgeInsets.only(left: 16.w,right: 16.0),
                    child: CustomButton(
                      width: ThemeClass.buttonwidth,
                      height: ThemeClass.buttonheight,
                      backgroundColor: ThemeClass.buttonColor,
                      borderRadius:
                          BorderRadius.circular(ThemeClass.butborderradious),
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          fontFamily: "lexend",
                          fontSize: ThemeClass.buttonTextSize,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        // _saveData(sample);
                      },
                    ),
                  )
],)
              
           
                  
                ],
              ),
              SizedBox(height: 10,),
          Container(
            height: 80.h,
            decoration: BoxDecoration(
              color:Color.fromARGB(255, 45, 54, 104),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(5.r),topRight: Radius.circular(5.r))
            ),
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
        child: Text("Samples", style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Lexend",
                                fontSize: 18.sp),),
      ),
        Container(
     alignment: Alignment.center,
        width: 150.w,
        child: Text("Control Method", style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Lexend",
                                fontSize: 18.sp),),
      ),
          Container(
     alignment: Alignment.center,
        width: 150.w,
        child: Text("No of Passed Parameter",
        textAlign: TextAlign.center,
         style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Lexend",
                                fontSize: 18.sp),),
      ),
      Container(
     alignment: Alignment.center,
        width: 150.w,
        child: Text("No of Failed Parameter",
          textAlign: TextAlign.center,
         style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Lexend",
                                fontSize: 18.sp),),
      ),
    
      Container(
     alignment: Alignment.center,
        width: 150.w,
        child: Text("Sample Status", style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Lexend",
                                fontSize: 18.sp),),
      ),
     
        Container(
     alignment: Alignment.center,
        width: 150.w,
        child: Text("Observation", style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Lexend",
                                fontSize: 18.sp),),
      ),
    ],
            ),
          ),
    
          Expanded(
            child:Consumer<InspectionsampleProvider>(
    builder: (context,inspectionSample ,child) {
    
      final sample = inspectionSample.sample?.listOfSamplesEntity;
    
              return ListView.builder(
                itemCount: sample?.length,
                itemBuilder: (context, index) {
                  final sampleList=sample?[index];
                  return Container(
                    decoration: BoxDecoration(
                     color: index % 2 == 0
                                ? Colors.grey.shade50
                                : Colors.grey.shade200,
                                 borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5.r),bottomRight: Radius.circular(5.r))
                    ),
                    
                    height: 80.h,
                    
                    child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Container(
                    
                    alignment: Alignment.center,
                        width: 50.w,
                        child: Text("${index+1}", style: TextStyle(
                                  color: Colors.black54,
                                  fontFamily: "Lexend",
                                  fontSize: 15.sp),),
                      ),
                      Container(
                     alignment: Alignment.centerLeft,
                        width: 150.w,
                        child: Text("${sampleList?.iqcIisSampleTag}", style: TextStyle(
                                  color: Colors.black54,
                                  fontFamily: "Lexend",
                                  fontSize: 15.sp),),
                      ),
                          Container(
                    alignment: Alignment.center,
                        width: 150.w,
                        child: Text("Every Batch", style: TextStyle(
                                  color: Colors.black54,
                                  fontFamily: "Lexend",
                                  fontSize: 15.sp),),
                      ),
                        Container(
                    alignment: Alignment.center,
                        width: 150.w,
                        child: Text("${sampleList?.iqcIiqMaxSampleSize}", style: TextStyle(
                                  color: Colors.black54,
                                  fontFamily: "Lexend",
                                  fontSize: 15.sp),),
                      ),
                      Container(
                    alignment: Alignment.center,
                        width: 150.w,
                        child: Text("${sampleList?.iqcIiqMaxSampleSize}", style: TextStyle(
                                  color: Colors.black54,
                                  fontFamily: "Lexend",
                                  fontSize: 15.sp),),
                      ),
                       Container(
                        alignment: Alignment.center,
                        width: 150.w,
                        child: Text("Failed", style: TextStyle(
                                  color: Colors.black54,
                                  fontFamily: "Lexend",
                                  fontSize: 15.sp),),
                      ),
                      Container(
                        alignment: Alignment.center, 
                        width: 150.w,
                        child: CustomButton(
                                              width: ThemeClass.buttonwidth,
                                              height: ThemeClass.buttonheight,
                                              backgroundColor:ThemeClass.buttonColor ,
                                              borderRadius: BorderRadius.circular(ThemeClass.butborderradious),
                          onPressed: (){
// obsSampleDi.getSampleList(inspectionid:parameter?.iqcIiId ?? 0 , context: context);
//                       _obsSample();
// getSampledata(sample);

getSampledata(sampleList); 
obsParameterDi.getParameterList(context: context, inspectionid: sampleList?.iqciisId ?? 0);
        Navigator.push(context,MaterialPageRoute(builder: (context) {
              return  Obsparameterlayout();
              },)
              
              
              );
             
                        }, 
                        child: Text("Record",style: TextStyle(fontFamily: "lexend",fontSize:ThemeClass.buttonTextSize,color: Colors.white)),
                        )
                      )
                      ],
                    ),
                    
                  );
                
              },
              );
    }
            ),
          ),

         
        ],
      ),
    );
  }
}