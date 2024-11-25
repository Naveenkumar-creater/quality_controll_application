import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:qc_control_app/feature/presentation_layer/api_service.dart/process_di.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/login_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/webapp/webappurlwidget.dart';
import 'package:qc_control_app/feature/presentation_layer/widget_mapping_file.dart';

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

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _getProcess();
  }



  Future<void> _getProcess() async {
          final deptId = Provider.of<LoginProvider>(context, listen: false).user?.userLoginEntity?.deptId ?? 0;
      await processApiService.getProcessdetail(context: context, deptid: deptId);
    // Simulate fetching process data
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      isLoading = false;
    });
  }


  //  Future<void>  _getProcess() async {
  //   try {


  //     final processId = Provider.of<ProcessProvider>(context, listen: false).user?.listofProcessEntity?.first?.processId ?? 0;
     

  //     setState(() {
  //       isLoading = false; // Set isLoading to false when data is fetched
  //     });
  //   } catch (e) {
  //     setState(() {
  //       isLoading = false; // Set isLoading to false even if there's an error
  //     });
  //   }
  // }
  String homepagelayout ="homepage";

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<ProcessProvider>(context, listen: true).user;

  

    // final deptid = user?.listofProcessEntity?.first.deptId ?? 1057;
    final shiftgroupId = user?.listofProcessEntity?.first.shiftgroupId ?? 1;

    final deptId = Provider.of<LoginProvider>(context).user?.userLoginEntity?.deptId;

    final Size size = MediaQuery.of(context).size;
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    Widget ? hompage = WidgetMappingFile.getwidget(homepagelayout);

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding:  EdgeInsets.all(8.w),
          child: SafeArea(
            child: isLoading
                ? Center(child: CircularProgressIndicator()) // Show loading indicator while fetching data
                : Container(
                          
                                 
                  child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyDrawer(deptid: deptId),
                            SizedBox(width: 8.w),
                         Expanded(child: WebAppUrlLayoutWidget())
                          ],
                        ),
                      ],
                    ),
                ),
          ),
        ),
      ),
    );
  }
}
