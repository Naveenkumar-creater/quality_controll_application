import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:qc_control_app/feature/presentation_layer/api_service.dart/eventquee_di.dart';
import 'package:qc_control_app/feature/presentation_layer/api_service.dart/layoutname_di.dart';
import 'package:qc_control_app/feature/presentation_layer/api_service.dart/login_di.dart';
import 'package:qc_control_app/feature/presentation_layer/api_service.dart/process_di.dart';
import 'package:qc_control_app/feature/presentation_layer/api_service.dart/url_di.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/login_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/process_provider.dart';


class MyDrawer extends StatefulWidget {
  final int? deptid;

  MyDrawer({this.deptid});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  ProcessApiService processApiService = ProcessApiService();
  UrlDi uriString = UrlDi();
  LayoutnameDi layoutname=LayoutnameDi();
  LoginApiService logout = LoginApiService();
  EventqueeDi eventquee=EventqueeDi();

  bool isLoading = false;
  bool isFetching = false;
  DateTime? lastTapTime;
  ScrollController _scrollController = ScrollController();

  // List<String> urilist = [
  //   "homepage",
  //   "homepage1",
  //   "homepage"
  // ];

  // List<String> Socialmedia = [
  //   "Moulding",
  //   "Deflashing",
  //   "Inspection",
  // ];


  //  List<String> urilist = [
  //   "https://www.youtube.com",
  //   "http://192.168.29.14:8081/btecManufacturer_Els/primefaces_manufacture/flutterlayout1.xhtml",
  //   "http://159.69.188.148:8080/btecMaintenance/suja"
  // ];

  // List<String> Socialmedia = [
  //   "Youtube",
  //   "Google",
  //   "Google",
  // ];

  int? _selectedIndex; // State variable to store the selected index

  int statusId=1;

  @override
  void initState() {
    super.initState();
    _getProcess();
  }

  Future<void> _getProcess() async {
    try {
      await processApiService.getProcessdetail(
          context: context, deptid: widget.deptid ?? 0);
          
      setState(() {
        isLoading = true; // Set isLoading to false when data is fetched
      });
    } catch (e) {
      setState(() {
        isLoading = false; // Set isLoading to false even if there's an error
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final processList = Provider.of<ProcessProvider>(context).user?.listofProcessEntity;
    final userName = Provider.of<LoginProvider>(context).user?.userLoginEntity?.loginId;

    return Container(
      height: 780.h,
      width: 252.w,
      child: Drawer(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
        backgroundColor: Color.fromARGB(150, 235, 236, 255),
        child: Column(
          children: [
            Container(
              height: 155.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 30.r,
                          backgroundColor: Color(0xFFF3F4FF),
                          child: Icon(
                            Icons.person,
                            size: 30.r,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello,',
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  color: Color.fromARGB(255, 80, 96, 203),
                                  fontFamily: "Lexend"),
                            ),
                            Text(
                              '${userName ?? "Guest"}',
                              style: TextStyle(
                                  fontSize: 24.sp,
                                  color: Color.fromARGB(255, 80, 96, 203),
                                  fontFamily: "Lexend",
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'PROCESS AREA',
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: "Lexend",
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              width: double.infinity,
              height: 450.h,
              child: Scrollbar(
                controller: _scrollController,
                radius: Radius.circular(5.r),
                thickness: 8,
                thumbVisibility: true,
                child: ListView.builder(
                  controller: _scrollController,
                  padding: EdgeInsets.zero,
                  itemCount: processList?.length,
                  itemBuilder: (context, index) {
                    final process=processList?[index];
                    return GestureDetector(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                        decoration: BoxDecoration(
                          color: _selectedIndex == index
                              ? Colors.blue.withOpacity(0.3)
                              : null,
                        ),
                        child: Text(
                        " ${process?.processName}",
                          style: TextStyle(
                              color: Colors.black54,
                              fontFamily: "Lexend",
                              fontSize: 15.sp),
                        ),
                      ),
                      onTap: () async {
                        setState(() {
                          _selectedIndex = index;
                        });
                      //  final processId = processList?[index].processId ?? 0;
                       
                        try {

                            eventquee.getEventquee(context: context, status:statusId ,processid: process?.processId ?? 0);
                        } catch (e) {
                          print('Error fetching data: $e');
                        }
                      },
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 20.h),
            ListTile(
              leading: SvgPicture.asset(
                'assets/svg/log-out.svg',
                color: Colors.red,
                width: 25.w,
              ),
              title: Text(
                'LOGOUT',
                style: TextStyle(
                    color: Colors.black, fontFamily: "Lexend", fontSize: 16.sp),
              ),
              onTap: () {
                logout.logOutUser(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
