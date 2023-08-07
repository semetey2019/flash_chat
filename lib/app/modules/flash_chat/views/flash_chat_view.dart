import 'package:flash_chat/app/components/animation_logo.dart';
import 'package:flash_chat/app/components/custom_button.dart';
import 'package:flash_chat/app/components/flash_chat_text.dart';
import 'package:flash_chat/app/routes/app_pages.dart';
import 'package:flash_chat/contants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/flash_chat_controller.dart';

class FlashChatView extends GetView<FlashChatController> {
  const FlashChatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('FlashChatView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimationLogo(),
                FlashChat(),
              ],
            ),
            const SizedBox(height: 15),
            CustomButton(
              color: AppClors.login,
              text: 'Login',
              onPressed: () => Get.toNamed(Routes.LOGIN, arguments: true),
            ),
            const SizedBox(height: 15),
            CustomButton(
              color: AppClors.register,
              text: 'Register',
              onPressed: () => Get.toNamed(Routes.LOGIN, arguments: false),
            ),
          ],
        ),
      ),
    );
  }
}
