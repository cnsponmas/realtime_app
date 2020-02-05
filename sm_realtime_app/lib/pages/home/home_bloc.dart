import 'package:sm_realtime_app/bloc/bloc_base.dart';
import 'package:rxdart/rxdart.dart';
import 'home_vm.dart';
import 'dart:collection';

class HomeBLoC extends BLoCBase {

  PublishSubject<List> _homeController = PublishSubject<List>();
  Sink<List> get _inHomeList => _homeController.sink;
  Stream<List> get outHomeList => _homeController.stream;

  @override
  void dispose() {
    _homeController.close();
  }

  Future initData() {
    return HomeVM.initLabData().then((list) {
      print(list);
      if(!_homeController.isClosed) {
        _inHomeList.add(UnmodifiableListView(list));
      }
    });
//    HomeVM.initData();
  }

  Future loadMoreData() {
    return HomeVM.loadMore().then((list){
      print(list);
//      if(!_homeController.isClosed) {
        _inHomeList.add(UnmodifiableListView(list));
//      }
    });
  }
}