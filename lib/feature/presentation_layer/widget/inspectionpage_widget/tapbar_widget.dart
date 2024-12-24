import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qc_control_app/constatnt/customwidgets/customtheme.dart';
import 'package:qc_control_app/feature/presentation_layer/widget/inspectionpage_widget/inspecparamerertabelwidget.dart';
import 'package:qc_control_app/feature/presentation_layer/widget/inspectionpage_widget/inspesampletabelwidget%20.dart';
import 'package:qc_control_app/feature/presentation_layer/widget/inspectionpage_widget/searchfieldpage.dart';

class TabBarWidget extends StatefulWidget{
  @override
  _TabBarWidgetState createState() =>_TabBarWidgetState();  
}

class _TabBarWidgetState extends State<TabBarWidget>{
  @override
  Widget build(BuildContext context) {
   return  DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
       
  bottom: PreferredSize(
  preferredSize: Size.fromHeight(-4), // Adjust the height as needed
  child: Container(
    decoration: BoxDecoration(
      color: Colors.white, // Background color for the TabBar
    ),
    child: TabBar(
      labelColor: Color.fromARGB(255, 80, 96, 203)
      ,
      labelStyle: TextStyle(fontWeight: FontWeight.bold ,fontSize: 16), // Text color for the selected tab
      unselectedLabelColor: Colors.black, // Text color for unselected tabs
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(5), // Rounded corners for the selected tab
        color: ThemeClass.backgroundcolor, // Background color for the selected tab
      ),
      labelPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 0), // Adjust padding for proper alignment
      tabs: [
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.transparent, // No color for unselected tab
          ),
          child: Tab(
            text: 'Sample',
          ),
        ),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.transparent, // No color for unselected tab
          ),
          child: Tab(
            text: 'Parameter',
          ),
        ),
      ],
    ),
  

            ),
          ),
        ),
        body:  Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: TabBarView(
            children: [
          InspecSampletabelwidget(),
           Inspecparamerertabelwidget()
            ],
          ),
        ),
      ),
    );
  }
}