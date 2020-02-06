import 'package:sm_realtime_app/bloc/bloc_base.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:collection';

class ProtectBLoC extends BLoCBase {
  PublishSubject<Map> _protectController = PublishSubject<Map>();
  Sink<Map> get _inProtectData => _protectController.sink;
  Stream<Map> get outProtectData => _protectController.stream;



  @override
  void dispose() {
    _protectController?.close();
  }

  Future initData() {

  }
}