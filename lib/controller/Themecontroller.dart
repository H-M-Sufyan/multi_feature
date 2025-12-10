import 'package:get/get.dart';

class ThemeController extends GetxController{
  RxBool isDark = false.obs;
  
  void updateTheme(){
    isDark.value = !isDark.value;
  }
}