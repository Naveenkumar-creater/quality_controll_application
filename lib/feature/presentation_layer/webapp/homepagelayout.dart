import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/layout_name_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/widget_mapping_file.dart';

class Homepagelayout extends StatefulWidget {
  @override
  State<Homepagelayout> createState() => _HomepagelayoutState();
}

class _HomepagelayoutState extends State<Homepagelayout> {
   InAppWebViewController? webViewController;
  bool isLoading = true;
 String ?currentUrl; // Store the current URL

  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
    crossPlatform: InAppWebViewOptions(
      javaScriptEnabled: true,
      useShouldOverrideUrlLoading: true,
    ),
  );

 

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<LayoutNameProvider>(
        builder: (context, LayoutNameProvider, child) {
          final url = LayoutNameProvider.name; // Get the current URL from the provider
      
          Widget? homepage=WidgetMappingFile.getwidget(url);
      
          return homepage ?? Container();
           
        
        },
      ),
    );
  }
}
