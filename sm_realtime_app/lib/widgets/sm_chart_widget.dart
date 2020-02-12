import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:sm_realtime_app/model/overall_model.dart';
import 'package:common_utils/common_utils.dart';

enum SMChartType {
  data,
  out,
}

class SMChartWidget extends StatelessWidget {
  final List list;
  final SMChartType type;
  SMChartWidget(this.list,{this.type = SMChartType.data});
  @override
  Widget build(BuildContext context) {
    List<ChartDataModel> confirmedList = buildLineSeries(this.list);

    return Container(
      color:Colors.white,
      child: SfCartesianChart(
        plotAreaBorderWidth: 0,
        legend:  Legend(
            isVisible: true,
            position: LegendPosition.bottom),
        primaryXAxis: CategoryAxis(
            majorGridLines: MajorGridLines(width: 0),
            labelPlacement: LabelPlacement.onTicks),
        series: buildSeries(this.type, confirmedList),
//      <ChartSeries<ChartDataModel, String>>[
//        LineSeries<ChartDataModel, String>(
//          dataSource: confirmedList,
//          xValueMapper: (ChartDataModel sales, _) => sales.day,
//          yValueMapper: (ChartDataModel sales, _) => sales.num,
//          dataLabelSettings: DataLabelSettings(isVisible: true),
//          name: '确诊',
//          color: confirmedList[0].pointColor,
//          enableTooltip: true,
//          markerSettings: MarkerSettings(isVisible: true),
//          pointColorMapper: (ChartDataModel sales, _) => sales.pointColor,
//        ),
//        LineSeries<ChartDataModel, String>(
//          dataSource: confirmedList,
//          xValueMapper: (ChartDataModel sales, _) => sales.day,
//          yValueMapper: (ChartDataModel sales, _) => sales.suspectedCount,
//          dataLabelSettings: DataLabelSettings(isVisible: true),
//          name: '疑似',
//          color: confirmedList[0].suspectedColor,
//          enableTooltip: true,
//          markerSettings: MarkerSettings(isVisible: true),
//          pointColorMapper: (ChartDataModel sales, _) => sales.suspectedColor,
//        ),
//        LineSeries<ChartDataModel, String>(
//          dataSource: confirmedList,
//          xValueMapper: (ChartDataModel sales, _) => sales.day,
//          yValueMapper: (ChartDataModel sales, _) => sales.curedCount,
//          dataLabelSettings: DataLabelSettings(isVisible: true),
//          name: '治愈',
//          color: confirmedList[0].curedColor,
//          enableTooltip: true,
//          markerSettings: MarkerSettings(isVisible: true),
//          pointColorMapper: (ChartDataModel sales, _) => sales.curedColor,
//        ),
//        LineSeries<ChartDataModel, String>(
//          dataSource: confirmedList,
//          xValueMapper: (ChartDataModel sales, _) => sales.day,
//          yValueMapper: (ChartDataModel sales, _) => sales.deadCount,
//          dataLabelSettings: DataLabelSettings(isVisible: true),
//          name: '死亡',
//          color: confirmedList[0].deadColor,
//          enableTooltip: true,
//          markerSettings: MarkerSettings(isVisible: true),
//          pointColorMapper: (ChartDataModel sales, _) => sales.deadColor,
//        ),
//
//      ],
        tooltipBehavior: TooltipBehavior(enable: true),

      ),
    );

  }

  buildLineSeries(List list) {
    if(list == null) {
      list = List();
    }
    List<ChartDataModel> chartDatas = List();
    Map<String, dynamic> datas = Map();
    Map<String, dynamic> suspected = Map();
    Map<String, dynamic> curedCount = Map();
    Map<String, dynamic> deadCount = Map();
    list.forEach((item){
      if(item is OverallModel) {
        String dateString = DateUtil.formatDateMs(item.updateTime,format: 'M/d');
        datas[dateString] = item.confirmedCount.toDouble();

        if(item.confirmedCount == 0 && item.countRemark.length > 0) {
          Map count = getNumWithString(item.countRemark);
          datas[dateString] = count['confirmedCount'];
        }
        suspected[dateString] = item.suspectedCount.toDouble();
        if(item.suspectedCount == 0 && item.countRemark.length > 0) {
          Map count = getNumWithString(item.countRemark);
          suspected[dateString] = count['suspectedCount'];
        }
        curedCount[dateString] = item.curedCount.toDouble();
        if(item.curedCount == 0 && item.countRemark.length > 0) {
          Map count = getNumWithString(item.countRemark);
          curedCount[dateString] = count['curedCount'];
        }
        deadCount[dateString] = item.deadCount.toDouble();
        if(item.deadCount == 0 && item.countRemark.length > 0) {
          Map count = getNumWithString(item.countRemark);
          deadCount[dateString] = count['deadCount'];
        }
      }
    });
    datas.keys.forEach((item) {
      ChartDataModel model =  ChartDataModel(
        day: '${item}',
        num: datas[item],
        pointColor: Colors.yellow[800],
        suspectedColor: Colors.blue,
        suspectedCount: suspected[item],
        deadColor: Colors.redAccent,
        deadCount: deadCount[item],
        curedColor: Colors.green,
        curedCount: curedCount[item],
      );
      chartDatas.add(model);
//      if(model.num != 0 || model.suspectedCount != 0 || model.curedCount != 0 || model.deadCount != 0) {
//        chartDatas.add(model);
//      }
    });
    return chartDatas;
  }
  buildSeries(SMChartType type, List datas) {

    List<ChartSeries<ChartDataModel, String>> list = List();
    if(type == SMChartType.data) {
      list.add(LineSeries<ChartDataModel, String>(
        dataSource: datas,
        xValueMapper: (ChartDataModel sales, _) => sales.day,
        yValueMapper: (ChartDataModel sales, _) => sales.num,
        dataLabelSettings: DataLabelSettings(isVisible: true),
        name: '确诊',
        color: datas[0].pointColor,
        enableTooltip: true,
        markerSettings: MarkerSettings(isVisible: true),
        pointColorMapper: (ChartDataModel sales, _) => sales.pointColor,
      ));
      list.add(LineSeries<ChartDataModel, String>(
        dataSource: datas,
        xValueMapper: (ChartDataModel sales, _) => sales.day,
        yValueMapper: (ChartDataModel sales, _) => sales.suspectedCount,
        dataLabelSettings: DataLabelSettings(isVisible: true),
        name: '疑似',
        color: datas[0].suspectedColor,
        enableTooltip: true,
        markerSettings: MarkerSettings(isVisible: true),
        pointColorMapper: (ChartDataModel sales, _) => sales.suspectedColor,
      ));
    }else {
      list.add(LineSeries<ChartDataModel, String>(
        dataSource: datas,
        xValueMapper: (ChartDataModel sales, _) => sales.day,
        yValueMapper: (ChartDataModel sales, _) => sales.curedCount,
        dataLabelSettings: DataLabelSettings(isVisible: true),
        name: '治愈',
        color: datas[0].curedColor,
        enableTooltip: true,
        markerSettings: MarkerSettings(isVisible: true),
        pointColorMapper: (ChartDataModel sales, _) => sales.curedColor,
      ));
      list.add(
          LineSeries<ChartDataModel, String>(
            dataSource: datas,
            xValueMapper: (ChartDataModel sales, _) => sales.day,
            yValueMapper: (ChartDataModel sales, _) => sales.deadCount,
            dataLabelSettings: DataLabelSettings(isVisible: true),
            name: '死亡',
            color: datas[0].deadColor,
            enableTooltip: true,
            markerSettings: MarkerSettings(isVisible: true),
            pointColorMapper: (ChartDataModel sales, _) => sales.deadColor,
          )
      );
    }
    return list;

  }
}

class ChartDataModel {
  ChartDataModel({this.day, this.num,this.pointColor, this.suspectedCount, this.suspectedColor, this.deadCount, this.deadColor, this.curedCount,this.curedColor});
  final String day;
  final double num;
  final double suspectedCount;
  final Color suspectedColor;
  final double deadCount;
  final Color deadColor;
  final double curedCount;
  final Color curedColor;
  final Color pointColor;
}

getNumWithString(String string) {
  if(string.length == 0) {
    return Map();
  }
  if(!string.endsWith('例')) {
    string = string + '例';
  }
  string = string.replaceAll('，', '');
  string = string.replaceAll('\n', '');
  Map<String, double> count = Map();
  if(string.startsWith('全国确诊')) {
    int range = string.indexOf('例');
    String tmm = string.substring(4,range);
    count['confirmedCount'] = double.parse(tmm);
    string = string.replaceAll('全国确诊${tmm}例', '');
  }
  if(string.startsWith('确诊')) {
    int range = string.indexOf('例');
    String tmm = string.substring(2,range);
    count['confirmedCount'] = double.parse(tmm);
    string = string.replaceAll('确诊${tmm}例', '');
  }

  if(string.startsWith('疑似')) {
    int range = string.indexOf('例');
    String tmm = string.substring(2,range);
    count['suspectedCount'] = double.parse(tmm);
    string = string.replaceAll('疑似${tmm}例', '');
  }

  if(string.startsWith('治愈')) {
    int range = string.indexOf('例');
    String tmm = string.substring(2,range);
    count['curedCount'] = double.parse(tmm);
    string = string.replaceAll('治愈${tmm}例', '');
  }

  if(string.startsWith('死亡')) {
    int range = string.indexOf('例');
    String tmm = string.substring(2,range);
    count['deadCount'] = double.parse(tmm);
    string = string.replaceAll('死亡${tmm}例', '');
  }

  if(string.startsWith('治愈')) {
    int range = string.indexOf('例');
    String tmm = string.substring(2,range);
    count['curedCount'] = double.parse(tmm);
    string = string.replaceAll('治愈${tmm}例', '');
  }
  return count;
}