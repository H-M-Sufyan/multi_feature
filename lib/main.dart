import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_feature/controller/Themecontroller.dart';
import 'package:multi_feature/controller/auth_controller.dart';
import 'package:multi_feature/controller/language_controller.dart';
import 'package:multi_feature/screens/home.dart';
import 'package:multi_feature/screens/lock_screen.dart';
import 'package:multi_feature/services/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.init(); 
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  //Controllers Instance
  final ThemeController _themeController = Get.put(ThemeController());
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GetMaterialApp(
        title: 'Multi-Feature',
        translations: Languages(),
      locale: Locale('en', 'US'),
      fallbackLocale: Locale('en', 'US'),
        debugShowCheckedModeBanner: false,
        themeMode: !_themeController.isDark.value
            ? ThemeMode.light
            : ThemeMode.dark,
        darkTheme: ThemeData.dark(),
        home: Obx(() {
          return authController.isAuthenticated.value
              ? AppHome()
              : LockScreen();
        }),
        // home: AppHome(),
      );
    });
  }
}
