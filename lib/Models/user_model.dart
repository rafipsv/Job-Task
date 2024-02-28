// ignore_for_file: prefer_typing_uninitialized_variables

class UserModel {
  String? status;
  String? message;
  Data? data;

  UserModel({this.status, this.message, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  UserDetails? userDetails;
  String? token;

  Data({this.userDetails, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    userDetails = json['user_details'] != null
        ? UserDetails.fromJson(json['user_details'])
        : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (userDetails != null) {
      data['user_details'] = userDetails!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class UserDetails {
  int? id;
  String? name;
  String? email;
  String? phone;
  var nid;
  String? gender;
  String? image;
  var presentAddress;
  var permanentAddress;
  String? medium;
  String? sync;
  var emailVerified;
  String? phoneVerified;
  String? createdAt;
  String? updatedAt;
  var deletedAt;

  UserDetails(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.nid,
      this.gender,
      this.image,
      this.presentAddress,
      this.permanentAddress,
      this.medium,
      this.sync,
      this.emailVerified,
      this.phoneVerified,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  UserDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    nid = json['nid'];
    gender = json['gender'];
    image = json['image'];
    presentAddress = json['present_address'];
    permanentAddress = json['permanent_address'];
    medium = json['medium'];
    sync = json['sync'];
    emailVerified = json['email_verified'];
    phoneVerified = json['phone_verified'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['nid'] = nid;
    data['gender'] = gender;
    data['image'] = image;
    data['present_address'] = presentAddress;
    data['permanent_address'] = permanentAddress;
    data['medium'] = medium;
    data['sync'] = sync;
    data['email_verified'] = emailVerified;
    data['phone_verified'] = phoneVerified;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}
