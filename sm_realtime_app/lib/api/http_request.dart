import 'dart:convert';
import 'package:dio/dio.dart';
import 'dart:io';
import 'api_uri.dart';
import 'package:sm_realtime_app/model/http_model.dart';
enum HttpMethod {
  POST,
  GET,
}

class HttpRequest {
  static HttpRequest request = HttpRequest();

  static Future httpRequest(HttpMethod method, String path,  Map<String, String> params) async {
    if(method == HttpMethod.GET) {
      return await request.requestForGet(ApiUri.GET_HOST, path, params);
    }else {
      return await request.requestForPost(ApiUri.POST_HOST, path, params);
    }
  }

  Future requestForGet(String host, String path, Map<String, String> params) async {
    try {
      String url = "$host$path";

      Response response;
      Options option = Options(method: "get");
      response = await Dio().get(url, queryParameters: params, options: option);
      print('response:'+response.toString());
      Map res = json.decode(response.toString());
    } on DioError catch (error) {
      print(error);
      Response errorResponse;
      if (error.response != null) {
        errorResponse = error.response;
      } else {
        errorResponse = new Response(statusCode: 500);
      }
      if (error.type == DioErrorType.CONNECT_TIMEOUT) {
        errorResponse.statusCode = 501;
      }
      Map res = {"code": errorResponse.statusCode, "msg": "请求失败"};

    }
  }

  Future requestForPost(String host, String path, Map<String, String> params) async {
    try {
      String url = '$host$path';

      Response response;
      Options options = Options(
          method: 'post',
          contentType: ('application/x-www-form-urlencoded')
      );



      Dio dio = Dio();
      response = await dio.request(url, data: params, options: options);
      print(response.data);
      return response.data;
    } on DioError catch (error) {
      Response errorResponse;
      if (error.response != null) {
        errorResponse = error.response;
      }else {
        errorResponse = Response(statusCode: 500);
      }
      if(error.type == DioErrorType.CONNECT_TIMEOUT) {
        errorResponse.statusCode = 501;
      }

    }
  }
}

class TXHttpRequest {
  static TXHttpRequest request = TXHttpRequest();

  static Future httpRequest(HttpMethod method, String path,  Map<String, String> params) async {
    if(method == HttpMethod.GET) {
      return await request.requestForGet(ApiUri.TIANXING_HOST, path, params);
    }else {
      return await request.requestForPost(ApiUri.TIANXING_HOST, path, params);
    }
  }

  Future requestForGet(String host, String path, Map<String, String> params) async {
    try {
      String url = "$host$path";

      Response response;
      Options option = Options(method: "get");
      response = await Dio().get(url, queryParameters: params, options: option);
      print('response:'+response.toString());
      Map res = json.decode(response.toString());
      LABHttpModel model = LABHttpModel.fromJson(res);
      return model;

    } on DioError catch (error) {
      print(error);
      Response errorResponse;
      if (error.response != null) {
        errorResponse = error.response;
      } else {
        errorResponse = new Response(statusCode: 500);
      }
      if (error.type == DioErrorType.CONNECT_TIMEOUT) {
        errorResponse.statusCode = 501;
      }
      Map res = {"code": errorResponse.statusCode, "msg": "请求失败"};
      LABHttpModel model = LABHttpModel.fromJson(res);
      return model;
    }
  }

  Future requestForPost(String host, String path, Map<String, String> params) async {
    try {
      String url = '$host$path';
      if(params == null) {
        params = Map();
      }
      params['key'] = ApiUri.TX_KEY;

      Response response;
      Options options = Options(
          method: 'post',
          contentType: ('application/x-www-form-urlencoded')
      );

      Dio dio = Dio();
      response = await dio.request(url, data: params, options: options);
      Map res = json.decode(response.toString());
      HttpModel model = HttpModel.fromJson(res);
      return model;
    } on DioError catch (error) {
      Response errorResponse;
      if (error.response != null) {
        errorResponse = error.response;
      }else {
        errorResponse = Response(statusCode: 500);
      }
      if(error.type == DioErrorType.CONNECT_TIMEOUT) {
        errorResponse.statusCode = 501;
      }
      Map res = {"code": errorResponse.statusCode, "msg": "请求失败"};
      HttpModel model = HttpModel.fromJson(res);
      return model;
    }
  }
}

class LABHttpRequest {
  static LABHttpRequest request = LABHttpRequest();

  static Future httpRequest(HttpMethod method, String path,  Map<String, String> params) async {
    if(method == HttpMethod.GET) {
      return await request.requestForGet(ApiUri.LAB_HOST, path, params);
    }else {
      return await request.requestForPost(ApiUri.LAB_HOST, path, params);
    }
  }

  Future requestForGet(String host, String path, Map<String, String> params) async {
    try {
      String url = "$host$path";

      Response response;
      Options option = Options(method: "get");
      response = await Dio().get(url, queryParameters: params, options: option);
      print('request:' + response.request.uri.toString());
      print('response:'+response.toString());

      Map res = json.decode(response.toString());
      LABHttpModel model = LABHttpModel.fromJson(res);
      return model;

    } on DioError catch (error) {
      print(error);
      Response errorResponse;
      if (error.response != null) {
        errorResponse = error.response;
      } else {
        errorResponse = new Response(statusCode: 500);
      }
      if (error.type == DioErrorType.CONNECT_TIMEOUT) {
        errorResponse.statusCode = 501;
      }
      Map res = {"code": errorResponse.statusCode, "msg": "请求失败"};
      HttpModel model = HttpModel.fromJson(res);
      return model;
    }
  }

  Future requestForPost(String host, String path, Map<String, String> params) async {
    try {
      String url = '$host$path';
      if(params == null) {
        params = Map();
      }
      print(params);
      Response response;
      Options options = Options(
          method: 'post',
          contentType: ('application/x-www-form-urlencoded')
      );

      Dio dio = Dio();
      response = await dio.request(url, data: params, options: options);
      Map res = json.decode(response.toString());
      HttpModel model = HttpModel.fromJson(res);
      return model;
    } on DioError catch (error) {
      Response errorResponse;
      if (error.response != null) {
        errorResponse = error.response;
      }else {
        errorResponse = Response(statusCode: 500);
      }
      if(error.type == DioErrorType.CONNECT_TIMEOUT) {
        errorResponse.statusCode = 501;
      }
      Map res = {"code": errorResponse.statusCode, "msg": "请求失败"};
      HttpModel model = HttpModel.fromJson(res);
      return model;
    }
  }
}