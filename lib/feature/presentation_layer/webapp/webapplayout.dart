import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/url_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/widget_mapping_file.dart';

class WebAppLayoutWidget extends StatefulWidget {
  @override
  State<WebAppLayoutWidget> createState() => _WebAppLayoutWidgetState();
}

class _WebAppLayoutWidgetState extends State<WebAppLayoutWidget> {
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
    return Consumer<UrlProvider>(
      builder: (context, urlProvider, child) {
        final url = urlProvider.user; // Get the current URL from the provider


        Widget? homepage=WidgetMappingFile.getwidget(url!);

        // Check if the URL has changed
        // if (currentUrl != url) {
        //   // If URL is different, reload the WebView
        //   currentUrl = url!;
        //   setState(() {
        //     url;
        //   });
        // }

        return homepage ?? Container();
         
      
      },
    );
  }
}
