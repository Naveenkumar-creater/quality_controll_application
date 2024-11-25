import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/url_provider.dart';

class WebAppUrlLayoutWidget extends StatefulWidget {
  @override
  State<WebAppUrlLayoutWidget> createState() => _WebAppLayoutWidgetState();
}

class _WebAppLayoutWidgetState extends State<WebAppUrlLayoutWidget> {
   InAppWebViewController ? webViewController;
  bool isLoading = true;
  String? currentUrl; // Store the current URL

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

        // Check if the URL has changed
        if (currentUrl != url) {
          // If URL is different, reload the WebView
          currentUrl = url!;
          webViewController?.loadUrl(urlRequest: URLRequest(url: Uri.parse(url)));
        }

        return Container(
          height: MediaQuery.of(context).size.height * 0.9,
          child: Stack(
            children: [
              // WebView will reload the URL when the URL is different
              InAppWebView(
                initialUrlRequest: URLRequest(
                  url: Uri.parse(url!),
                ),
                initialOptions: options,
                onWebViewCreated: (controller) {
                  webViewController = controller;
                },
                onLoadStart: (controller, url) {
                  setState(() {
                    isLoading = true;
                  });
                  debugPrint("Loading URL: $url");
                },
                onLoadStop: (controller, url) async {
                  setState(() {
                    isLoading = false;
                  });
                  debugPrint("Finished loading: $url");
                },
                onLoadError: (controller, url, code, message) {
                  setState(() {
                    isLoading = false;
                  });
                  debugPrint("Error loading URL: $message");
                },
              ),
              if (isLoading)
                const Center(
                  child: CircularProgressIndicator(),
                ),
            ],
          ),
        );
      },
    );
  }
}
