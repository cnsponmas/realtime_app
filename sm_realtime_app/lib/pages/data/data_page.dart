import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sm_realtime_app/bloc/bloc_header.dart';
import 'package:sm_realtime_app/widgets/sm_chart_widget.dart';
import 'package:sm_realtime_app/widgets/map/map_widget.dart';
import 'package:sm_realtime_app/widgets/title_widget.dart';
import 'package:sm_realtime_app/model/overall_model.dart';
import 'package:common_utils/common_utils.dart';
import 'area_widget.dart';
import 'overseas_widget.dart';

class DataPage extends StatelessWidget {
  RefreshController _refreshController = RefreshController(initialRefresh: true);

  @override
  Widget build(BuildContext context) {
    DataBLoC dataBLoC = BLoCProvider.of<DataBLoC>(context);
    return StreamBuilder<Map>(
      stream: dataBLoC.outDataList,
      builder: (BuildContext context, AsyncSnapshot<Map>snapshot) {
        _refreshController.refreshCompleted();
        Map data = snapshot.data;
        return Container(
//          color: Colors.white,
          child: SmartRefresher(
            enablePullDown: true,
            enablePullUp: false,
            controller: _refreshController,
            header: WaterDropHeader(),
            onRefresh: () {
              dataBLoC.initData();
            },
              child: ListView(
                children: <Widget>[
                  _buildHeader(snapshot.data),
                  _buildMap(data),
                  _buildChart(data, '全国确诊和疑似趋势图', SMChartType.data),
                  _buildChart(data, '全国治愈和死亡趋势图', SMChartType.out),
                  AreaWidget(data: data),
                  OverSeasWidget(data: data,),
                ],
              ),
          ),
        );
      },
    );
  }

  Widget _buildMap(Map data) {
    if(data == null) {
      return Container();
    }
    List list = data['area_data'];
    if(list == null) {
      return Container();
    }
    return MapWidget(models: list,);
  }

  Widget _buildHeader(Map data) {
    if(data == null) {
      return Container();
    }
    OverallModel model = data['last_data'];
    String dateString = DateUtil.getDateStrByMs(model.updateTime,format: DateFormat.ZH_YEAR_MONTH_DAY_HOUR_MINUTE);
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 10),
        child: TitleView('全国疫情汇总',
          subTitle: '截至${dateString}',
          confirmedCount: model.confirmedCount,
          suspectedCount: model.suspectedCount,
          curedCount: model.curedCount,
          deadCount: model.deadCount,
          onTap: (){

        },));
  }

  Widget _buildChart(Map map, String title, SMChartType type) {
    if(map == null) {
      return Container();
    }
    List data = map['chart_data'];
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        Divider(height: 0.5,),
          Container(
              padding: EdgeInsets.only(left: 10,top: 10,bottom: 5),
              child: Text(title,style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold))),
          data == null ? Container(child: Text('错误'),) : Container(
              child:  SMChartWidget(data,type: type,)
          ),
          Divider(height: 0.5,)
        ]
    );
  }





}

