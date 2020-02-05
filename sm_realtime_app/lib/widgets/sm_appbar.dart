import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SMAppBar extends StatelessWidget implements PreferredSizeWidget{

  final String title;
  final bool showShadow;
  final List<Widget> rightDMActions;
  final Color backgroundColor;
  final Color mainColor;
  final Widget titleW;
  final Widget leadingW;
  final PreferredSizeWidget bottom;
  final String leadingImg;

  SMAppBar({
    this.title = '',
    this.showShadow = false,
    this.rightDMActions,
    this.backgroundColor = const Color(0xff4169e2),
    this.mainColor = Colors.white,
    this.titleW,
    this.bottom,
    this.leadingImg = '',
    this.leadingW,
  });

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(100, 50);

  @override
  Widget build(BuildContext context) {
    return showShadow ? Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Colors.grey, width: showShadow ? 0.5 : 0.0)
          )
      ),
      child: AppBar(
        title: titleW == null?
        Text(
          title,
          style: TextStyle(
              color: mainColor,
              fontSize: 17.0,
              fontWeight: FontWeight.w500),
        )
            : titleW,
        backgroundColor: mainColor,
        elevation: 0.0,
        brightness: Brightness.dark,
        leading: leadingW ?? leading(context),
        centerTitle: true,
        actions: rightDMActions ?? [ Center()],
        bottom: bottom != null ? bottom : null,
      ),
    )
        :  AppBar(
      title: titleW == null
          ?  Text(
        title,
        style:  TextStyle(
            color: mainColor,
            fontSize: 17.0,
            fontWeight: FontWeight.w500),
      )
          : titleW,
      backgroundColor: backgroundColor,
      elevation: 0.0,
      brightness: Brightness.dark,
      leading: leadingW ?? leading(context),
      centerTitle: true,
      bottom: bottom != null ? bottom : null,
      actions: rightDMActions ?? [ Center()],
    );
  }

  Widget leading(BuildContext context) {
    final bool isShow = Navigator.canPop(context);
    if (isShow) {
      return  InkWell(
        child:  Container(
          width: 15,
          height: 28,
          child: leadingImg != ''
              ?  Image.asset(leadingImg)
              :  Icon(CupertinoIcons.back, color: mainColor),
        ),
        onTap: () {
          if (Navigator.canPop(context)) {
            FocusScope.of(context).requestFocus( FocusNode());
            Navigator.pop(context);
          }
        },
      );
    } else {
      return null;
    }
  }
}
