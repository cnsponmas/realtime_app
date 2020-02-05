import 'package:sm_realtime_app/bloc/bloc_base.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:collection';
import 'rumors_vm.dart';

class RumorsBLoC extends BLoCBase {
  PublishSubject<Map> _rumorsController = PublishSubject<Map>();
  Sink<Map> get _inRumorsData => _rumorsController.sink;
  Stream<Map> get outRumorsData => _rumorsController.stream;

  @override
  void dispose() {
    _rumorsController?.close();
  }

  Future initData() {
    return RumorsVM.initData().then((list) {
      _inRumorsData.add(UnmodifiableMapView(list));
    });
  }

  Future loadMore() {
    return RumorsVM.loadMore().then((list) {
      _inRumorsData.add(UnmodifiableMapView(list));
    });
  }
}