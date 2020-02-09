import 'package:sm_realtime_app/api/api_header.dart';

class ProtectVM extends BaseApi{
  Future initData() async{
    List recommend = await recommendData();
    Map data = Map();
    data['recomend_data'] = recommend;

    return data;
  }

  Future recommendData() async {
    Map map = await get();
    List result  = map['data'];
    List list = List();
    result.forEach((json) => list.add(RecommendModel.fromJson(json)));
    return list;
  }


  @override
  Map params() {
    return super.params();
  }

  @override
  ApiType apiType() {
    return ApiType.Default;
  }

  @override
  String path() {
    return ApiUri.RECOMMEND;
  }
}