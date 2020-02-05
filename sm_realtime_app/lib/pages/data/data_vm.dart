import 'package:sm_realtime_app/api/api_header.dart';

class DataVM {
  static Future initData() async{
    Map<String, dynamic> result = Map();
    LABHttpModel labHttpModel = await LABHttpRequest.httpRequest(HttpMethod.GET, ApiUri.LAB_DATA, {'latest':'0'});
    if(labHttpModel.success) {
      List<OverallModel> overalls = List();
      List results = labHttpModel.results;
      results.forEach((v) {
        overalls.add(OverallModel.fromJson(v));
      });
      result['chart_data'] = overalls;
    }

    LABHttpModel lastHttpModel = await LABHttpRequest.httpRequest(HttpMethod.GET, ApiUri.LAB_DATA, {'latest':'1'});
    if(lastHttpModel.success) {
      List<OverallModel> overalls = List();
      List results = lastHttpModel.results;
      results.forEach((v) {
        overalls.add(OverallModel.fromJson(v));
      });
      result['last_data'] = overalls[0];
    }

    Map areas = await areaData();
    result.addAll(areas);
    return result;
  }

  static Future areaData() async {
    LABHttpModel httpModel = await LABHttpRequest.httpRequest(HttpMethod.GET, ApiUri.LAL_AREA, null);

    Map<String, dynamic> areaMap = Map();

    List<AreaModel> areas = List();
    List<AreaModel> overs = List();
    if(httpModel.success) {
      List results = httpModel.results;
      results.forEach((item) {
        AreaModel model = AreaModel.fromJson(item);
        if(model.country == '中国') {
          areas.add(model);
        }else {
          overs.add(model);
        }
      });
    }
    areaMap['area_data'] = areas;
    areaMap['over_data'] = overs;
    return areaMap;
  }



}