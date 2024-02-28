// ignore_for_file: use_build_context_synchronously, unused_local_variable

import 'package:flutter/material.dart';
import 'package:job_task/Controllers/auth_controller.dart';
import 'package:job_task/Models/notification_model.dart';
import 'package:job_task/Services/notification_service.dart';
import 'package:job_task/Views/Screens/notification_screen.dart';
import 'package:provider/provider.dart';

class NotificationController with ChangeNotifier {
  int pageNo = 1;
  bool isLoading = false;
  bool isEdit = false;
  bool isAll = false;
  bool isUpdate = false;
  bool isDelete = false;
  List<int> selectedIds = [];
  NotificationService notificationService = NotificationService();
  NotificationModel notifications = NotificationModel(data: Data(results: []));
  Future<void> getNotification({
    required String page,
    required BuildContext context,
  }) async {
    isLoading = true;
    notifyListeners();
    final provider = Provider.of<AuthController>(context, listen: false);
    String token = provider.user.data!.token.toString();
    NotificationModel dummy = NotificationModel();
    dummy = await notificationService.getNotification(page: page, token: token);
    notifications.message = dummy.message;
    notifications.data!.totalunread = dummy.data!.totalunread;
    notifications.status = dummy.status;
    for (var element in dummy.data!.results!) {
      notifications.data!.results!.add(element);
      if (isAll) {
        selectedIds.add(element.id!.toInt());
      }
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> getNotification2({
    required String page,
    required BuildContext context,
  }) async {
    final provider = Provider.of<AuthController>(context, listen: false);
    String token = provider.user.data!.token.toString();
    notifications =
        await notificationService.getNotification(page: page, token: token);
    notifyListeners();
  }

  void updateNotifications({required BuildContext context}) async {
    isUpdate = true;
    notifyListeners();
    final provider = Provider.of<AuthController>(context, listen: false);
    String token = provider.user.data!.token.toString();
    bool status = await notificationService.updateNotification(
      list: selectedIds,
      token: token,
    );
    selectedIds.clear();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const NotificationScreen();
        },
      ),
    );
    isUpdate = false;
    notifyListeners();
  }

  void deleteNotification({required BuildContext context}) async {
    isDelete = true;
    notifyListeners();
    final provider = Provider.of<AuthController>(context, listen: false);
    String token = provider.user.data!.token.toString();
    bool status = await notificationService.deleteNotification(
      list: selectedIds,
      token: token,
    );
    selectedIds.clear();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const NotificationScreen();
        },
      ),
    );
    isDelete = false;
    notifyListeners();
  }

  void setPage(int value) {
    pageNo = value;
  }

  void setIds(int id) {
    if (selectedIds.contains(id)) {
      selectedIds.remove(id);
    } else {
      selectedIds.add(id.toInt());
    }
    notifyListeners();
  }

  void changeEdit() {
    isEdit = !isEdit;
    notifyListeners();
  }

  void setAll() {
    isAll = !isAll;
    if (isAll) {
      for (var element in notifications.data!.results!) {
        selectedIds.add(element.id!.toInt());
      }
    } else {
      selectedIds.clear();
    }

    notifyListeners();
  }
}
