class HttpModel {
  int code;
  String msg;
  dynamic newslist;

  HttpModel({this.code, this.msg, this.newslist});

  HttpModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    newslist = json['newslist'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    data['newslist'] = this.newslist;
    return data;
  }
}

class LABHttpModel {
  dynamic results;
  bool success;

  LABHttpModel({this.results, this.success});

  LABHttpModel.fromJson(Map<String, dynamic> json) {
    results = json['results'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['results'] = this.results;
    data['success'] = this.success;
    return data;
  }
}
