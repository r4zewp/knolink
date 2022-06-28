import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static SecureStorage? _instance;

  factory SecureStorage() => _instance ??= SecureStorage._(
        const FlutterSecureStorage(),
      );

  SecureStorage._(this._storage);
  final FlutterSecureStorage _storage;
  static const _token = 'TOKEN';
  static const _phone = 'PHONE';
  static const _userId = 'USER_ID';
  static const _authCode = "AUTH_CODE";
  static const _userType = "TYPE";
  static const _username = "USERNAME";
  static const _uni = "UNIV";

  Future<void> saveUserToken(String token) async {
    await _storage.write(key: _token, value: token);
  }

  Future<void> saveUserPrefs(String phone, String uid, String authCode) async {
    await _storage.write(key: _phone, value: phone);
    await _storage.write(key: _userId, value: uid);
    await _storage.write(key: _authCode, value: authCode);
  }

  Future<void> saveUserType(String type) async {
    await _storage.write(key: _userType, value: type);
  }

  Future<void> saveUsername(String uname) async {
    await _storage.write(key: _username, value: uname);
  }

  Future<void> saveUniversity(String uni) async {
    await _storage.write(key: _uni, value: uni);
  }

  Future<Map<String, dynamic>> readUserPrefs() async {
    return {
      "uid": await _storage.read(key: _userId),
      "phone": await _storage.read(key: _phone),
      "authCode": await _storage.read(key: _authCode),
      'type': await _storage.read(key: _userType),
      "username": await _storage.read(key: _username),
      "uni": await _storage.read(key: _uni),
    };
  }

  Future<bool> hasToken() async {
    var res = await _storage.read(key: _token);
    return res != null;
  }

  Future<void> revokeToken() async {
    return await _storage.delete(key: _token);
  }

  Future<void> deleteAll() async {
    return await _storage.deleteAll();
  }

  Future<String?> readToken() async {
    return await _storage.read(key: _token);
  }
}
