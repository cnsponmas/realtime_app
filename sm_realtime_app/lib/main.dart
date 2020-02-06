import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'app.dart';

import 'package:jaguar/jaguar.dart';
import 'package:jaguar_flutter_asset/jaguar_flutter_asset.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  final server = Jaguar(port: 9000);
  server.addRoute(serveFlutterAssets());
  await server.serve(logRequests: true);

  server.log.onRecord.listen((r) => print(r));

  runApp(App());

  ErrorWidget.builder = (FlutterErrorDetails flutterErrorDetails) {
    debugPrint(flutterErrorDetails.toString());
    return  Center(child:  Text("App错误，快去反馈给作者!"));
  };
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}


