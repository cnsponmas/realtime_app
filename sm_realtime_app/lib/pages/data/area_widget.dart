import 'package:flutter/material.dart';
import 'package:sm_realtime_app/model/area_model.dart';
import 'package:sm_realtime_app/widgets/expansion/sm_expansion_tile.dart';

class AreaWidget extends StatelessWidget {
  final Map data;
  AreaWidget({@required this.data});
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
    if(map == null || map['area_data'] == null) {
      return Container();
    }
    return Container(
        padding: EdgeInsets.only(left: 10,top: 10,bottom: 5),
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
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: <Widget>[
          SizedBox(width: 25,),
          Text('地区', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
          Expanded(child: Container()),
          Container(
              width: 60,
              child:
              Text('确诊',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold))),
          Container(
            width: 60,
            child: Text('治愈',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,)),),
          Container(
            width: 60,
            child: Text('死亡',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,)),),
        ],
      ),
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
        children: _buildCites(data.cities),
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

  List<Widget> _buildCites(List list) {
    List<Widget> cityCells = List();
    cityCells.add(_buildCityHeader());
    list.forEach((item) {
      Widget cell = _buildCityItem(item);
      cityCells.add(cell);
    });
    return cityCells;
  }

  Widget _buildCityHeader() {
    return Container(
      margin: EdgeInsets.only(left: 10,right: 10, bottom: 10),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: <Widget>[
          Container(
            width: 100,
            child: Center(child: Text('地区', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),)),
          ),
          Container(
            width: 60,
            child: Center(child: Text('确诊', style: TextStyle(color: Colors.yellow[900], fontSize: 16, fontWeight: FontWeight.bold),)),
          ),
          Container(
            width: 60,
            child: Center(child: Text('治愈', style: TextStyle(color: Colors.greenAccent[400], fontSize: 16, fontWeight: FontWeight.bold),)),
          ),
          Container(
            width: 60,
            child: Center(child: Text('死亡', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),)),
          ),
        ],
      ),
    );
  }

  Widget _buildCityItem(CityDataModel model) {
    return Container(
      child: Container(
        margin: EdgeInsets.only(left: 10,right: 10, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Divider(height: 0.3,),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 100,
                  child: Center(child: Text(model.cityName,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15))),
                ),
                Container(
                  width: 50,
//            padding: EdgeInsets.only(left: 20),
                  child: Center(child: Text(model.confirmedCount.toString(),style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15))),
                ),
                Container(
                  width: 50,
//            padding: EdgeInsets.only(left: 20),
                  child: Center(child: Text(model.curedCount.toString(),style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15))),
                ),
                Container(
                  width: 50,
//            padding: EdgeInsets.only(left: 20),
                  child: Center(child: Text(model.deadCount.toString(),style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15))),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }


}
