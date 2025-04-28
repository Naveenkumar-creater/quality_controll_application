import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:qc_control_app/feature/presentation_layer/api_service.dart/eventquee_di.dart';
import 'package:qc_control_app/feature/presentation_layer/api_service.dart/process_di.dart';
import 'package:qc_control_app/feature/presentation_layer/layout/hompagelayout.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/login_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/widget_mapping_file.dart';

import '../provider/eventquee_provider.dart';
import '../provider/process_provider.dart';

import '../widget/homepage_widget/mydrawer.dart';



class ResponsiveTabletHomepage extends StatefulWidget {
  const ResponsiveTabletHomepage({Key? key}) : super(key: key);
  @override
  State<ResponsiveTabletHomepage> createState() => _ResponsiveTabletHomepageState();
}

class _ResponsiveTabletHomepageState extends State<ResponsiveTabletHomepage> {
  late Stream<String> current;
  ProcessApiService processApiService = ProcessApiService();
  EventqueeDi eventquee=EventqueeDi();

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _getProcess();
  }



  Future<void> _getProcess() async {

    try {
             final deptId = Provider.of<LoginProvider>(context, listen: false).user?.userLoginEntity?.deptId ?? 0;
      await processApiService.getProcessdetail(context: context,);

    int statusid=1;

   final processId = Provider.of<ProcessProvider>(context, listen: false).user?.listofProcessEntity?.first?.mpmId ?? 0;
      await  eventquee.getEventquee(context: context, status:statusid, processid: processId);
     

    setState(() {
      isLoading = false;
    });
      
    } catch (e) {
       setState(() {
        isLoading = false; // Set isLoading to false even if there's an error
      });
      
    }
   
  }

  String homepagelayout ="homepage";

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<ProcessProvider>(context, listen: true).user;

  
        final  processName=  Provider.of<EventqueeProvider>(context, listen:false).event?.eventQueueListEntity.isNotEmpty ?? false
        ? Provider.of<EventqueeProvider>(context, listen: false).event?.eventQueueListEntity.first.mpmName ?? "Default"
        : "Default";
    // // final deptid = user?.listofProcessEntity?.first.deptId ?? 1057;
    // final shiftgroupId = user?.listofProcessEntity?.first.shiftgroupId ?? 1;


    final Size size = MediaQuery.of(context).size;
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    Widget ? hompage = WidgetMappingFile.getwidget(homepagelayout);

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: 
      
      Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding:  EdgeInsets.all(8.w),
          child: isLoading
              ? Center(child: CircularProgressIndicator()) // Show loading indicator while fetching data
              : SingleChildScrollView(
                child: Container(
                              width: double.infinity,
    height: MediaQuery.of(context).size.height, 
                                 
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyDrawer(),
                      SizedBox(width: 8.w),
                    processName == "Default" ? Expanded(
                                     
                      child: Center( // This will center within the remaining space
                  child: Text(
                    "No Records Found",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[700],
                    ),
                  ),
                )
                    ):
                     const Hompagelayout()
                    ],
                  ),
                ),
              ),
        ),
      ),
    );
  }
}
