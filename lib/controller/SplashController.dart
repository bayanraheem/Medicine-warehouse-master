import 'package:apothecary/native_service/secure_storage.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  late SecureStorage _storage;
  @override
  void onInit() async {
    _storage = SecureStorage();
    await checkToken();

    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  Future<void> checkToken() async {
    String? token = await _storage.read('token');
    if (token != null)
      Get.offAllNamed('TapBar');
    else
      Get.offAllNamed('Login');
    print(token);
  }
}
