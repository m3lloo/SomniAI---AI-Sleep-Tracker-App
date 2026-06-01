import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiAIService {
  late GenerativeModel _model;
  final String apiKey;

  GeminiAIService({required this.apiKey}) {
    _model = GenerativeModel(
      model: 'gemini-2.5-flash',
      apiKey: apiKey,
    );
  }

  /// Analyze sleep data and provide insights
  Future<String> analyzeSleepData(List<Map<String, dynamic>> sleepLogs) async {
    try {
      final prompt = _buildSleepAnalysisPrompt(sleepLogs);
      final content = [Content.text(prompt)];
      final response = await _model.generateContent(content);
      return response.text ?? 'Unable to generate analysis';
    } catch (e) {
      return 'Error analyzing sleep data: $e';
    }
  }

  /// Generate personalized sleep hygiene tips
  Future<String> generatePersonalizedTips(
    List<Map<String, dynamic>> sleepLogs,
    Map<String, dynamic> userProfile,
  ) async {
    try {
      final prompt = _buildPersonalizedTipsPrompt(sleepLogs, userProfile);
      final content = [Content.text(prompt)];
      final response = await _model.generateContent(content);
      return response.text ?? 'Unable to generate tips';
    } catch (e) {
      return 'Error generating tips: $e';
    }
  }

  /// Interpret a dream using AI
  Future<String> interpretDream(String dreamDescription) async {
    try {
      final prompt = '''
You are a thoughtful dream interpretation assistant. Provide a warm, reflective interpretation of the following dream.
Focus on potential symbols, emotions, and what the dream might reveal about the person's current state of mind.
Keep the tone supportive and non-clinical, suitable for a wellness app.
Respond in the user's language (including Tagalog, English, or any language they use).

Dream: $dreamDescription

Please provide a 2-3 paragraph interpretation.
''';
      final content = [Content.text(prompt)];
      final response = await _model.generateContent(content);
      return response.text ?? 'Unable to interpret dream';
    } catch (e) {
      return 'Error interpreting dream: $e';
    }
  }

  /// Generate morning briefing
  Future<String> generateMorningBriefing(
    Map<String, dynamic> lastNightSleep,
    Map<String, dynamic> weekSummary,
  ) async {
    try {
      final prompt = _buildMorningBriefingPrompt(lastNightSleep, weekSummary);
      final content = [Content.text(prompt)];
      final response = await _model.generateContent(content);
      return response.text ?? 'Unable to generate briefing';
    } catch (e) {
      return 'Error generating briefing: $e';
    }
  }

  /// Chat with the AI assistant
  Future<String> chat(String message) async {
    try {
      final prompt = '''
You are Somnus, a friendly and knowledgeable sleep health assistant. 
Help users understand their sleep patterns, answer questions about sleep hygiene, and provide supportive guidance.
Keep responses concise but informative, in a warm and encouraging tone.
Respond in the user's language - they may write in English, Tagalog, or any language they prefer.

User question: $message

Provide a helpful response.
''';
      final content = [Content.text(prompt)];
      final response = await _model.generateContent(content);
      return response.text ?? 'No response generated';
    } catch (e) {
      return 'Error: $e';
    }
  }

  String _buildSleepAnalysisPrompt(List<Map<String, dynamic>> sleepLogs) {
    final logsText = sleepLogs.asMap().entries.map((entry) {
      final log = entry.value;
      return '${log['date']}: Bedtime ${log['bedTime']}, Wake ${log['wakeTime']}, Duration ${log['duration']}h, Quality: ${log['quality']}/5, Tags: ${log['tags']?.join(',') ?? 'none'}';
    }).join('\n');

    return '''
You are a sleep health assistant. Analyze the following sleep data and provide:
1. A short summary of sleep patterns (2-3 sentences)
2. Key observations about consistency, quality trends, and sleep duration
3. Overall assessment of sleep health

Sleep Data (last 7-30 days):
$logsText

Respond in a warm, friendly, non-clinical tone suitable for a wellness app.
''';
  }

  String _buildPersonalizedTipsPrompt(
    List<Map<String, dynamic>> sleepLogs,
    Map<String, dynamic> userProfile,
  ) {
    final logsText = sleepLogs.asMap().entries.map((entry) {
      final log = entry.value;
      return '${log['date']}: ${log['duration']}h sleep, Quality: ${log['quality']}/5';
    }).join('\n');

    return '''
You are a sleep health assistant. Based on the user's sleep data and profile, provide three personalized, actionable sleep improvement tips.

User Profile:
- Age: ${userProfile['age'] ?? 'Not provided'}
- Sleep Goal: ${userProfile['sleepGoal'] ?? 8} hours
- Wake Up Time: ${userProfile['wakeUpTime'] ?? 'Not set'}

Recent Sleep Data:
$logsText

Please provide:
1. Tip 1 (specific to their data and habits)
2. Tip 2 (evidence-based and practical)
3. Tip 3 (easy to implement immediately)

Use a supportive, encouraging tone.
''';
  }

  String _buildMorningBriefingPrompt(
    Map<String, dynamic> lastNightSleep,
    Map<String, dynamic> weekSummary,
  ) {
    return '''
You are Somnus, a morning sleep briefing assistant. Generate a short, motivational morning briefing about last night's sleep and what to expect for the day.

Last Night's Sleep:
- Duration: ${lastNightSleep['duration']}h
- Quality: ${lastNightSleep['quality']}/5
- Bedtime: ${lastNightSleep['bedTime']}
- Wake Time: ${lastNightSleep['wakeTime']}

Week Summary:
- Average Sleep: ${weekSummary['avgDuration']}h
- Average Quality: ${weekSummary['avgQuality']}/5
- Best Night: ${weekSummary['bestQuality']}/5
- Trend: ${weekSummary['trend']}

Provide a warm, encouraging 2-3 sentence briefing that:
1. Acknowledges how they slept
2. Provides one quick motivation for the day
3. Suggests a simple action if their sleep was below goal

Use an uplifting, conversational tone.
''';
  }

  void dispose() {
    // Cleanup if needed
  }
}
