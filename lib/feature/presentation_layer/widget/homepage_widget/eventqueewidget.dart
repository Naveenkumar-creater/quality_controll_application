import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Eventqueewidget extends StatefulWidget {
  const Eventqueewidget({super.key});

  @override
  State<Eventqueewidget> createState() => _EventqueewidgetState();
}



class _EventqueewidgetState extends State<Eventqueewidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 400.h,
        child: Column(
          children: [
            Container(
              height: 80.h,
              decoration: BoxDecoration(
                color:Color.fromARGB(255, 45, 54, 104),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(5.r),topRight: Radius.circular(5.r))
              ),
              child: Row(
      children: [
        Container(
         alignment: Alignment.center,
          width: 60.w,
          child: Text("S.No", style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Lexend",
                                  fontSize: 18.sp),),
        ),
        Container(
       alignment: Alignment.center,
          width: 150.w,
          child: Text("Event", style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Lexend",
                                  fontSize: 18.sp),),
        ),
        Container(
       alignment: Alignment.center,
          width: 150.w,
          child: Text("Job Id", style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Lexend",
                                  fontSize: 18.sp),),
        ),
        Container(
       alignment: Alignment.center,
          width: 150.w,
          child: Text("Item Ref", style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Lexend",
                                  fontSize: 18.sp),),
        ),
        Container(
       alignment: Alignment.center,
          width: 150.w,
          child: Text("Asset Id", style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Lexend",
                                  fontSize: 18.sp),),
        ),
       
         Container(
       alignment: Alignment.center,
          width: 100.w,
          child: Text("Status", style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Lexend",
                                  fontSize: 18.sp),),
                                  
        ),
          Container(
       alignment: Alignment.center,
          width: 200.w,
          child: Text("Issued Time", style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Lexend",
                                  fontSize: 18.sp),),
        ),
      ],
              ),
            ),
      
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
      decoration: BoxDecoration(
       color: index % 2 == 0
                                ? Colors.grey.shade50
                                : Colors.grey.shade200,
                                 borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5.r),bottomRight: Radius.circular(5.r))
      ),
      
      height: 85.h,
      
      child: Row(
        children: [
           Container(
      
      alignment: Alignment.center,
          width: 60.w,
          child: Text("${index+1}", style: TextStyle(
                                  color: Colors.black54,
                                  fontFamily: "Lexend",
                                  fontSize: 15.sp),),
        ),
        Container(
       alignment: Alignment.center,
          width: 150.w,
          child: Text("Event1", style: TextStyle(
                                  color: Colors.black54,
                                  fontFamily: "Lexend",
                                  fontSize: 15.sp),),
        ),
        Container(
      alignment: Alignment.center,
          width: 150.w,
          child: Text("2001", style: TextStyle(
                                  color: Colors.black54,
                                  fontFamily: "Lexend",
                                  fontSize: 15.sp),),
        ),
        Container(
      alignment: Alignment.center,
          width: 150.w,
          child: Text("SS9691", style: TextStyle(
                                  color: Colors.black54,
                                  fontFamily: "Lexend",
                                  fontSize: 15.sp),),
        ),
        Container(
      alignment: Alignment.center,
          width: 150.w,
          child: Text("120", style: TextStyle(
                                  color: Colors.black54,
                                  fontFamily: "Lexend",
                                  fontSize: 15.sp),),
        ),
       
         Container(
          alignment: Alignment.center,
      
          width: 100.w,
          child: Text("Open", style: TextStyle(
                                  color: Colors.black54,
                                  fontFamily: "Lexend",
                                  fontSize: 15.sp),),
        ),
          Container(
      alignment: Alignment.center,
          width: 200.w,
          child: Text("13/11/24 17:30", style: TextStyle(
                                  color: Colors.black54,
                                  fontFamily: "Lexend",
                          
                                  fontSize: 15.sp),),
        ),
        Container(
          alignment: Alignment.center,
      
          width: 50.w,
          child: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_outlined))
        )
        ],
      ),
      
                  );
                
              },
              ),
            )
          ],
        ),
      ),
    );
  }
}