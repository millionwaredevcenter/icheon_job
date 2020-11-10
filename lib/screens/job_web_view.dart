import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class JobWebView extends StatefulWidget {
  @override
  _JobWebViewState createState() => _JobWebViewState();
}

class _JobWebViewState extends State<JobWebView> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    //if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl:
          "https://www.work.go.kr/empDetailRedirect.do?wantedAuthNo=K151622011090029",
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
