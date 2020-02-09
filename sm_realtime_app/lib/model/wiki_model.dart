class WikiModel {
  int id;
  String title;
  String imgUrl;
  String linkUrl;
  String description;
  int sort;

  WikiModel(
      {this.id,
        this.title,
        this.imgUrl,
        this.linkUrl,
        this.description,
        this.sort});

  WikiModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    imgUrl = json['imgUrl'];
    linkUrl = json['linkUrl'];
    description = json['description'];
    sort = json['sort'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['imgUrl'] = this.imgUrl;
    data['linkUrl'] = this.linkUrl;
    data['description'] = this.description;
    data['sort'] = this.sort;
    return data;
  }
}
