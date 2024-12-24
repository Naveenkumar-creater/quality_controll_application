import 'package:flutter/material.dart';

class LayoutNameProvider extends ChangeNotifier{

  String _layoutname ="homepage";

  String get name=>_layoutname;

  void setlayoutName(String name){

   _layoutname=name;
    print("update name");
     notifyListeners();
  }


}