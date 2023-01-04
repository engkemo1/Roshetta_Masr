class ProductModel {
  int? status;
  String? message;
  List<ProductData>? data;

  ProductModel({this.status, this.message, this.data});

  ProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ProductData>[];
      json['data'].forEach((v) {
        data!.add(new ProductData.fromJson(v));
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

class ProductData {
  int? id;
  String? photo;
  String? discount;
  String? status;
  int? categoryId;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  String? imagePath;
  String? name;
  String? description;
  List<Translations>? translations;

  ProductData(
      {this.id,
        this.photo,
        this.discount,
        this.status,
        this.categoryId,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.imagePath,
        this.name,
        this.description,
        this.translations});

  ProductData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    photo = json['photo'];
    discount = json['discount'];
    status = json['status'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    imagePath = json['image_path'];
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
    data['photo'] = this.photo;
    data['discount'] = this.discount;
    data['status'] = this.status;
    data['category_id'] = this.categoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['image_path'] = this.imagePath;
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
  int? productId;
  String? name;
  String? description;

  Translations(
      {this.id, this.locale, this.productId, this.name, this.description});

  Translations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    locale = json['locale'];
    productId = json['product_id'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['locale'] = this.locale;
    data['product_id'] = this.productId;
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}
