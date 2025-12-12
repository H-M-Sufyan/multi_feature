import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/get_utils.dart';

class TanslationScreen extends StatelessWidget {
  const TanslationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Translation Page"),),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("message1".tr),
              SizedBox(height: 12,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(onPressed: (){
                    Get.updateLocale(Locale('en', 'US'));
                  }, child: Text("English")),
                  SizedBox(width: 12,),
                  OutlinedButton(onPressed: (){
                    Get.updateLocale(Locale('ur', 'PK'));
                  }, child: Text("Urdu")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}