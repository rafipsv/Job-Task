// ignore_for_file: file_names, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:job_task/Models/notification_model.dart';
import 'package:job_task/Utils/network_utils.dart';

class NotificationService {
  String baseUrl = NetworkUtils.baseUrl;
  Future<NotificationModel> getNotification({
    required String page,
    required String token,
  }) async {
    var response = await http.get(
        Uri.parse("$baseUrl/get_notification?page=$page&pageSize=10"),
        headers: {
          'Authorization': 'Bearer $token',
        });
    if (response.statusCode == 200) {
      NotificationModel notificationModel =
          NotificationModel.fromJson(jsonDecode(response.body));
      return notificationModel;
    } else {
      NotificationModel notificationModel = NotificationModel();
      return notificationModel;
    }
  }

  Future<bool> updateNotification({
    required List<int> list,
    required String token,
  }) async {
    String rawData = '''
{
  "notification_Ids": $list,
  "status": "Read"
}
''';
    var response = await http.post(
      Uri.parse("$baseUrl/update_notification_status"),
      headers: {
        'Authorization': 'Bearer $token',
        "Content-Type": "application/json"
      },
      body: rawData,
    );
    if (response.statusCode == 200) {
      debugPrint(response.body);
      return true;
    } else {
      debugPrint(response.body);
      return false;
    }
  }

  Future<bool> deleteNotification({
    required List<int> list,
    required String token,
  }) async {
    String rawData = '''
{
  "notification_Ids": $list,
  "status": "Delete"
}
''';
    var response = await http.post(
      Uri.parse("$baseUrl/update_notification_status"),
      headers: {
        'Authorization': 'Bearer $token',
        "Content-Type": "application/json"
      },
      body: rawData,
    );
    if (response.statusCode == 200) {
      debugPrint(response.body);
      return true;
    } else {
      debugPrint(response.body);
      return false;
    }
  }
}
