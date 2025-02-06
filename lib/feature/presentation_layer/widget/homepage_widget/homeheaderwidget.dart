import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:qc_control_app/constatnt/customwidgets/customtheme.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/eventquee_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/widget/homepage_widget/topheader/currenttimewidget.dart';

class Homeheaderwidget extends StatefulWidget {
  @override
  State<Homeheaderwidget> createState() => _HomeheaderwidgetState();
}

class _HomeheaderwidgetState extends State<Homeheaderwidget> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
       
  }
  @override
  Widget build(BuildContext context) {

    final  processName=  Provider.of<EventqueeProvider>(context, listen: true).event?.eventQueueListEntity?.isNotEmpty ?? false
        ? Provider.of<EventqueeProvider>(context, listen: true).event?.eventQueueListEntity?.first.mpmName ?? "Default"
        : "Default";

        final size=MediaQuery.of(context).size.width<600;

    return Container(
      height: 85.h,
      decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(5.r)) ),

      child:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("${processName}" , style: TextStyle(
                                    fontSize:size ?18.sp: 24.sp,
                                    color: Color.fromARGB(255, 80, 96, 203),
                                    fontFamily: "Lexend",
                                    fontWeight: FontWeight.w500),
                              ),
            Currenttimewidget()
          ],
        ),
      ) ,
    );
  }
}