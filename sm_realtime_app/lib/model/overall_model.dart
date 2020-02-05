
class OverallModel {
  String infectSource;
  String passWay;
  String dailyPic;
  String summary;
  String countRemark;
  int confirmedCount;
  int suspectedCount;
  int curedCount;
  int deadCount;
  String virus;
  String remark1;
  String remark2;
  String remark3;
  String remark4;
  String remark5;
  String generalRemark;
  String abroadRemark;
  int updateTime;

  OverallModel(
      {this.infectSource,
        this.passWay,
        this.dailyPic,
        this.summary,
        this.countRemark,
        this.confirmedCount,
        this.suspectedCount,
        this.curedCount,
        this.deadCount,
        this.virus,
        this.remark1,
        this.remark2,
        this.remark3,
        this.remark4,
        this.remark5,
        this.generalRemark,
        this.abroadRemark,
        this.updateTime});

  OverallModel.fromJson(Map<String, dynamic> json) {
    infectSource = json['infectSource'];
    passWay = json['passWay'];
    dailyPic = json['dailyPic'];
    summary = json['summary'];
    countRemark = json['countRemark'];
    confirmedCount = json['confirmedCount'];
    suspectedCount = json['suspectedCount'];
    curedCount = json['curedCount'];
    deadCount = json['deadCount'];
    virus = json['virus'];
    remark1 = json['remark1'];
    remark2 = json['remark2'];
    remark3 = json['remark3'];
    remark4 = json['remark4'];
    remark5 = json['remark5'];
    generalRemark = json['generalRemark'];
    abroadRemark = json['abroadRemark'];
    updateTime = json['updateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['infectSource'] = this.infectSource;
    data['passWay'] = this.passWay;
    data['dailyPic'] = this.dailyPic;
    data['summary'] = this.summary;
    data['countRemark'] = this.countRemark;
    data['confirmedCount'] = this.confirmedCount;
    data['suspectedCount'] = this.suspectedCount;
    data['curedCount'] = this.curedCount;
    data['deadCount'] = this.deadCount;
    data['virus'] = this.virus;
    data['remark1'] = this.remark1;
    data['remark2'] = this.remark2;
    data['remark3'] = this.remark3;
    data['remark4'] = this.remark4;
    data['remark5'] = this.remark5;
    data['generalRemark'] = this.generalRemark;
    data['abroadRemark'] = this.abroadRemark;
    data['updateTime'] = this.updateTime;
    return data;
  }
}
