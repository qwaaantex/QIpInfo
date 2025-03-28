class QIpInfoModel {
  String? region;
  String? city;
  String? country;
  String? org;
  String? postal;
  String? readme;
  String? timezone;
  String? ip;
  String? loc;

  QIpInfoModel(
      {this.region,
      this.city,
      this.country,
      this.org,
      this.postal,
      this.readme,
      this.timezone,
      this.ip,
      this.loc});

  QIpInfoModel.fromJson(Map<String, dynamic> json) {
    region = json['region'];
    city = json['city'];
    country = json['country'];
    org = json['org'];
    postal = json['postal'];
    readme = json['readme'];
    timezone = json['timezone'];
    ip = json['ip'];
    loc = json['loc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['region'] = region;
    data['city'] = city;
    data['country'] = country;
    data['org'] = org;
    data['postal'] = postal;
    data['readme'] = readme;
    data['timezone'] = timezone;
    data['ip'] = ip;
    data['loc'] = loc;
    return data;
  }
}
