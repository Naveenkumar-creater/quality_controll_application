import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:qc_control_app/feature/presentation_layer/api_service.dart/inspectionparameter_di.dart';
import 'package:qc_control_app/feature/presentation_layer/api_service.dart/obs_sample_di.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/inspectionparameter_provider.dart';

class Inspecparamerertabelwidget extends StatefulWidget {
 
  const Inspecparamerertabelwidget({super.key});

  @override
  State<Inspecparamerertabelwidget> createState() => _InspecparamerertabelwidgetState();
}

class _InspecparamerertabelwidgetState extends State<Inspecparamerertabelwidget> {

InspectionparameterDi inspectionparam=InspectionparameterDi();
 ObsSampleDi obsSampleDi =ObsSampleDi();

// void _obsSample(){
//   showDialog(context: 
//   context, builder: (context){
// return ObsSampleWidget();
//   });
// }

 

  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size.width < 600;
    return 
    size ? const Text(" ") :
    
    SizedBox(
      height: 400.h,
      child: Column(

        children: [
             Row(
              mainAxisAlignment: MainAxisAlignment.start,
            
               children: [
                 Text(
                        "Parameters",
                        
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
               ],
             ),

            const SizedBox(height: 8,),  
          Container(
            height: 80.h,
            decoration: BoxDecoration(
              color:const Color.fromARGB(255, 45, 54, 104),
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
        child: Text("Parameter", style: TextStyle(
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
        child: Text("Evaluvation", style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Lexend",
                                fontSize: 18.sp),),
      ),
      Container(
     alignment: Alignment.center,
        width: 150.w,
        child: Text("Sample Size", style: TextStyle(
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
            child:Consumer<InspectionparameterProvider>(
    builder: (context,inspectionparameter ,child) {
    
      final param = inspectionparameter.inspectionParam?.specificationParameterEntity;
    
              return ListView.builder(
                itemCount: param?.length,
                itemBuilder: (context, index) {
                  final parameter=param?[index];
                  return Container(
                    decoration: BoxDecoration(
                     color: index % 2 == 0
                                ? Colors.grey.shade50
                                : Colors.grey.shade200,
                                 borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5.r),bottomRight: Radius.circular(5.r))
                    ),
                    
                    height: 85.h,
                    
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
                        child: Text("${parameter?.iqcIspParamName}", style: TextStyle(
                                  color: Colors.black54,
                                  fontFamily: "Lexend",
                                  fontSize: 15.sp),),
                      ),
                          Container(
                    alignment: Alignment.center,
                        width: 150.w,
                        child: Text("${parameter?.iqcCmMethodName}", style: TextStyle(
                                  color: Colors.black54,
                                  fontFamily: "Lexend",
                                  fontSize: 15.sp),),
                      ),
                        Container(
                    alignment: Alignment.center,
                        width: 150.w,
                        child: Text("${parameter?.iqcCpeEvalTechnique}",
                        textAlign:TextAlign.center,
                         style: TextStyle(
                                  color: Colors.black54,
                                  fontFamily: "Lexend",
                                  
                                  fontSize: 15.sp),),
                      ),
                      Container(
                    alignment: Alignment.center,
                        width: 150.w,
                        child: Text("${parameter?.iqcIiSampleSize}", style: TextStyle(
                                  color: Colors.black54,
                                  fontFamily: "Lexend",
                                  fontSize: 15.sp),),
                      ),
                       Container(
                        alignment: Alignment.center,
                        width: 150.w,
                        child: Text("${parameter?.iqcIiInspectionStatus}", style: TextStyle(
                                  color: Colors.black54,
                                  fontFamily: "Lexend",
                                  fontSize: 15.sp),),
                      ),
                      Container(
                        alignment: Alignment.center, 
                        width: 150.w,
                        child:const  Text("")

                        //                         CustomButton(
//                                               width: ThemeClass.buttonwidth,
//                                               height: ThemeClass.buttonheight,
//                                               backgroundColor:ThemeClass.buttonColor ,
//                                               borderRadius: BorderRadius.circular(ThemeClass.butborderradious),
//                           onPressed: (){
// obsSampleDi.getSampleList(inspectionid:parameter?.iqcIiId ?? 0 , context: context);
//                       _obsSample();
             
//                         }, 
//                         child: Text("Obs",style: TextStyle(fontFamily: "lexend",fontSize:ThemeClass.buttonTextSize,color: Colors.white)),
//                         )

                      )
                      ],
                    ),
                    
                  );
                
              },
              );
    }
            ),
          )
        ],
      ),
    );
  }
}