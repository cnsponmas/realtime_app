import 'package:flutter/material.dart';
import 'map_painter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';
//import '';

class MapWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SMWebView(),
    );
    return Container(
      child: CustomPaint(
        size: Size(300, 300),
        painter: MapPainter(),
      ),
    );
  }
}

class SMWebView extends StatefulWidget {


  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<SMWebView> {

  WebViewController _webViewController;
  String filePath = 'assets/map/index.html';


  @override
  Widget build(BuildContext context) {
    return Container(
      child: WebView(
//        initialUrl: 'https://sponmas.gitee.io/map/',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _webViewController = webViewController;
          _loadHtmlFromAssets();
        },
      ),
      height: 300.0,
    );
  }

  Future<String> _getFile() async {
    return await rootBundle.loadString('assets/map/index.html');
  }

  _loadHtmlFromAssets() async {
    String fileHtmlContents = await rootBundle.loadString(filePath);
    _webViewController.loadUrl(Uri.dataFromString(fileHtmlContents,
        mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }
}

