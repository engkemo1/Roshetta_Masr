class SubCategoryModel {
  int? status;
  String? message;
  List<SubData>? data;

  SubCategoryModel({this.status, this.message, this.data});

  SubCategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <SubData>[];
      json['data'].forEach((v) {
        data!.add(new SubData.fromJson(v));
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

class SubData {
  int? id;
  int? categoryId;
  String? icon;
  String? status;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;
  String? iconPath;
  String? name;
  String? description;
  List<Translations>? translations;

  SubData(
      {this.id,
        this.categoryId,
        this.icon,
        this.status,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.iconPath,
        this.name,
        this.description,
        this.translations});

  SubData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    icon = json['icon'];
    status = json['status'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    iconPath = json['icon_path'];
    name = json['name'];
    description = json['description'];
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
    data['category_id'] = this.categoryId;
    data['icon'] = this.icon;
    data['status'] = this.status;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['icon_path'] = this.iconPath;
    data['name'] = this.name;
    data['description'] = this.description;
    if (this.translations != null) {
      data['translations'] = this.translations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Translations {
  int? id;
  String? locale;
  int? supCategoryId;
  String? name;
  String? description;

  Translations(
      {this.id, this.locale, this.supCategoryId, this.name, this.description});

  Translations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    locale = json['locale'];
    supCategoryId = json['sup_category_id'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['locale'] = this.locale;
    data['sup_category_id'] = this.supCategoryId;
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}
