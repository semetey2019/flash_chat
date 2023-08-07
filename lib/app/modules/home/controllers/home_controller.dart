import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_chat/app/modules/service/home_service.dart';
import 'package:flash_chat/app/routes/app_pages.dart';
import 'package:flash_chat/utils/app_shows.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final smsController = TextEditingController();
  Future<void> logout() async {
    AppShows.showIndicator();
    await HomeService.logout();

    await Get.offAllNamed(Routes.FLASH_CHAT);
  }

  Future<void> delete() async {
    AppShows.showIndicator();
    await HomeService.delete();
    await Get.offAllNamed(Routes.FLASH_CHAT);
  }

  Future<void> sendMessage() async {
    final sms = smsController.text.trim();
    smsController.text = '';
    print(sms);
    if (sms != '') {
      await HomeService.sendMessage(sms);
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> streamMessage() {
    return HomeService.streamMessage();
  }
}
