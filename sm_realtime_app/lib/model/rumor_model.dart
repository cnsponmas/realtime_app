class RumorModel {
  String id;
  String date;
  String title;
  String explain;
  String imgsrc;
  String markstyle;
  String desc;
  String author;

  RumorModel(
      {this.id,
        this.date,
        this.title,
        this.explain,
        this.imgsrc,
        this.markstyle,
        this.desc,
        this.author});

  RumorModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    title = json['title'];
    explain = json['explain'];
    imgsrc = json['imgsrc'];
    markstyle = json['markstyle'];
    desc = json['desc'];
    author = json['author'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['title'] = this.title;
    data['explain'] = this.explain;
    data['imgsrc'] = this.imgsrc;
    data['markstyle'] = this.markstyle;
    data['desc'] = this.desc;
    data['author'] = this.author;
    return data;
  }
}