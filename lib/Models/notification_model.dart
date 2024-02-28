// ignore_for_file: prefer_typing_uninitialized_variables

class NotificationModel {
  String? status;
  String? message;
  Data? data;

  NotificationModel({this.status, this.message, this.data});

  NotificationModel.fromJson(Map<String, dynamic> json) {
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
  int? totalunread;
  List<Results>? results;

  Data({this.totalunread, this.results});

  Data.fromJson(Map<String, dynamic> json) {
    totalunread = json['totalunread'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalunread'] = totalunread;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  int? id;
  int? userId;
  var image;
  String? title;
  String? description;
  String? readStatus;
  String? createdAt;
  String? updatedAt;
  var deletedAt;

  Results(
      {this.id,
      this.userId,
      this.image,
      this.title,
      this.description,
      this.readStatus,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    image = json['image'];
    title = json['title'];
    description = json['description'];
    readStatus = json['read_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['image'] = image;
    data['title'] = title;
    data['description'] = description;
    data['read_status'] = readStatus;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}
