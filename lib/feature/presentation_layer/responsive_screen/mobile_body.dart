import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:provider/provider.dart';
import 'package:qc_control_app/feature/presentation_layer/api_service.dart/process_di.dart';
import 'package:qc_control_app/feature/presentation_layer/mobile_page.dart/mobile_drawer.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/login_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/process_provider.dart';


class MobileScaffold extends StatefulWidget {
  const MobileScaffold({Key? key}) : super(key: key);

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late Stream<String> current;
  ProcessApiService processApiService = ProcessApiService();

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _getProcess();
  }

  Future<void> _getProcess() async {
    try {
      final deptId = Provider.of<LoginProvider>(context, listen: false)
              .user
              ?.userLoginEntity
              ?.deptId ??
          0;
      await processApiService.getProcessdetail(
          context: context, deptid: deptId);

      final processId = Provider.of<ProcessProvider>(context, listen: false)
              .user
              ?.listofProcessEntity
              ?.first
              ?.processId ??
          0;
     

  

      setState(() {
        isLoading = false; // Set isLoading to false when data is fetched
      });
    } catch (e) {
      setState(() {
        isLoading = false; // Set isLoading to false even if there's an error
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<ProcessProvider>(context, listen: true).user;
 

    

   final deptid = (user?.listofProcessEntity?.isNotEmpty ?? false) ? user!.listofProcessEntity!.first.deptId : 1057;
                      
    final shiftgroupId =  user?.listofProcessEntity?.first?.shiftgroupId ?? 1;

    final Size size = MediaQuery.of(context).size;

    return  isLoading
                ? Scaffold(
                  backgroundColor: Colors.white,
                  body:   Center(child: CircularProgressIndicator()),
                )
                
                
                // Show loading indicator while fetching data
                :
    
    Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      drawer: MobileMyDrawer(),
      appBar: 
      AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        flexibleSpace: Padding(
          padding:
              const EdgeInsets.only(top: 40.0), // Adjust top padding as needed
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
                icon: SvgPicture.asset(
                  'assets/svg/drawer.svg',
                  color: Color.fromARGB(255, 80, 96, 203),
                  width: 36,
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                "",
                style: TextStyle(
                  color: Color.fromARGB(255, 80, 96, 203),
                  fontSize: 24.0,
                  fontFamily: 'Lexend',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                  width: 36), // Placeholder to balance the drawer icon width
            ],
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      
    );
  }
}
