import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/services/service_manager.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

bool shouldUseFirebaseEmulator = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  if (shouldUseFirebaseEmulator) {
    await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  }
  final isAuth = await userManager.init();
  runApp(
    MyApp(isAuth: isAuth),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.isAuth,
  });

  final bool isAuth;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: isAuth ? AppPages.INITIALHOME : AppPages.INITIALFLASH_CHAT,
      getPages: AppPages.routes,
    );
  }
}
