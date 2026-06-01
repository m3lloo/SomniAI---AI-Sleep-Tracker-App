class AIInsight {
  final String title;
  final String content;
  final DateTime generatedAt;
  final InsightType type;
  final String? sourceData; // JSON string of the data used to generate this

  AIInsight({
    required this.title,
    required this.content,
    required this.generatedAt,
    required this.type,
    this.sourceData,
  });

  factory AIInsight.fromJson(Map<String, dynamic> json) {
    return AIInsight(
      title: json['title'],
      content: json['content'],
      generatedAt: DateTime.parse(json['generatedAt']),
      type: InsightType.values.firstWhere(
        (e) => e.toString() == 'InsightType.${json['type']}',
        orElse: () => InsightType.general,
      ),
      sourceData: json['sourceData'],
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'content': content,
        'generatedAt': generatedAt.toIso8601String(),
        'type': type.toString().split('.').last,
        'sourceData': sourceData,
      };
}

enum InsightType {
  weeklyAnalysis,
  morningBriefing,
  dreamInterpretation,
  personalizedTip,
  general,
}
