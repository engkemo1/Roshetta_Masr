class AllDoctor {
  int? status;
  String? message;
  List<Data>? data;

  AllDoctor({this.status, this.message, this.data});

  AllDoctor.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? gender;
  String? bd;
  String? specialization;
  String? clinic;
  String? from;
  String? to;
  String? address;
  String? image;
  String? doctorCard;
  int? areaId;
  String? status;
  Null? deletedAt;
  Null? createdAt;
  Null? updatedAt;
  String? imagePath;
  String? doctorPath;
  Area? area;

  Data(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.gender,
        this.bd,
        this.specialization,
        this.clinic,
        this.from,
        this.to,
        this.address,
        this.image,
        this.doctorCard,
        this.areaId,
        this.status,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.imagePath,
        this.doctorPath,
        this.area});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    gender = json['gender'];
    bd = json['bd'];
    specialization = json['specialization'];
    clinic = json['clinic'];
    from = json['from'];
    to = json['to'];
    address = json['address'];
    image = json['image'];
    doctorCard = json['doctor_card'];
    areaId = json['area_id'];
    status = json['status'];
    deletedAt = json['deleted_at'];
    // createdAt = json['created_at'];
    // updatedAt = json['updated_at'];
    imagePath = json['image_path'];
    doctorPath = json['doctor_path'];
    area = json['area'] != null ? new Area.fromJson(json['area']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['gender'] = this.gender;
    data['bd'] = this.bd;
    data['specialization'] = this.specialization;
    data['clinic'] = this.clinic;
    data['from'] = this.from;
    data['to'] = this.to;
    data['address'] = this.address;
    data['image'] = this.image;
    data['doctor_card'] = this.doctorCard;
    data['area_id'] = this.areaId;
    data['status'] = this.status;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image_path'] = this.imagePath;
    data['doctor_path'] = this.doctorPath;
    if (this.area != null) {
      data['area'] = this.area!.toJson();
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
  List<Translations>? translations;

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
      translations = <Translations>[];
      json['translations'].forEach((v) {
        translations!.add(new Translations.fromJson(v));
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

class Translations {
  int? id;
  int? areaId;
  String? locale;
  String? name;

  Translations({this.id, this.areaId, this.locale, this.name});

  Translations.fromJson(Map<String, dynamic> json) {
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
