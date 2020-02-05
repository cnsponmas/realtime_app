import 'package:flutter/material.dart';
import 'package:common_utils/common_utils.dart';

class TitleView extends StatelessWidget {
  final String title;
  final String subTitle;
  final VoidCallback onTap;
  final int confirmedCount;
  final int suspectedCount;
  final int curedCount;
  final int deadCount;

  TitleView(this.title, {this.subTitle = '', this.onTap,
    @required this.confirmedCount, @required this.suspectedCount, @required this.curedCount, @required this.deadCount
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            SizedBox(width: 10,),
            Text(
              '$title',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
            ),
            SizedBox(width: 10,),
            Text(
              '$subTitle',
              style: TextStyle(color: Color.fromRGBO(115, 115, 115, 1.0)),
            ),
            SizedBox(width: 10,),
            GestureDetector(
                child: Icon(Icons.help_outline, color: Colors.grey,size: 18,),
                onTap: this.onTap
            ),

          ],
        ),
        NewsDataWidget(confirmedCount: confirmedCount, suspectedCount: suspectedCount, curedCount: curedCount, deadCount: deadCount,)
      ],
    );
  }
}

class NewsDataWidget extends StatelessWidget {
  final int confirmedCount;
  final int suspectedCount;
  final int curedCount;
  final int deadCount;
  NewsDataWidget({@required this.confirmedCount, @required this.suspectedCount, @required this.curedCount, @required this.deadCount});
  Color strColor(name) {
    switch (name) {
      case '全国确诊':
        return Colors.red;
        break;
      case '疑似病例':
        return Colors.amber;
        break;
      case '治愈人数':
        return Colors.green;
        break;
      case '死亡人数':
        return Colors.grey[850];
        break;
    }
    return Colors.black;
  }

  static TextStyle defStyle =
  TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600);

  @override
  Widget build(BuildContext context) {
    List personInfo = [
      {'label': '全国确诊', 'value': '${confirmedCount}'},
      {'label': '疑似病例', 'value': '${suspectedCount}'},
      {'label': '死亡人数', 'value': '${deadCount}'},
      {'label': '治愈人数', 'value': '${curedCount}'},
    ];

    Widget itemBuild(item) {
      PersonInfoModel model = PersonInfoModel(item);
      return FlatButton(
        onPressed: () {},
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: new SizedBox(
          width: (MediaQuery.of(context).size.width - 20) / 4,
          child: new Column(
            children: <Widget>[
              Text(
                '${model.value}',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                  color: strColor(model.label),
                ),
              ),
              SizedBox(height: 5,),
              Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(5)
                      
                ),
                child: Text(
                  '${model.label}',
                  style: TextStyle(fontSize: 13.0),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: personInfo.map(itemBuild).toList(),
    );
  }


}

class PersonInfoModel {
  String label;
  String value;

  PersonInfoModel(Map value) {
    this.label = value['label'];
    this.value = value['value'];
  }
}

