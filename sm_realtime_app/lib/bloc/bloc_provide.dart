import 'bloc_base.dart';
import 'package:flutter/material.dart';

class BLoCProvider<T extends BLoCBase> extends StatefulWidget {
  final T bloc;
  final Widget child;

  BLoCProvider({Key key, @required this.child, @required this.bloc}):super(key:key);

  @override
  _BLoCProviderState createState() => _BLoCProviderState();

  static Type _typeOf<T>() => T;

  static T of<T extends BLoCBase>(BuildContext context){
    final type = _typeOf<BLoCProvider<T>>();
    BLoCProvider<T> provider = context.ancestorWidgetOfExactType(type);
    if(provider == null) {
      throw ErrorDescription('provider is null');
    }
    return provider.bloc;
  }
}

class _BLoCProviderState extends State<BLoCProvider> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void dispose() {
    widget.bloc?.dispose();
    super.dispose();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
 