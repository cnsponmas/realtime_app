import 'package:sm_realtime_app/bloc/bloc_base.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:collection';
import 'data_vm.dart';

class DataBLoC extends BLoCBase {

  PublishSubject<Map> _dataController = PublishSubject<Map>();
  Sink<Map> get _inDataList => _dataController.sink;
  Stream<Map> get outDataList => _dataController.stream;

  @override
  void dispose() {
    _dataController.close();
  }

  Future initData() {
    return DataVM.initData().then((list) {
      _inDataList.add(UnmodifiableMapView(list));
//      _inDataList.add(UnmodifiableListView(list));
    });
  }
}