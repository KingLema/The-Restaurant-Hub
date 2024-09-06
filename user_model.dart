// user_model.dart
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
class UserModel {
  static final _storage = const FlutterSecureStorage();

  // Register User
  static Future<void> register(String email, String password) async {
    await _storage.write(key: email, value: password);
  }

  // Check if user exists
  static Future<bool> userExists(String email) async {
    String? password = await _storage.read(key: email);
    return password != null;
  }

  // Login User
  static Future<bool> login(String email, String password) async {
    String? storedPassword = await _storage.read(key: email);
    return storedPassword == password;
  }

  // Optionally, you can implement a method to delete user credentials
  static Future<void> deleteUser(String email) async {
    await _storage.delete(key: email);
  }
}