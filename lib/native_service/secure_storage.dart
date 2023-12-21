import 'package:apothecary/main.dart';

class SecureStorage {
  Future<void> save(String key, String value) async {
    await sharedpref.setString(key, value);
  }

  Future<String?> read(String key) async {
    return await sharedpref.getString(key);
  }

  Future<void> delete(String key) async {
    await sharedpref.remove(key);
  }

  Future<void> deleteall() async {
    await sharedpref.clear();
  }
}
