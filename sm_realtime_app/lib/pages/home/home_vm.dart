import 'package:sm_realtime_app/api/api_header.dart';

class HomeVM {
  static HomeVM _homeVM = HomeVM();

  List allDatas = List();

  List<LabNewsModel> currentDatas = List();

  int page = 0;

  static Future initData() async{
    HttpModel result = await TXHttpRequest.httpRequest(HttpMethod.POST, ApiUri.TX_INFO, null);
    List<dynamic> list = List();
    if(result.newslist is List) {
      List newsList = result.newslist;
      if(newsList.length > 0) {
        List news = newsList[0]['news'];
        news.forEach((item) {
          NewsModel newsModel = NewsModel.fromJson(item);
          list.add(newsModel);
        });
      }
    }

    return list;
  }
  
  static Future initLabData() async {
    LABHttpModel result = await LABHttpRequest.httpRequest(HttpMethod.GET, ApiUri.LAB_NEWS , {'num':'all'});
    List<LabNewsModel> list = List();
    if(result.results != null) {
        List newsList = result.results;
        if(newsList.length > 0) {
          int length = newsList.length;
          if(length > 10) {
            length = 10;
          }
          for(int i= 0;i<length; i++) {
            print(i);
            print(newsList.length);
            Map item = newsList[i];

            LabNewsModel model = LabNewsModel.fromJson(item);
            list.add(model);
          }
          newsList.removeRange(0, length);
          _homeVM.allDatas = newsList;
        }
    }
    print(list);
    _homeVM.currentDatas = list;
    _homeVM.page = 0;
    return list;
  }

  static Future loadMore() async {
    _homeVM.page = _homeVM.page + 1;

    List newsList = _homeVM.allDatas;
    List tmp = _homeVM.currentDatas;

    if(newsList.length ==  0) {
      return tmp;
    }else {
      if(newsList.length > 0) {
        int length = newsList.length;
        if(length > 10) {
          length = 10;
        }
        for(int i= 0;i<length; i++) {
          Map item = newsList[i];
          newsList.removeAt(i);
          LabNewsModel model = LabNewsModel.fromJson(item);
          tmp.add(model);
        }
        _homeVM.allDatas = newsList;
      }
      return tmp;
    }
  }


}