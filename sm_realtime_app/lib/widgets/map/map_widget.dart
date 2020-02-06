import 'package:flutter/material.dart';
import 'map_painter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:convert';
import 'package:sm_realtime_app/model/area_model.dart';
//import '';

class MapWidget extends StatelessWidget {
  final List<AreaModel> models;
  MapWidget({@required this.models});
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SMWebView(models:this.models),
    );

  }
}

class SMWebView extends StatefulWidget {
  List<AreaModel> models;
  SMWebView({@required this.models});

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
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _webViewController = webViewController;
          _loadHtmlFromAssets();
        },
      ),
      height: 300.0,
    );
  }


  _loadHtmlFromAssets() async {
    var js = _modelsToJs(widget.models);
    String jsString = json.encode(js);

    String fileHtmlContents = await rootBundle.loadString(filePath);
    fileHtmlContents = fileHtmlContents.replaceAll('var mapData = {};', 'var mapData = ${jsString};');
    _webViewController.loadUrl(Uri.dataFromString(fileHtmlContents,
        mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }

  _htmString() async {
    var js = _modelsToJs(widget.models);
    String jsString = json.encode(js);
    String fileHtmlContents = await rootBundle.loadString(filePath);
    fileHtmlContents = fileHtmlContents.replaceAll('var mapData = {};', 'var mapData = ${jsString};');
    return Uri.dataFromString(fileHtmlContents,
    mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
    .toString();
  }

  _modelsToJs(List<AreaModel> list) {
    Map result = Map();
//    List result = List();
    list.forEach((item) {
      AreaModel tmp_item = item;
      Map tmp = tmp_item.toJson();
      tmp.remove('cities');
      result[tmp_item.provinceShortName] = tmp;
    });

    return result;
  }
}

