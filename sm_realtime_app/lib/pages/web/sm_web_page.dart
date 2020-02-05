import 'package:flutter/material.dart';
import 'package:ff_annotation_route/ff_annotation_route.dart';
import 'package:sm_realtime_app/widgets/sm_appbar.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

@FFRoute(
  name: 'routes://sm_web_page',
  routeName: 'SMWebPage',
  argumentNames: ["webUrl","title"],
)
class SMWebPage extends StatefulWidget {
  final String webUrl;
  final String title;
  SMWebPage({this.webUrl, this.title});
  @override
  _SMWebPageState createState() => _SMWebPageState();
}

class _SMWebPageState extends State<SMWebPage> {
  double lineProgress = 0.0;
  FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();

  @override
  void initState() {
    super.initState();
    flutterWebviewPlugin.onProgressChanged.listen((progress){
      setState(() {
        lineProgress = progress;
      });
    });
  }

  @override
  void dispose() {
    flutterWebviewPlugin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
        url: widget.webUrl,
      appBar: SMAppBar(
        title: widget.title ?? '',
        bottom: PreferredSize(child: _progressBar(lineProgress, context), preferredSize: Size.fromHeight(3.0)),
      ),
      initialChild: Center(
        child:SpinKitFadingCircle(
          color: Colors.blueAccent,
          size: 30.0,
        ),
      ),
    );
  }

  _progressBar(double progress,BuildContext context) {
    return LinearProgressIndicator(
      backgroundColor: Colors.white70.withOpacity(0),
      value: progress == 1.0 ? 0 : progress,
      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
    );
  }
}