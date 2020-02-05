class NewsModel {
  int id;
  int pubDate;
  String pubDateStr;
  String title;
  String summary;
  String infoSource;
  String sourceUrl;
  String provinceId;
  String provinceName;
  int createTime;
  int modifyTime;
  int entryWay;
  int adoptType;
  int infoType;
  int dataInfoState;
  String dataInfoOperator;
  int dataInfoTime;

  NewsModel(
      {this.id,
        this.pubDate,
        this.pubDateStr,
        this.title,
        this.summary,
        this.infoSource,
        this.sourceUrl,
        this.provinceId,
        this.provinceName,
        this.createTime,
        this.modifyTime,
        this.entryWay,
        this.adoptType,
        this.infoType,
        this.dataInfoState,
        this.dataInfoOperator,
        this.dataInfoTime});

  NewsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pubDate = json['pubDate'];
    pubDateStr = json['pubDateStr'];
    title = json['title'];
    summary = json['summary'];
    infoSource = json['infoSource'];
    sourceUrl = json['sourceUrl'];
    provinceId = json['provinceId'];
    provinceName = json['provinceName'];
    createTime = json['createTime'];
    modifyTime = json['modifyTime'];
    entryWay = json['entryWay'];
    adoptType = json['adoptType'];
    infoType = json['infoType'];
    dataInfoState = json['dataInfoState'];
    dataInfoOperator = json['dataInfoOperator'];
    dataInfoTime = json['dataInfoTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pubDate'] = this.pubDate;
    data['pubDateStr'] = this.pubDateStr;
    data['title'] = this.title;
    data['summary'] = this.summary;
    data['infoSource'] = this.infoSource;
    data['sourceUrl'] = this.sourceUrl;
    data['provinceId'] = this.provinceId;
    data['provinceName'] = this.provinceName;
    data['createTime'] = this.createTime;
    data['modifyTime'] = this.modifyTime;
    data['entryWay'] = this.entryWay;
    data['adoptType'] = this.adoptType;
    data['infoType'] = this.infoType;
    data['dataInfoState'] = this.dataInfoState;
    data['dataInfoOperator'] = this.dataInfoOperator;
    data['dataInfoTime'] = this.dataInfoTime;
    return data;
  }
}

class DescModel {
  int id;
  int createTime;
  int modifyTime;
  String infectSource;
  String passWay;
  String imgUrl;
  String dailyPic;
  String summary;
  bool deleted;
  String countRemark;
  int confirmedCount;
  int suspectedCount;
  int curedCount;
  int deadCount;
  int seriousCount;
  int suspectedIncr;
  int confirmedIncr;
  int curedIncr;
  int deadIncr;
  int seriousIncr;
  String virus;
  String remark1;
  String remark2;
  String remark3;
  String remark4;
  String remark5;
  String generalRemark;
  String abroadRemark;
  List<Marquee> marquee;

  DescModel(
      {this.id,
        this.createTime,
        this.modifyTime,
        this.infectSource,
        this.passWay,
        this.imgUrl,
        this.dailyPic,
        this.summary,
        this.deleted,
        this.countRemark,
        this.confirmedCount,
        this.suspectedCount,
        this.curedCount,
        this.deadCount,
        this.seriousCount,
        this.suspectedIncr,
        this.confirmedIncr,
        this.curedIncr,
        this.deadIncr,
        this.seriousIncr,
        this.virus,
        this.remark1,
        this.remark2,
        this.remark3,
        this.remark4,
        this.remark5,
        this.generalRemark,
        this.abroadRemark,
        this.marquee});

  DescModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createTime = json['createTime'];
    modifyTime = json['modifyTime'];
    infectSource = json['infectSource'];
    passWay = json['passWay'];
    imgUrl = json['imgUrl'];
    dailyPic = json['dailyPic'];
    summary = json['summary'];
    deleted = json['deleted'];
    countRemark = json['countRemark'];
    confirmedCount = json['confirmedCount'];
    suspectedCount = json['suspectedCount'];
    curedCount = json['curedCount'];
    deadCount = json['deadCount'];
    seriousCount = json['seriousCount'];
    suspectedIncr = json['suspectedIncr'];
    confirmedIncr = json['confirmedIncr'];
    curedIncr = json['curedIncr'];
    deadIncr = json['deadIncr'];
    seriousIncr = json['seriousIncr'];
    virus = json['virus'];
    remark1 = json['remark1'];
    remark2 = json['remark2'];
    remark3 = json['remark3'];
    remark4 = json['remark4'];
    remark5 = json['remark5'];
    generalRemark = json['generalRemark'];
    abroadRemark = json['abroadRemark'];
    if (json['marquee'] != null) {
      marquee = new List<Marquee>();
      json['marquee'].forEach((v) {
        marquee.add(new Marquee.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createTime'] = this.createTime;
    data['modifyTime'] = this.modifyTime;
    data['infectSource'] = this.infectSource;
    data['passWay'] = this.passWay;
    data['imgUrl'] = this.imgUrl;
    data['dailyPic'] = this.dailyPic;
    data['summary'] = this.summary;
    data['deleted'] = this.deleted;
    data['countRemark'] = this.countRemark;
    data['confirmedCount'] = this.confirmedCount;
    data['suspectedCount'] = this.suspectedCount;
    data['curedCount'] = this.curedCount;
    data['deadCount'] = this.deadCount;
    data['seriousCount'] = this.seriousCount;
    data['suspectedIncr'] = this.suspectedIncr;
    data['confirmedIncr'] = this.confirmedIncr;
    data['curedIncr'] = this.curedIncr;
    data['deadIncr'] = this.deadIncr;
    data['seriousIncr'] = this.seriousIncr;
    data['virus'] = this.virus;
    data['remark1'] = this.remark1;
    data['remark2'] = this.remark2;
    data['remark3'] = this.remark3;
    data['remark4'] = this.remark4;
    data['remark5'] = this.remark5;
    data['generalRemark'] = this.generalRemark;
    data['abroadRemark'] = this.abroadRemark;
    if (this.marquee != null) {
      data['marquee'] = this.marquee.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Marquee {
  int id;
  String marqueeLabel;
  String marqueeContent;
  String marqueeLink;

  Marquee({this.id, this.marqueeLabel, this.marqueeContent, this.marqueeLink});

  Marquee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    marqueeLabel = json['marqueeLabel'];
    marqueeContent = json['marqueeContent'];
    marqueeLink = json['marqueeLink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['marqueeLabel'] = this.marqueeLabel;
    data['marqueeContent'] = this.marqueeContent;
    data['marqueeLink'] = this.marqueeLink;
    return data;
  }
}

class LabNewsModel {
  String title;
  String summary;
  String infoSource;
  String sourceUrl;
  int pubDate;
  String provinceName;
  String provinceId;

  LabNewsModel(
      {this.title,
        this.summary,
        this.infoSource,
        this.sourceUrl,
        this.pubDate,
        this.provinceName,
        this.provinceId});

  LabNewsModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    summary = json['summary'];
    infoSource = json['infoSource'];
    sourceUrl = json['sourceUrl'];
    pubDate = json['pubDate'];
    provinceName = json['provinceName'];
    provinceId = json['provinceId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['summary'] = this.summary;
    data['infoSource'] = this.infoSource;
    data['sourceUrl'] = this.sourceUrl;
    data['pubDate'] = this.pubDate;
    data['provinceName'] = this.provinceName;
    data['provinceId'] = this.provinceId;
    return data;
  }
}

