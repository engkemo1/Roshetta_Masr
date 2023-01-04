
import 'dart:convert';

LoginData UserModelFromJson(String str) => LoginData.fromJson(json.decode(str));
String UserModelToJson(LoginData data) => json.encode(data.toJson());

class LoginModel {
  int? status;
  String? message;
  String? token;
  LoginData? data;

  LoginModel({this.status, this.message, this.token, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    token = json['token'];
    data = json['data'] != null ? new LoginData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['token'] = this.token;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class LoginData {
  int? id;
  String? name;
  String? email;
  String? image;
  String? status;

  LoginData({this.id, this.name, this.email, this.image, this.status});

  LoginData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    image = json['image'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['image'] = this.image;
    data['status'] = this.status;
    return data;
  }
}
