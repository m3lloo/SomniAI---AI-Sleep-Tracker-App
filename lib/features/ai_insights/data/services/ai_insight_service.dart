// lib/features/ai_insights/data/services/ai_insight_service.dart
// ignore_for_file: unrelated_type_equality_checks, unused_local_variable

import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../local_database/models/sleep_session_model.dart';

class AiInsightService {
  // Offline rule-based recommendations
  List<String> getOfflineInsights(List<SleepSessionModel> sessions) {
    if (sessions.isEmpty) {
      return ['Start tracking your sleep to get personalized insights!'];
    }

    final insights = <String>[];
    final latest = sessions.first;
    final avgScore = sessions.fold(0, (s, e) => s + e.sleepScore) / sessions.length;
    final avgDuration = sessions.fold(0.0, (s, e) => s + e.durationHours) / sessions.length;

    // Duration insights
    if (avgDuration < 6) {
      insights.add('⚠️ You\'re averaging under 6 hours. Aim for 7–9 hours for optimal health.');
    } else if (avgDuration >= 7 && avgDuration <= 9) {
      insights.add(
          '✅ Great job! Your average sleep duration of ${avgDuration.toStringAsFixed(1)}h is in the ideal range.');
    } else if (avgDuration > 9) {
      insights
          .add('💡 You\'re sleeping over 9 hours. Oversleeping can sometimes cause fatigue too.');
    }

    // Score insights
    if (latest.sleepScore >= 85) {
      insights.add(
          '🌟 Excellent sleep last night! Your score of ${latest.sleepScore} reflects great recovery.');
    } else if (latest.sleepScore >= 70) {
      insights.add(
          '😊 Good sleep score of ${latest.sleepScore}. A few more consistent nights will improve it.');
    } else {
      insights.add(
          '💤 Your recent sleep score of ${latest.sleepScore} suggests poor recovery. Try a consistent bedtime.');
    }

    // Movement insights
    if (latest.movementScore > 0.6) {
      insights.add(
          '🌀 High movement detected. Avoid caffeine after 2pm and try relaxation before bed.');
    } else if (latest.movementScore < 0.2) {
      insights.add('🧘 Very still sleep detected — a sign of deep, restful sleep.');
    }

    // Interruption insights
    if (latest.interruptions > 3) {
      insights.add(
          '🔕 ${latest.interruptions} wake events detected. Ensure your room is dark and quiet.');
    }

    // Consistency
    if (sessions.length >= 3) {
      final consistency =
          sessions.map((s) => s.consistencyScore).fold(0, (a, b) => a + b) / sessions.length;
      if (consistency < 50) {
        insights.add(
            '📅 Your bedtime varies a lot. A consistent schedule can significantly boost sleep quality.');
      } else if (consistency >= 80) {
        insights.add('🏆 Your sleep schedule is very consistent — keep it up!');
      }
    }

    // Snoring
    if (latest.snoreDetected) {
      insights
          .add('😴 Snoring detected. Try sleeping on your side. If persistent, consult a doctor.');
    }

    return insights.take(4).toList();
  }

  // Check internet connectivity
  Future<bool> hasInternet() async {
    final result = await Connectivity().checkConnectivity();
    return result != ConnectivityResult.none;
  }

  // Online Claude AI chat
  Future<String> chatWithClaude({
    required String userMessage,
    required List<SleepSessionModel> sessions,
    required List<Map<String, String>> history,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final apiKey = prefs.getString(AppConstants.keyClaudeApiKey) ?? '';

    if (apiKey.isEmpty) {
      throw Exception('Claude API key not configured. Please add it in Settings.');
    }

    final sessionSummary = _buildSessionSummary(sessions);
    final systemPrompt = '''You are SomniAI, an expert AI sleep coach and health assistant.
You help users understand their sleep data, improve sleep quality, and build healthy sleep habits.

The user's recent sleep data:
$sessionSummary

Guidelines:
- Be warm, encouraging, and evidence-based
- Reference the user's actual data when relevant
- Keep responses concise (2-4 paragraphs max)
- Offer actionable, practical advice
- If asked about medical conditions, recommend consulting a doctor
''';

    final messages = [
      ...history.map((m) => {'role': m['role']!, 'content': m['content']!}),
      {'role': 'user', 'content': userMessage},
    ];

    final response = await http.post(
      Uri.parse(AppConstants.claudeApiUrl),
      headers: {
        'Content-Type': 'application/json',
        'x-api-key': apiKey,
        'anthropic-version': '2023-06-01',
      },
      body: jsonEncode({
        'model': AppConstants.claudeModel,
        'max_tokens': AppConstants.aiMaxTokens,
        'system': systemPrompt,
        'messages': messages,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['content'][0]['text'] as String;
    } else {
      final error = jsonDecode(response.body);
      throw Exception(error['error']['message'] ?? 'AI request failed');
    }
  }

  String _buildSessionSummary(List<SleepSessionModel> sessions) {
    if (sessions.isEmpty) return 'No sleep data available yet.';

    final sb = StringBuffer();
    sb.writeln('Recent ${sessions.length} sessions:');
    sb.writeln(
        '- Average score: ${(sessions.fold(0, (s, e) => s + e.sleepScore) / sessions.length).round()}/100');
    sb.writeln(
        '- Average duration: ${(sessions.fold(0.0, (s, e) => s + e.durationHours) / sessions.length).toStringAsFixed(1)}h');
    sb.writeln(
        '- Average wake events: ${(sessions.fold(0, (s, e) => s + e.interruptions) / sessions.length).toStringAsFixed(1)}');

    if (sessions.isNotEmpty) {
      final latest = sessions.first;
      sb.writeln('\nMost recent session:');
      sb.writeln('- Score: ${latest.sleepScore} (${latest.scoreLabel})');
      sb.writeln('- Duration: ${latest.durationFormatted}');
      sb.writeln('- Wake events: ${latest.interruptions}');
      sb.writeln('- Snoring detected: ${latest.snoreDetected}');
      sb.writeln('- Deep sleep: ${latest.estimatedDeepSleep}min');
      sb.writeln('- REM sleep: ${latest.estimatedRemSleep}min');
    }

    return sb.toString();
  }
}

final aiInsightServiceProvider = Provider<AiInsightService>((ref) {
  return AiInsightService();
});
