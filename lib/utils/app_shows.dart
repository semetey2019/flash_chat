import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class AppShows {
  static void showIndicator() {
    Get.defaultDialog(content: const CupertinoActivityIndicator());
  }

  static Future<void> defauldDialog(String title, String cancel) async {
    await Get.defaultDialog(title: title, cancel: Text(cancel));
  }

  static Future<void> showsnackbar(String messege) async {
    Get.showSnackbar(GetSnackBar(
      message: messege,
    ));
  }
}
