import 'package:sm_realtime_app/api/api_header.dart';

class RumorsVM {
  int page = 1;

  static RumorsVM _rumorsVM = RumorsVM();

  List<RumorModel> currentDatas = List();

  static Future initData() async {

    HttpModel result = await TXHttpRequest.httpRequest(HttpMethod.POST, ApiUri.TX_RUNMOR, null);
    List<RumorModel> list = List();
    Map<String, dynamic> rumorsMap = Map();

    if(result.newslist is List) {
      List newsList = result.newslist;
      if(newsList.length > 0) {
        List news = newsList;
        news.forEach((item) {
          RumorModel newsModel = RumorModel.fromJson(item);
          list.add(newsModel);
        });
      }
    }
    _rumorsVM.page = 1;
    _rumorsVM.currentDatas = list;
    rumorsMap['rumors_data'] = list;
    return rumorsMap;
  }

  static Future loadMore() async {
    _rumorsVM.page = _rumorsVM.page + 1;
    int page = _rumorsVM.page;

    HttpModel result = await TXHttpRequest.httpRequest(HttpMethod.POST, ApiUri.TX_RUNMOR, {'page':page.toString()});
    List<RumorModel> list = _rumorsVM.currentDatas;

    Map<String, dynamic> rumorsMap = Map();

    if(result.newslist is List) {
      List newsList = result.newslist;
      if(newsList.length > 0) {
        List news = newsList;
        news.forEach((item) {
          RumorModel newsModel = RumorModel.fromJson(item);
          list.add(newsModel);
        });
      }
    }
    _rumorsVM.currentDatas = list;
    rumorsMap['rumors_data'] = list;
    return rumorsMap;


  }

}