import 'package:flutter/material.dart';
import 'package:sm_realtime_app/model/news_model.dart';
import 'package:common_utils/common_utils.dart';

class NewsCardWidget extends StatelessWidget {
  final LabNewsModel labNewsModel;
  NewsCardWidget({this.labNewsModel});
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, "routes://sm_web_page",arguments: {
          "webUrl":labNewsModel.sourceUrl,
          "title" : labNewsModel.infoSource
        });
      },
      child: Container(
        padding: EdgeInsets.only(left: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Stack(
                children: <Widget>[
                  _rightWidget(),
                  _leftWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _iconWidget() {
    return Container(
      width: 20,
      height: 20,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          Center(
            child: ClipOval(
              child: Container(
                height: 20,
                width: 20,
                color: Colors.red[100],
              ),
            ),
          ),
          Center(
            child: ClipOval(
              child: Container(
                height: 11,
                width: 11,
                color: Colors.red[200],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _leftWidget() {
    return Positioned(
      left: 0,
      top: 0,
      bottom: 0,
      width: 30,
      child: Column(
        children: <Widget>[
          _iconWidget(),
          Expanded(child: SeparatorVertical(color: Colors.grey,))
        ],
      ),
    );
  }

  Widget _rightWidget() {
    String dateString = DateUtil.getDateStrByMs(labNewsModel.pubDate);
    return Container(
      padding: EdgeInsets.only(left: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(dateString),
          Container(
            margin: EdgeInsets.only(right: 15, bottom: 15,top: 10),
            padding: EdgeInsets.only(top: 5,right: 5,left: 5,bottom: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey[200]
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(labNewsModel.title, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                Text(labNewsModel.summary, overflow: TextOverflow.ellipsis,maxLines: 100,),
                SizedBox(height: 5,),
                Text('来源：${labNewsModel.infoSource}',),
              ],
            ),
          )
        ],
      ),
    );
  }
}
//  \n时间：${dateString}', style: TextStyle(color: Colors.black54)

class SeparatorVertical extends StatelessWidget {
  final Color color;

  const SeparatorVertical({this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final height = constraints.constrainHeight();
        final dashWidth = 4.0;
        final dashCount = (height / (2 * dashWidth)).floor();

        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: 1,
              height: dashWidth,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.vertical,
        );
      },
    );
  }
}
