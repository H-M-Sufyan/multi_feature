import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

class AuthController extends GetxController {
  final LocalAuthentication auth = LocalAuthentication();

  RxBool isAuthenticated = false.obs;

  Future<void> authenticate() async {
    try {
      bool success = await auth.authenticate(
        localizedReason: 'Scan your fingerprint',
        biometricOnly: false
      );

      isAuthenticated.value = success;
    } catch (e) {
      print("ERROR: $e");
    }
  }
}
