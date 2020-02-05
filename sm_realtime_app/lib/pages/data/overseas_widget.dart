import 'package:flutter/material.dart';
import 'package:sm_realtime_app/model/area_model.dart';
import 'package:sm_realtime_app/widgets/expansion/sm_expansion_tile.dart';

class OverSeasWidget extends StatelessWidget {
  final Map data;
  OverSeasWidget({@required this.data});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildAreaHeader(this.data),
        _buildArea(this.data),
      ],
    );
  }

  Widget _buildAreaHeader(Map map) {
    if(map == null || map['over_data'] == null) {
      return Container();
    }
    return Container(
        padding: EdgeInsets.only(left: 10,top: 10,bottom: 5),
        child: Text('海外疫情数据',style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold)));
  }

  Widget _buildArea(Map map) {
    if(map == null) {
      return Container();
    }
    List data = map['over_data'];
    if(data == null) {
      return Container();
    }
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext content, int index) {
        AreaModel model = data[index];
        return _buildAreaItem(model);
      },
      itemCount: data.length ,
    );
  }

  Widget _buildAreaItem(AreaModel data) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      color: Colors.white,
      child: SMExpansionTile(
        title: Container(
            height: 40,
            child: Row(
              children: <Widget>[
                SizedBox(width: 5,),
                Text(data.provinceName.toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                Expanded(child: Container()),
                _buildContent('${data.confirmedCount.toString()}','确诊'),
                _buildContent('${data.curedCount.toString()}','治愈'),
                _buildContent('${data.deadCount.toString()}','死亡'),
              ],
            )
        ),
        trailing: Container(width: 10,),
        onExpansionChanged: (bool) {

        },
      ),
    );
  }


  Widget _buildContent(String content, String title) {
    return Container(
        padding: EdgeInsets.only(right: 10),
//        width: 60,
        child: Row(
          children: <Widget>[
            Text(title, style: TextStyle(color: Colors.blueGrey),),
            SizedBox(width: 2,),
            Text(content, style: TextStyle(color: Colors.black87,fontSize: 16),)
          ],
        )
    );
  }
}
