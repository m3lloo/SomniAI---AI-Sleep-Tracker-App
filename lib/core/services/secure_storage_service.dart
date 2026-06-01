import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  static const FlutterSecureStorage _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  );

  static const String geminiApiKey = 'gemini_api_key';

  static Future<void> saveGeminiApiKey(String value) async {
    await _storage.write(
      key: geminiApiKey,
      value: value.trim(),
    );
  }

  static Future<String> readGeminiApiKey() async {
    final value = await _storage.read(key: geminiApiKey);
    return value ?? '';
  }

  static Future<void> deleteGeminiApiKey() async {
    await _storage.delete(key: geminiApiKey);
  }
}
