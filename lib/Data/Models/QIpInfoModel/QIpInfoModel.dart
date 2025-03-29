

import 'dart:convert';

QIpInfoModel qIpInfoModelFromJson(String str) => QIpInfoModel.fromJson(json.decode(str));

String qIpInfoModelToJson(QIpInfoModel data) => json.encode(data.toJson());

class QIpInfoModel {
    String? continent;
    String? ip;
    bool? success;
    String? country;
    String? countryCode;
    String? regionCode;
    String? callingCode;
    String? region;
    String? borders;
    bool? isEu;
    double? latitude;
    String? city;
    Flag? flag;
    String? postal;
    String? type;
    Connection? connection;
    String? continentCode;
    double? longitude;
    Timezone? timezone;
    String? capital;

    QIpInfoModel({
        this.continent,
        this.ip,
        this.success,
        this.country,
        this.countryCode,
        this.regionCode,
        this.callingCode,
        this.region,
        this.borders,
        this.isEu,
        this.latitude,
        this.city,
        this.flag,
        this.postal,
        this.type,
        this.connection,
        this.continentCode,
        this.longitude,
        this.timezone,
        this.capital,
    });

    factory QIpInfoModel.fromJson(Map<String, dynamic> json) => QIpInfoModel(
        continent: json["continent"],
        ip: json["ip"],
        success: json["success"],
        country: json["country"],
        countryCode: json["country_code"],
        regionCode: json["region_code"],
        callingCode: json["calling_code"],
        region: json["region"],
        borders: json["borders"],
        isEu: json["is_eu"],
        latitude: json["latitude"]?.toDouble(),
        city: json["city"],
        flag: Flag.fromJson(json["flag"]),
        postal: json["postal"],
        type: json["type"],
        connection: Connection.fromJson(json["connection"]),
        continentCode: json["continent_code"],
        longitude: json["longitude"]?.toDouble(),
        timezone: Timezone.fromJson(json['timezone']),
        capital: json["capital"],
    );

    Map<String, dynamic> toJson() => {
        "continent": continent,
        "ip": ip,
        "success": success,
        "country": country,
        "country_code": countryCode,
        "region_code": regionCode,
        "calling_code": callingCode,
        "region": region,
        "borders": borders,
        "is_eu": isEu,
        "latitude": latitude,
        "city": city,
        "flag": flag?.toJson(),
        "postal": postal,
        "type": type,
        "connection": connection?.toJson(),
        "continent_code": continentCode,
        "longitude": longitude,
        "timezone": timezone?.toJson(),
        "capital": capital,
    };
}

class Connection {
    String? org;
    String? isp;
    String? domain;
    int? asn;

    Connection({
        this.org,
        this.isp,
        this.domain,
        this.asn,
    });

    factory Connection.fromJson(Map<String, dynamic> json) => Connection(
        org: json["org"],
        isp: json["isp"],
        domain: json["domain"],
        asn: json["asn"],
    );

    Map<String, dynamic> toJson() => {
        "org": org,
        "isp": isp,
        "domain": domain,
        "asn": asn,
    };
}

class Flag {
    String? img;
    String? emoji;
    String? emojiUnicode;

    Flag({
        this.img,
        this.emoji,
        this.emojiUnicode,
    });

    factory Flag.fromJson(Map<String, dynamic> json) => Flag(
        img: json["img"],
        emoji: json["emoji"],
        emojiUnicode: json["emoji_unicode"],
    );

    Map<String, dynamic> toJson() => {
        "img": img,
        "emoji": emoji,
        "emoji_unicode": emojiUnicode,
    };
}

class Timezone {
    String? utc;
    String? id;
    int? offset;
    bool? isDst;
    DateTime? currentTime;
    String? abbr;

    Timezone({
        this.utc,
        this.id,
        this.offset,
        this.isDst,
        this.currentTime,
        this.abbr,
    });

    factory Timezone.fromJson(Map<String, dynamic> json) => Timezone(
        utc: json["utc"],
        id: json["id"],
        offset: json["offset"],
        isDst: json["is_dst"],
        currentTime: DateTime.parse(json["current_time"]),
        abbr: json["abbr"],
    );

    Map<String, dynamic> toJson() => {
        "utc": utc,
        "id": id,
        "offset": offset,
        "is_dst": isDst,
        "current_time": currentTime?.toIso8601String(),
        "abbr": abbr,
    };
}
