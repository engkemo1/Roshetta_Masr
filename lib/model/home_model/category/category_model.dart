class CategoryModel {
  int? status;
  String? message;
  List<CategoryData>? data;

  CategoryModel({this.status, this.message, this.data});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <CategoryData>[];
      json['data'].forEach((v) {
        data!.add(new CategoryData.fromJson(v));
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

class CategoryData {
  int? id;
  String? icon;
  String? status;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;
  String? iconPath;
  String? name;
  List<Translations>? translations;

  CategoryData(
      {this.id,
        this.icon,
        this.status,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.iconPath,
        this.name,
        this.translations});

  CategoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    icon = json['icon'];
    status = json['status'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    iconPath = json['icon_path'];
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
    data['icon'] = this.icon;
    data['status'] = this.status;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['icon_path'] = this.iconPath;
    data['name'] = this.name;
    if (this.translations != null) {
      data['translations'] = this.translations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Translations {
  int? id;
  String? locale;
  int? categoryId;
  String? name;

  Translations({this.id, this.locale, this.categoryId, this.name});

  Translations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    locale = json['locale'];
    categoryId = json['category_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['locale'] = this.locale;
    data['category_id'] = this.categoryId;
    data['name'] = this.name;
    return data;
  }
}
