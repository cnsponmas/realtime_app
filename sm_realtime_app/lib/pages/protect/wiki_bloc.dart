import 'package:sm_realtime_app/bloc/bloc_base.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:collection';
import 'package:sm_realtime_app/api/api_header.dart';


class WikiBLoC extends BLoCBase {
  PublishSubject<Map> _wikiController = PublishSubject<Map>();
  Sink<Map> get _inWikiData => _wikiController.sink;
  Stream<Map> get outWikiData => _wikiController.stream;

  @override
  void dispose() {
    _wikiController?.close();
  }

  Future initData() {
    return WikiVM().initData().then((data){
      _inWikiData.add(UnmodifiableMapView(data));
    });
  }


}

class WikiVM extends BaseApi {
  Future initData() async{
    List recommend = await wikiData();
    Map data = Map();
    data['wiki_data'] = recommend;

    return data;
  }


  Future wikiData() async {
    Map map = await get();
    print(map);
    List result  = map['result'];
    List list = List();
    result.forEach((json) => list.add(WikiModel.fromJson(json)));
    return list;
  }


  @override
  ApiType apiType() {
    return ApiType.Default;
  }

  @override
  Map params() {
    return null;
  }

  @override
  String path() {
    return ApiUri.WIKI;
  }
}