// lib/features/ai_insights/presentation/screens/ai_insights_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../sleep_tracking/data/repositories/sleep_session_repository.dart';
import '../../data/services/ai_insight_service.dart';

final recentSessionsForAiProvider =
    FutureProvider<List<SleepSessionModel>>((ref) async {
  return SleepSessionRepository().getRecentSessions(14);
});

class AiInsightsScreen extends ConsumerStatefulWidget {
  const AiInsightsScreen({super.key});

  @override
  ConsumerState<AiInsightsScreen> createState() => _AiInsightsScreenState();
}

class _AiInsightsScreenState extends ConsumerState<AiInsightsScreen> {
  final List<Map<String, String>> _chatHistory = [];
  final TextEditingController _chatController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _isOnline = false;
  bool _isLoadingChat = false;
  bool _chatOpen = false;

  @override
  void initState() {
    super.initState();
    _checkConnectivity();
  }

  Future<void> _checkConnectivity() async {
    final online = await ref.read(aiInsightServiceProvider).hasInternet();
    if (mounted) setState(() => _isOnline = online);
  }

  @override
  void dispose() {
    _chatController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sessionsAsync = ref.watch(recentSessionsForAiProvider);
    final aiService = ref.read(aiInsightServiceProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: sessionsAsync.when(
                data: (sessions) => _chatOpen
                    ? _buildChatView(sessions, aiService)
                    : _buildInsightsView(sessions, aiService),
                loading: () => Center(
                  child: CircularProgressIndicator(color: AppColors.indigo),
                ),
                error: (e, _) => Center(
                  child: Text('Error loading insights',
                      style:
                          GoogleFonts.outfit(color: AppColors.textSecondary)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'AI Insights',
                style: GoogleFonts.outfit(
                  color: AppColors.textPrimary,
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 7,
                    height: 7,
                    decoration: BoxDecoration(
                      color: _isOnline ? AppColors.mint : AppColors.textMuted,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    _isOnline ? 'Online AI Active' : 'Offline Mode',
                    style: GoogleFonts.outfit(
                      color: _isOnline ? AppColors.mint : AppColors.textMuted,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          if (_isOnline)
            GestureDetector(
              onTap: () => setState(() => _chatOpen = !_chatOpen),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  gradient: _chatOpen ? null : AppColors.primaryGradient,
                  color: _chatOpen ? AppColors.surfaceLight : null,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      _chatOpen ? Icons.bar_chart : Icons.chat_bubble_outline,
                      color: Colors.white,
                      size: 16,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      _chatOpen ? 'Insights' : 'AI Chat',
                      style: GoogleFonts.outfit(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildInsightsView(
      List<SleepSessionModel> sessions, AiInsightService aiService) {
    final insights = aiService.getOfflineInsights(sessions);

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      physics: const BouncingScrollPhysics(),
      child: Align(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            _buildAiBanner(),
            const SizedBox(height: 20),
            Text(
              'Personalized Insights',
              style: GoogleFonts.outfit(
                color: AppColors.textSecondary,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            ...insights.asMap().entries.map(
                  (e) => _buildInsightCard(e.value, e.key),
                ),
            const SizedBox(height: 20),
            _buildSleepHygieneSection(),
            const SizedBox(height: 20),
            if (_isOnline) _buildOnlineChatPromo(),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildAiBanner() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.indigo.withOpacity(0.2),
            AppColors.purple.withOpacity(0.1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.indigo.withOpacity(0.25)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              borderRadius: BorderRadius.circular(12),
            ),
            child:
                const Icon(Icons.auto_awesome, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _isOnline ? 'Claude AI Powered' : 'On-Device AI',
                  style: GoogleFonts.outfit(
                    color: AppColors.indigoLight,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  _isOnline
                      ? 'Advanced analysis from Claude AI based on your sleep patterns'
                      : 'Smart offline analysis — no internet needed',
                  style: GoogleFonts.outfit(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 400.ms);
  }

  Widget _buildInsightCard(String insight, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.surfaceLight),
      ),
      child: Text(
        insight,
        style: GoogleFonts.outfit(
          color: AppColors.textPrimary,
          fontSize: 14,
          height: 1.5,
        ),
      ),
    )
        .animate(delay: Duration(milliseconds: index * 80))
        .fadeIn(duration: 400.ms)
        .slideX(begin: 0.05, end: 0);
  }

  Widget _buildSleepHygieneSection() {
    final tips = [
      (
        '🌡️',
        'Keep room 65–68°F',
        'Cool temps signal your brain it\'s time to sleep.'
      ),
      (
        '📱',
        'No screens 1h before bed',
        'Blue light suppresses melatonin production.'
      ),
      ('☕', 'Cut caffeine after 2pm', 'Caffeine has a 6-hour half-life.'),
      (
        '🧘',
        'Wind-down routine',
        '20–30 min of calm activity before bed is powerful.'
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sleep Hygiene Tips',
          style: GoogleFonts.outfit(
            color: AppColors.textSecondary,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        ...tips.map(
          (tip) => Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.cardBg,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.surfaceLight),
            ),
            child: Row(
              children: [
                Text(tip.$1, style: const TextStyle(fontSize: 22)),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tip.$2,
                        style: GoogleFonts.outfit(
                          color: AppColors.textPrimary,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        tip.$3,
                        style: GoogleFonts.outfit(
                          color: AppColors.textSecondary,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOnlineChatPromo() {
    return GestureDetector(
      onTap: () => setState(() => _chatOpen = true),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: AppColors.primaryGradient,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColors.indigo.withOpacity(0.35),
              blurRadius: 20,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            const Icon(Icons.chat_bubble_outline,
                color: Colors.white, size: 28),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Chat with Claude AI',
                    style: GoogleFonts.outfit(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Ask anything about your sleep, health habits, and more',
                    style: GoogleFonts.outfit(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
          ],
        ),
      ),
    ).animate().fadeIn(delay: 300.ms, duration: 400.ms);
  }

  Widget _buildChatView(
      List<SleepSessionModel> sessions, AiInsightService aiService) {
    return Column(
      children: [
        Expanded(
          child: _chatHistory.isEmpty
              ? _buildChatWelcome()
              : ListView.builder(
                  controller: _scrollController,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  physics: const BouncingScrollPhysics(),
                  itemCount: _chatHistory.length,
                  itemBuilder: (_, i) => _buildChatBubble(_chatHistory[i]),
                ),
        ),
        if (_isLoadingChat) _buildTypingIndicator(),
        _buildChatInput(sessions, aiService),
      ],
    );
  }

  Widget _buildChatWelcome() {
    final starters = [
      'Why do I feel tired even after 8 hours?',
      'How can I improve my deep sleep?',
      'What does my sleep score mean?',
      'Tips for falling asleep faster?',
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Align(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const Icon(Icons.auto_awesome, color: Colors.white, size: 28),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi! I\'m your SomniAI coach',
                          style: GoogleFonts.outfit(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'Ask me anything about your sleep, habits, or wellness.',
                          style: GoogleFonts.outfit(
                            color: Colors.white.withOpacity(0.85),
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Try asking...',
              style: GoogleFonts.outfit(
                color: AppColors.textSecondary,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            ...starters.map(
              (s) => GestureDetector(
                onTap: () {
                  _chatController.text = s;
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: AppColors.cardBg,
                    borderRadius: BorderRadius.circular(14),
                    border:
                        Border.all(color: AppColors.indigo.withOpacity(0.2)),
                  ),
                  child: Row(
                    children: [
                      Text(
                        s,
                        style: GoogleFonts.outfit(
                          color: AppColors.textPrimary,
                          fontSize: 13,
                        ),
                      ),
                      const Spacer(),
                      Icon(Icons.arrow_forward_ios,
                          size: 12, color: AppColors.textMuted),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChatBubble(Map<String, String> message) {
    final isUser = message['role'] == 'user';
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.78),
        decoration: BoxDecoration(
          gradient: isUser ? AppColors.primaryGradient : null,
          color: isUser ? null : AppColors.cardBg,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(18),
            topRight: const Radius.circular(18),
            bottomLeft:
                isUser ? const Radius.circular(18) : const Radius.circular(4),
            bottomRight:
                isUser ? const Radius.circular(4) : const Radius.circular(18),
          ),
          border: isUser ? null : Border.all(color: AppColors.surfaceLight),
        ),
        child: Text(
          message['content']!,
          style: GoogleFonts.outfit(
            color: isUser ? Colors.white : AppColors.textPrimary,
            fontSize: 14,
            height: 1.5,
          ),
        ),
      ),
    ).animate().fadeIn(duration: 300.ms).slideY(begin: 0.05, end: 0);
  }

  Widget _buildTypingIndicator() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: AppColors.cardBg,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: AppColors.surfaceLight),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildDot(0),
              const SizedBox(width: 4),
              _buildDot(1),
              const SizedBox(width: 4),
              _buildDot(2),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDot(int index) {
    return Container(
      width: 7,
      height: 7,
      decoration: BoxDecoration(
        color: AppColors.indigo,
        shape: BoxShape.circle,
      ),
    )
        .animate(onPlay: (c) => c.repeat())
        .moveY(
            begin: 0,
            end: -4,
            delay: Duration(milliseconds: index * 150),
            duration: 300.ms)
        .then()
        .moveY(begin: -4, end: 0, duration: 300.ms);
  }

  Widget _buildChatInput(
      List<SleepSessionModel> sessions, AiInsightService aiService) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      decoration: BoxDecoration(
        color: AppColors.surfaceDark,
        border: Border(top: BorderSide(color: AppColors.surfaceLight)),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _chatController,
              style: GoogleFonts.outfit(
                  color: AppColors.textPrimary, fontSize: 14),
              maxLines: null,
              textInputAction: TextInputAction.send,
              onSubmitted: (_) => _sendMessage(sessions, aiService),
              decoration: InputDecoration(
                hintText: 'Ask about your sleep...',
                hintStyle: GoogleFonts.outfit(
                    color: AppColors.textMuted, fontSize: 14),
                filled: true,
                fillColor: AppColors.surfaceLight,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              ),
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap:
                _isLoadingChat ? null : () => _sendMessage(sessions, aiService),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: _isLoadingChat ? null : AppColors.primaryGradient,
                color: _isLoadingChat ? AppColors.surfaceLight : null,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.send_rounded,
                color: _isLoadingChat ? AppColors.textMuted : Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _sendMessage(
      List<SleepSessionModel> sessions, AiInsightService aiService) async {
    final text = _chatController.text.trim();
    if (text.isEmpty || _isLoadingChat) return;

    _chatController.clear();
    setState(() {
      _chatHistory.add({'role': 'user', 'content': text});
      _isLoadingChat = true;
    });

    _scrollToBottom();

    try {
      final response = await aiService.chatWithClaude(
        userMessage: text,
        sessions: sessions,
        history: _chatHistory.sublist(0, _chatHistory.length - 1),
      );
      setState(() {
        _chatHistory.add({'role': 'assistant', 'content': response});
        _isLoadingChat = false;
      });
      _scrollToBottom();
    } catch (e) {
      setState(() {
        _chatHistory.add({
          'role': 'assistant',
          'content':
              'Sorry, I couldn\'t connect right now. Check your API key in Settings. Error: $e',
        });
        _isLoadingChat = false;
      });
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }
}
