import 'package:flash_chat/app/modules/login/services/login_register_service.dart';
import 'package:flash_chat/app/routes/app_pages.dart';
import 'package:flash_chat/services/service_manager.dart';
import 'package:flash_chat/utils/app_shows.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final email = TextEditingController();
  final password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> registerLogin(bool isLogin) async {
    if (formKey.currentState!.validate() &&
        GetUtils.isEmail(email.text) &&
        GetUtils.isPassport(password.text)) {
      AppShows.showIndicator();
      final user = isLogin
          ? await LoginService.login(email.text, password.text)
          : await LoginService.register(email.text, password.text);
      Get.back();

      if (user != null) {
        await userManager.setUid(user.user!.uid);
        await Get.offAllNamed(Routes.HOME);
      } else {
        AppShows.defauldDialog(
            isLogin ? 'password error!' : 'Kata bar', 'Kata bar');
      }
    } else {
      AppShows.showsnackbar('Форманы туура толтурунуз');
    }
  }
}
