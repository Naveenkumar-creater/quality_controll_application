import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qc_control_app/constatnt/Exception/show_pop_error.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/layout_name_provider.dart';

class LayoutnameDi{

  Future<void>getLayoutname({
 required String  name,
  required BuildContext context}
  )async{

    try {

     return Provider.of<LayoutNameProvider>(context,listen: false).setlayoutName(name);
      
    } catch (e) {
      ShowError.showAlert(context,e.toString());
    }

  }
}