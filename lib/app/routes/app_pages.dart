import 'package:get/get.dart';

import '../modules/flash_chat/bindings/flash_chat_binding.dart';
import '../modules/flash_chat/views/flash_chat_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
//initial - башталгыч пейж. башка пейжти койсок да болот
  static const INITIALFLASH_CHAT = Routes.FLASH_CHAT;
  static const INITIALHOME = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(Get.arguments as bool),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.FLASH_CHAT,
      page: () => const FlashChatView(),
      binding: FlashChatBinding(),
    ),
  ];
}
