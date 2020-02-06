import 'package:flutter/material.dart';
import 'package:sm_realtime_app/model/area_model.dart';
import 'area_item_widget.dart';

class AreaWidget extends StatelessWidget {
  final Map data;
  AreaWidget({@required this.data});
  @override
  Widget build(BuildContext context) {


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildAreaHeader(this.data),
        _buildAreaTitle(),
        _buildArea(this.data),
      ],
    );
  }

  Widget _buildAreaHeader(Map map) {
    if(map == null || map['area_data'] == null) {
      return Container();
    }
    return Container(
        padding: EdgeInsets.only(left: 10,top: 20,bottom: 5),
        child: Text('全国疫情数据',style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold)));
  }

  Widget _buildArea(Map map) {
    if(map == null) {
      return Container();
    }
    List data = map['area_data'];
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

  Widget _buildAreaTitle() {
    if(this.data == null || this.data['area_data'] == null) {
      return Container();
    }
    return Padding(
      padding: const EdgeInsets.only(top: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 2),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  Text(
                    "地区",
                    style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            flex: 1,
          ),
          Padding(
            padding: EdgeInsets.only(left: 2),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  Text(
                    "确诊",
                    style: TextStyle(color: Colors.yellow[900], fontSize: 16, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            flex: 1,
          ),
          Padding(
            padding: EdgeInsets.only(left: 2),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  Text(
                    "治愈",
                    style: TextStyle(color:  Colors.greenAccent[400], fontSize: 16, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            flex: 1,
          ),
          Padding(
            padding: EdgeInsets.only(left: 2),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  Text(
                    "死亡",
                    style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            flex: 1,
          ),
          Padding(
            padding: EdgeInsets.only(left: 2),
          ),
        ],
      ),
    );
  }

  Widget _buildAreaItem(AreaModel data) {
    return AreaItemWidget(model: data);

  }
}
