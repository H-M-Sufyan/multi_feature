import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_feature/controller/auth_controller.dart';

class LockScreen extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: GestureDetector(
          onTap: () => authController.authenticate(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  authController.authenticate();
                },
                child: Icon(
                Icons.fingerprint,
                size: 120,
                color: Colors.white,
              ),
              ),
              SizedBox(height: 20),
              Text(
                "Tap to Unlock",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
