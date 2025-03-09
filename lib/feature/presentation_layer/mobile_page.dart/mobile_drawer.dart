import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:qc_control_app/feature/presentation_layer/api_service.dart/login_di.dart';
import 'package:qc_control_app/feature/presentation_layer/api_service.dart/process_di.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/login_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/process_provider.dart';
import 'package:provider/provider.dart';


class MobileMyDrawer extends StatefulWidget {

  static late String? processName;

  const MobileMyDrawer({super.key});

  @override
  State<MobileMyDrawer> createState() => _MobileMyDrawerState();
}

class _MobileMyDrawerState extends State<MobileMyDrawer> {
  ProcessApiService processApiService = ProcessApiService();

  LoginApiService logout = LoginApiService();


  bool isLoading = false;
  bool isFetching = false;
  DateTime? lastTapTime;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    getProcess();
  }

  Future<void> getProcess() async {
    try {
      await processApiService.getProcessdetail(
        context: context,
   
      );
      setState(() {
        isLoading = true; // Set isLoading to false when data is fetched
      });
    } catch (e) {
      setState(() {
        isLoading = false; // Set isLoading to false even if there's an error
      });
    }
  }

  int? _selectedIndex; // State variable to store the selected index
  @override
  Widget build(BuildContext context) {

    DateTime now = DateTime.now();
    String toDate = DateFormat('dd-MM-yyyy').format(now);
    String toTime = DateFormat('HH:mm:ss').format(now);

    final processList =
        Provider.of<ProcessProvider>(context).user?.listofProcessEntity;
    final userName =
        Provider.of<LoginProvider>(context).user?.userLoginEntity?.loginId;

    return Drawer(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      backgroundColor: Colors.white,
      elevation: 0,
      width: 250.w,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 70.h, left: 10.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30.r, // Adjust the radius as needed
                        backgroundColor:const  Color.fromARGB(
                            255, 80, 96, 203), // Background color
                        child: const  Icon(
                          Icons.person, // Profile icon
                          size: 30, // Icon size
                          color: Colors.white, // Icon color
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello,',
                            style: TextStyle(
                                fontSize: 14.w,
                                color:const  Color.fromARGB(255, 80, 96, 203),
                                fontFamily: "Lexend"),
                          ),
                          Text(
                            '${userName}',  
                            style: TextStyle(
                                fontSize: 20.w,
                                color: const Color.fromARGB(255, 80, 96, 203),
                                fontFamily: "Lexend",
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            const ListTile(
              title:  Text(
                'PROCESS AREA ',
                style:  TextStyle(
                    fontSize: 16, color: Colors.black, fontFamily: "Lexend"),
              ),
            ),
            Container(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              width: double.infinity,
              height: 450.h,
              child: Scrollbar(
                controller: _scrollController,

                radius: const Radius.circular(8),
                thickness: 8.w,
                thumbVisibility: true,
                child: ListView.builder(
                    controller: _scrollController,
                    padding: EdgeInsets.zero,
                    itemCount: processList?.length ?? 0,
                    itemBuilder: (context, index) => GestureDetector(
                          child: Container(
                            padding:
                                const EdgeInsets.only(bottom: 12, top: 12, left: 16),
                            decoration: BoxDecoration(
                              color: _selectedIndex == index
                                  ? const Color.fromARGB(110, 163, 173, 236)
                                  : null,
                            ), // Set unique background color for selected tile
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  processList![index].mpmName ?? "",
                                  style: const TextStyle(
                                      color: Colors.black54,
                                      fontFamily: "Lexend"),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                _selectedIndex != index
                                    ? Container(
                                        width: double.infinity,
                                        height: 1.h,
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade100),
                                      )
                                    : Container(
                                        width: double.infinity,
                                        height: 0,
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade100),
                                      )
                              ],
                            ),
                          ),
                          onTap: () async {
                            setState(() {
                              _selectedIndex = index;
                              // Update selected index
                            });
                            final processId = processList[index].mpmId ?? 0;
                            // final deptId = processList[index].deptId ?? 0;
                            try {
                    
                  
                              Navigator.pop(context);
                            } catch (e) {
                              // Handle any errors that occur during the async operations
                              print('Error fetching data: $e');
                            }
                          },
                        )),
              ),
            ),
            SizedBox(
              height: 30.h
            ),
            ListTile(
              leading: SvgPicture.asset(
                'assets/svg/log-out.svg',
                color: Colors.red,
                width: 25.w,
              ),
              title: Text(
                'LOGOUT',
                style:  TextStyle(
                    fontSize: 16.sp, color: Colors.black, fontFamily: "Lexend"),
              ),
              onTap: () {
                logout.logOutUser(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
