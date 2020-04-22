import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(WebviewApp());

class WebviewApp extends StatefulWidget {
  @override
  _WebviewAppState createState() => _WebviewAppState();
}

class _WebviewAppState extends State<WebviewApp> {
  final String _baseUrl = '<BASE URL GOES HERE>';
  final Map<String, String> _headers = {'Key': 'Value'};
  WebViewController webViewCtrl;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: WebView(
          initialUrl: _baseUrl,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            webViewCtrl = webViewController;
            webViewCtrl.loadUrl(_baseUrl, headers: _headers);
          },
          navigationDelegate: (NavigationRequest navRequest) {
            webViewCtrl.loadUrl(navRequest.url, headers: _headers);
          },
        ),
      ),
    );
  }
}
