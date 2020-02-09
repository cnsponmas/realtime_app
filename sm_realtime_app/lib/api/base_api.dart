import 'http_request.dart';
import 'api_uri.dart';
import 'package:sm_realtime_app/model/model_header.dart';

enum ApiType {
  Default,
  Tianxing,
  Lab,
}


abstract class  BaseApi {

  ApiType apiType();

  String path();

  Map params() => null;

  Future get() async {
    Map result = await BaseRequest.request(HttpMethod.GET, _host(), path(), params());
    return result;
  }

  String _host() {
    switch (apiType()) {
      case ApiType.Default:
        return ApiUri.GET_HOST;
        break;
      case ApiType.Lab:
        return ApiUri.LAB_HOST;
        break;
      case ApiType.Tianxing:
        return ApiUri.TIANXING_HOST;
        break;
    }
    return ApiUri.GET_HOST;
  }
}