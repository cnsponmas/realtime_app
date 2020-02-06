import 'package:flutter/material.dart';
import 'package:sm_realtime_app/model/area_model.dart';

class AreaItemWidget extends StatefulWidget {
  final AreaModel model;
  AreaItemWidget({@required this.model});
  @override
  _AreaItemWidgetState createState() => _AreaItemWidgetState();
}

class _AreaItemWidgetState extends State<AreaItemWidget> {

  bool isSelect = false;

  @override
  Widget build(BuildContext context) {
    return _buildAreaItem(widget.model);
  }


  Widget _buildAreaItem(AreaModel data) {
    return Container(
      padding: EdgeInsets.only(top: 5),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 2),
              ),
              Expanded(
                child: InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(3),bottomLeft: Radius.circular(3)),
                      color: Colors.teal[300],
                    ),
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            data.cities == null ? Container() :
                            Icon(
                             isSelect ? Icons.arrow_drop_up: Icons.arrow_drop_down,
                              size: 16,
                              color: Colors.white,
                            ),
                            Expanded(
                              child: Text(
                                data.provinceName,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    isSelect = !isSelect;
                    setState(() {
                    });
                  },
                ),
                flex: 1,
              ),
              Padding(
                padding: EdgeInsets.only(left: 2),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: <Widget>[
                      Text(
                        data.confirmedCount.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0),
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
                  color: Colors.white,
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: <Widget>[
                      Text(
                        data.curedCount.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0),
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
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(3), bottomRight: Radius.circular(3))
                  ),

                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: <Widget>[
                      Text(
                        data.deadCount.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0),
                      )
                    ],
                  ),
                ),
                flex: 1,
              ),
              Padding(
                padding: EdgeInsets.only(left: 2),
              ),
            ],),
          Offstage(
            offstage: !isSelect,
            child: Column(
              children: _buildCites(data.cities),
            ),
          )
        ],
      )
    );

  }


  List<Widget> _buildCites(List list) {
    if(list == null) {
      return <Widget>[
        Container(),
      ];
    }
    List<Widget> cityCells = List();
//    cityCells.add(_buildCityHeader());
    list.forEach((item) {
      Widget cell = _buildCityItem(item);
      cityCells.add(cell);
    });
    return cityCells;
  }

  Widget _buildCityHeader() {
    return Container(
//      margin: EdgeInsets.only(left: 10,right: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 2),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Center(child: Text('地区', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),)),
            ),
          ),
          Expanded(
            flex: 1,
              child: Container(
            padding: EdgeInsets.all(8),
            child: Center(child: Text('确诊', style: TextStyle(color: Colors.yellow[900], fontSize: 16, fontWeight: FontWeight.bold),)),
          )),
          Padding(
            padding: EdgeInsets.only(left: 2),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Center(child: Text('治愈', style: TextStyle(color: Colors.greenAccent[400], fontSize: 16, fontWeight: FontWeight.bold),)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 2),
          ),
          Expanded(
            child: Container(
              child: Center(child: Text('死亡', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 2),
          ),
        ],
      ),
    );
  }

  Widget _buildCityItem(CityDataModel model) {
    return Container(
//      margin: EdgeInsets.only(left: 10,right: 10, bottom: 10),
      child: Column(
        children: <Widget>[
          Divider(height: 0.3,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 2),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: Center(child: Text(model.cityName, style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),)),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Center(child: Text(model.confirmedCount.toString(), style: TextStyle(color:  Colors.black, fontSize: 16, fontWeight: FontWeight.bold),)),
                  )),
              Padding(
                padding: EdgeInsets.only(left: 2),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: Center(child: Text(model.curedCount.toString(), style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 2),
              ),
              Expanded(
                child: Container(
                  child: Center(child: Text(model.deadCount.toString(), style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 2),
              ),
            ],
          )
        ],
      ),
    );
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
