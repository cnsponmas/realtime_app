import 'package:flutter/material.dart';
import 'sm_realtime_app_route.dart';
import 'sm_realtime_app_route_helper.dart';
import 'widgets/error_widget.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '实时',
        theme: ThemeData(
          indicatorColor: Color(0xff4169e2),
          scaffoldBackgroundColor: Color(0xfff7f7f7),
          hintColor: Colors.grey.withOpacity(0.3),
          splashColor: Colors.transparent,
          canvasColor: Colors.transparent,
        ),
      onGenerateRoute: (RouteSettings settings) {
        var routeResult = getRouteResult(name: settings.name, arguments: settings.arguments);
        settings = FFRouteSettings(
            arguments: settings.arguments,
            name: settings.name,
            isInitialRoute: settings.isInitialRoute,
            routeName: routeResult.routeName,
            showStatusBar: routeResult.showStatusBar
        );
        var page = routeResult.widget ?? SMErrorWidget();
        return MaterialPageRoute(settings: settings, builder: (c) => page);
      },
      navigatorObservers: [
        FFNavigatorObserver(routeChange: (name) {
          print(name);
        }, showStatusBarChange: (bool showStatusBar) {
          if (showStatusBar) {
            SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
            SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
          } else {
            SystemChrome.setEnabledSystemUIOverlays([]);
          }
        })
      ],
      builder: (c, w) {
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true)..init(c);
        var data = MediaQuery.of(c);
        return MediaQuery(
          data: data.copyWith(textScaleFactor: 1.0),
          child: w,
        );
      },
      initialRoute: 'routes://root_page',
    );
  }
}
