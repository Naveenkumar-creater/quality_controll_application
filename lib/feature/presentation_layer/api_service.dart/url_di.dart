
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qc_control_app/constant/Exception/show_pop_error.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/url_provider.dart';

class UrlDi {
  Future<void>geturl(
 BuildContext context,
 String url
  )async {

    try {
     return Provider.of<UrlProvider>(context,listen: false).setUser(url);
      
    } catch (e) {
            ShowError.showAlert(context, e.toString());
      rethrow;
    }

  }
  
}