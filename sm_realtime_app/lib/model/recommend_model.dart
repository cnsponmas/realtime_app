class RecommendModel {
  int id;
  int createTime;
  int modifyTime;
  int contentType;
  String title;
  String imgUrl;
  String linkUrl;
  int recordStatus;
  int sort;
  String operator;

  RecommendModel(
      {this.id,
        this.createTime,
        this.modifyTime,
        this.contentType,
        this.title,
        this.imgUrl,
        this.linkUrl,
        this.recordStatus,
        this.sort,
        this.operator});

  RecommendModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createTime = json['createTime'];
    modifyTime = json['modifyTime'];
    contentType = json['contentType'];
    title = json['title'];
    imgUrl = json['imgUrl'];
    linkUrl = json['linkUrl'];
    recordStatus = json['recordStatus'];
    sort = json['sort'];
    operator = json['operator'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createTime'] = this.createTime;
    data['modifyTime'] = this.modifyTime;
    data['contentType'] = this.contentType;
    data['title'] = this.title;
    data['imgUrl'] = this.imgUrl;
    data['linkUrl'] = this.linkUrl;
    data['recordStatus'] = this.recordStatus;
    data['sort'] = this.sort;
    data['operator'] = this.operator;
    return data;
  }
}
