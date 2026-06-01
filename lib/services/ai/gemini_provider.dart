import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:somni_ai/core/services/secure_storage_service.dart';
import 'gemini_service.dart';

// Gemini API Key Provider
final geminiApiKeyProvider = FutureProvider<String>((ref) async {
  return SecureStorageService.readGeminiApiKey();
});

// Gemini Service Provider
final geminiServiceProvider = FutureProvider<GeminiAIService>((ref) async {
  final apiKey = await ref.watch(geminiApiKeyProvider.future);
  if (apiKey.isEmpty) {
    throw Exception('Gemini API key not configured');
  }
  return GeminiAIService(apiKey: apiKey);
});
