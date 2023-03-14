import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageMethods {
  final _storage = FlutterSecureStorage();

  Future<void> writeSecureUserData({
    required String email,
    required String password,
    required String userName,
    required String userPseudo,
  }) async {
    await _storage.write(key: "KEY_EMAIL", value: email);
    await _storage.write(key: "KEY_PASSWORD", value: password);
    await _storage.write(key: "KEY_USER_NAME", value: userName);
    await _storage.write(key: "KEY_USER_PSEUDO", value: userPseudo);
  }

  Future<String> getUserNameFromSecureStorage() async {
    String? a = await _storage.read(key: "KEY_USER_NAME");
    return a ?? "UNKNOWN";
  }

  Future<String> getUserPasswordFromSecureStorage() async {
    String? a = await _storage.read(key: "KEY_PASSWORD");
    return a ?? "UNKNOWN";
  }

  Future<String> getUserEmailromSecureStorage() async {
    String? a = await _storage.read(key: "KEY_EMAIL");
    return a ?? "UNKNOWN";
  }

  Future<String> getUserPseudoFromSecureStorage() async {
    String? a = await _storage.read(key: "KEY_USER_PSEUDO");
    return a ?? "UNKNOWN";
  }

  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }
}
