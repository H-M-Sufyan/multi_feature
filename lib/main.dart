import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';
import 'package:multi_feature/controller/Themecontroller.dart';
import 'package:multi_feature/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ThemeController _themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GetMaterialApp(
        title: 'Multi-Feature',
        debugShowCheckedModeBanner: false,
        themeMode: !_themeController.isDark.value
            ? ThemeMode.light
            : ThemeMode.dark,
        darkTheme: ThemeData.dark(),
        home: AppHome(),
      );
    });
  }
}
