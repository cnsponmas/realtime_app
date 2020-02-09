import 'package:flutter/material.dart';
import 'package:sm_realtime_app/bloc/bloc_header.dart';

class ProtectPage extends StatefulWidget {
  @override
  _ProtectPageState createState() => _ProtectPageState();
}

class _ProtectPageState extends State<ProtectPage> with SingleTickerProviderStateMixin,AutomaticKeepAliveClientMixin {

  TabController _mController;

  List<String> tabTitles = ['个人防护','知识百科'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TabBar(
            isScrollable: true,
            controller: _mController,
            labelStyle: TextStyle(fontSize: 15,),
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: tabTitles.map((item) {
              return Tab(
                  text: item);
            }).toList()),
        Expanded(
          child: TabBarView(
              controller: _mController,
              children: <Widget>[
                BLoCProvider(child: ProtectView(), bloc: ProtectBLoC()),
                BLoCProvider(child: WikiView(), bloc: WikiBLoC()),
              ]),
        )
      ],
    );
  }

  @override
  void initState() {
    _mController = TabController(length: tabTitles.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
     _mController?.dispose();
    super.dispose();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

