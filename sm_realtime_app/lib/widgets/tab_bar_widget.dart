import 'package:flutter/material.dart';
import 'sm_appbar.dart';
import 'dart:io';



class TabBarWidget extends StatefulWidget {
  final List<SMTabItem> pages;
  final int currentIndex;

  TabBarWidget({this.pages, this.currentIndex = 0});

  @override
  _TabBarWidgetState createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> with AutomaticKeepAliveClientMixin{

  var pages = List<BottomNavigationBarItem>();
  int currentIndex;
  var contents = List<Offstage>();
  PageController pageController;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
    pageController = PageController(initialPage: currentIndex);
    for(int i=0;i<widget.pages.length;i++){
      SMTabItem smTabItem = widget.pages[i];
      pages.add(
          BottomNavigationBarItem(
              icon: smTabItem.icon,
              activeIcon: smTabItem.selectIcon,
              title: Text(smTabItem.title, style: TextStyle(fontSize: 12),))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar bottomNavigationBar = BottomNavigationBar(
      items: pages,
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      unselectedItemColor: Color.fromRGBO(115, 115, 115, 1.0),
      fixedColor: Colors.blue,
      onTap: (index){
        setState(() {
          currentIndex = index;
        });
        pageController.jumpToPage(currentIndex);
      },
      unselectedFontSize: 18.0,
      selectedFontSize: 18.0,
      elevation: 0,
    );
    return Scaffold(
      bottomNavigationBar: Theme(
          data: ThemeData(
            canvasColor: Colors.grey[50],
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
          ),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.grey,
                  width: 0.2
                )
              ),
            ),
            child: bottomNavigationBar,
          ),
      ),
      appBar: SMAppBar(
        titleW: AnimatedSwitcher(duration: Duration(milliseconds: 400),
          transitionBuilder: (Widget child, Animation<double> animation){
            var tween = Tween<double>(begin: 0, end: 1);
            return FadeTransition(
              child: child,
              opacity: tween.animate(animation),
            );
          },
          child: Text(widget.pages[currentIndex].title, key: ValueKey(widget.pages[currentIndex].title ?? ''),),
        ),
      ),
      body: ScrollConfiguration(
          behavior: SMBehavior(),
          child: PageView.builder(itemBuilder: (BuildContext context, int index) {
            return widget.pages[index].page;
          },
            controller: pageController,
            itemCount: pages.length,
            physics: Platform.isAndroid ? ClampingScrollPhysics() : NeverScrollableScrollPhysics(),
            onPageChanged: (int index) {
            setState(() {
              currentIndex = index;
            });
            },
          ),

      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class SMTabItem {
  const SMTabItem({this.title, this.page, this.icon, this.selectIcon});

  final String title;
  final Widget icon;
  final Widget selectIcon;
  final Widget page;
}

class SMBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    if (Platform.isAndroid || Platform.isFuchsia) {
      return child;
    } else {
      return super.buildViewportChrome(context, child, axisDirection);
    }
  }
}
