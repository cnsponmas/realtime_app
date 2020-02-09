import 'package:flutter/material.dart';
import 'package:ff_annotation_route/ff_annotation_route.dart';
import '../widgets/tab_bar_widget.dart';
import 'package:sm_realtime_app/bloc/bloc_header.dart';


@FFRoute(name: 'routes://root_page',routeName: 'RootPage')

class RootPage extends StatelessWidget {
  List<SMTabItem> items = <SMTabItem>[
    SMTabItem(
      title: '资讯',
      icon: LoadImage('assets/images/bottom_news.png',false),
      selectIcon: LoadImage('assets/images/bottom_news.png',true),
      page: BLoCProvider(child: HomePage(), bloc: HomeBLoC()),
    ),
    SMTabItem(
      title: '实时疫情',
      icon: LoadImage('assets/images/bottom_data.png',false),
      selectIcon: LoadImage('assets/images/bottom_data.png',true),
      page: BLoCProvider(child: DataPage(), bloc: DataBLoC()),
    ),
    SMTabItem(
      title: '辟谣',
      icon: LoadImage('assets/images/bottom_rumor.png',false),
      selectIcon: LoadImage('assets/images/bottom_rumor.png',true),
      page: BLoCProvider(child: RumorsPage(), bloc: RumorsBLoC()),
    ),
    SMTabItem(
      title: '知识',
      icon: LoadImage('assets/images/bottom_protect.png',false),
      selectIcon: LoadImage('assets/images/bottom_protect.png',true),
      page: ProtectPage(),
    ),
//    SMTabItem(
//      title: '疾病知识',
//      icon: LoadImage('assets/images/bottom_lore.png',false),
//      selectIcon: LoadImage('assets/images/bottom_lore.png',true),
//      page: BLoCProvider(child: HomePage(), bloc: HomeBLoC()),
//    ),
  ];


  @override
  Widget build(BuildContext context) {
    return TabBarWidget(pages: items,currentIndex: 0,);
  }
}

class LoadImage extends StatelessWidget {
  final String img;
  final bool isSelect;

  LoadImage(this.img, [this.isSelect = false]);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.only(bottom: 2.0),
      width: 30.0,
      height: 30.0,
      child: new Image.asset(
        img,
        fit: BoxFit.cover,
        gaplessPlayback: true,
        color: isSelect ? Colors.blue : Colors.grey,
      ),
    );
  }
}
