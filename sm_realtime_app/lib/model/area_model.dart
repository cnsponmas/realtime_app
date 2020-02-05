class AreaModel {
  String country;
  String provinceName;
  String provinceShortName;
  int confirmedCount;
  int suspectedCount;
  int curedCount;
  int deadCount;
  List<CityDataModel> cities;
  String comment;
  int updateTime;
  int createTime;
  int modifyTime;

  AreaModel(
      {this.country,
        this.provinceName,
        this.provinceShortName,
        this.confirmedCount,
        this.suspectedCount,
        this.curedCount,
        this.deadCount,
        this.cities,
        this.comment,
        this.updateTime,
        this.createTime,
        this.modifyTime});

  AreaModel.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    provinceName = json['provinceName'];
    provinceShortName = json['provinceShortName'];
    confirmedCount = json['confirmedCount'];
    suspectedCount = json['suspectedCount'];
    curedCount = json['curedCount'];
    deadCount = json['deadCount'];
    if (json['cities'] != null) {
      cities = new List<CityDataModel>();
      json['cities'].forEach((v) {
        cities.add(new CityDataModel.fromJson(v));
      });
    }
    comment = json['comment'];
    updateTime = json['updateTime'];
    createTime = json['createTime'];
    modifyTime = json['modifyTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['provinceName'] = this.provinceName;
    data['provinceShortName'] = this.provinceShortName;
    data['confirmedCount'] = this.confirmedCount;
    data['suspectedCount'] = this.suspectedCount;
    data['curedCount'] = this.curedCount;
    data['deadCount'] = this.deadCount;
    if (this.cities != null) {
      data['cities'] = this.cities.map((v) => v.toJson()).toList();
    }
    data['comment'] = this.comment;
    data['updateTime'] = this.updateTime;
    data['createTime'] = this.createTime;
    data['modifyTime'] = this.modifyTime;
    return data;
  }
}

class CityDataModel {
  String cityName;
  int confirmedCount;
  int curedCount;
  int deadCount;
  int locationId;
  int suspectedCount;

  CityDataModel(
      {this.cityName,
        this.confirmedCount,
        this.curedCount,
        this.deadCount,
        this.locationId,
        this.suspectedCount});

  CityDataModel.fromJson(Map<String, dynamic> json) {
    cityName = json['cityName'];
    confirmedCount = json['confirmedCount'];
    curedCount = json['curedCount'];
    deadCount = json['deadCount'];
    locationId = json['locationId'];
    suspectedCount = json['suspectedCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cityName'] = this.cityName;
    data['confirmedCount'] = this.confirmedCount;
    data['curedCount'] = this.curedCount;
    data['deadCount'] = this.deadCount;
    data['locationId'] = this.locationId;
    data['suspectedCount'] = this.suspectedCount;
    return data;
  }
}