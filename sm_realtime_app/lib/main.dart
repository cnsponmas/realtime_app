import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

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


