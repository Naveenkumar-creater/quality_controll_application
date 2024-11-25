import 'package:flutter/material.dart';
import 'package:qc_control_app/feature/presentation_layer/layout/homepage1layout.dart';
import 'package:qc_control_app/feature/presentation_layer/layout/hompagelayout.dart';
import 'package:qc_control_app/feature/presentation_layer/layout/hompagelayout3.dart';
import 'package:qc_control_app/feature/presentation_layer/pages/home_page.dart';
import 'package:qc_control_app/feature/presentation_layer/widget/Boxwidgets/box1.dart';
import 'package:qc_control_app/feature/presentation_layer/widget/Boxwidgets/box2.dart';
import 'package:qc_control_app/feature/presentation_layer/widget/Boxwidgets/box3.dart';
import 'package:qc_control_app/feature/presentation_layer/widget/Boxwidgets/box4.dart';
import 'package:qc_control_app/feature/presentation_layer/widget/layoutwidget/boxwidget.dart';
import 'package:qc_control_app/feature/presentation_layer/widget/homepage_widget/eventqueewidget.dart';
import 'package:qc_control_app/feature/presentation_layer/widget/layoutwidget/topheaderwidget.dart';

class WidgetMappingFile{


  static Map<String, Widget Function()> widgetMap={
   "event":() => Eventqueewidget(),
   "text":()=>Text("Hello world"),
   "container": () =>Boxwidget(child: Container(decoration: BoxDecoration(color: Colors.orange),)),
   "box1":() =>Box1(),
    "box2":() =>Box2(),
    "box3":() =>Box3(),
    "box4":() =>Box4(),
    "homepage":()=>Hompagelayout(),
    "homepage1":()=>Hompage1layout(),
    "homepage3": () => Hompagelayout3()
    
  };


 static Widget ?getwidget (String name){
    return widgetMap[name]?.call();
  }
}