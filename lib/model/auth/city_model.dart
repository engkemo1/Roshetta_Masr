class CityModel {
  List<CityData>? data;

  CityModel({this.data});

  CityModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CityData>[];
      json['data'].forEach((v) {
        data!.add(new CityData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CityData {
  int? id;
  String? status;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;
  String? name;
  List<Area>? area;
  List<Translations1>? translations;

  CityData(
      {this.id,
        this.status,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.name,
        this.area,
        this.translations});

  CityData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
    if (json['area'] != null) {
      area = <Area>[];
      json['area'].forEach((v) {
        area!.add(new Area.fromJson(v));
      });
    }
    if (json['translations'] != null) {
      translations = <Translations1>[];
      json['translations'].forEach((v) {
        translations!.add(new Translations1.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['name'] = this.name;
    if (this.area != null) {
      data['area'] = this.area!.map((v) => v.toJson()).toList();
    }
    if (this.translations != null) {
      data['translations'] = this.translations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Area {
  int? id;
  String? status;
  int? cityId;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;
  String? name;
  List<Translations1>? translations;

  Area(
      {this.id,
        this.status,
        this.cityId,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.name,
        this.translations});

  Area.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    cityId = json['city_id'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
    if (json['translations'] != null) {
      translations = <Translations1>[];
      json['translations'].forEach((v) {
        translations!.add(new Translations1.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['city_id'] = this.cityId;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['name'] = this.name;
    if (this.translations != null) {
      data['translations'] = this.translations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Translations1 {
  int? id;
  int? areaId;
  String? locale;
  String? name;

  Translations1({this.id, this.areaId, this.locale, this.name});

  Translations1.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    areaId = json['area_id'];
    locale = json['locale'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['area_id'] = this.areaId;
    data['locale'] = this.locale;
    data['name'] = this.name;
    return data;
  }
}

class Translations {
  int? id;
  int? cityId;
  String? locale;
  String? name;

  Translations({this.id, this.cityId, this.locale, this.name});

  Translations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cityId = json['city_id'];
    locale = json['locale'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['city_id'] = this.cityId;
    data['locale'] = this.locale;
    data['name'] = this.name;
    return data;
  }
}
