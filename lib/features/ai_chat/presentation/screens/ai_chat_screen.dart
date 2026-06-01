import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:somni_ai/core/themes/app_theme.dart';
import 'package:somni_ai/core/constants/design_tokens.dart';
import 'package:somni_ai/services/ai/gemini_provider.dart';

class AIChatScreen extends ConsumerStatefulWidget {
  const AIChatScreen({super.key});

  @override
  ConsumerState<AIChatScreen> createState() => _AIChatScreenState();
}

class _AIChatScreenState extends ConsumerState<AIChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  late Timer _updateTimer;
  bool _isLoading = false;
  late List<_ChatMessage> _messages;

  final List<String> _quickPrompts = const [
    'Why do I feel tired even after 8 hours?',
    'How can I fall asleep faster?',
    'What time should I sleep tonight?',
  ];

  @override
  void initState() {
    super.initState();
    _messages = [
      _ChatMessage(
        text:
            "Hello, I'm Somnus. Ask me anything about your sleep, bedtime habits, or how to wake up better.",
        isUser: false,
        timestamp: DateTime.now(),
      ),
    ];
    // Update UI every minute to refresh relative timestamps
    _updateTimer = Timer.periodic(const Duration(minutes: 1), (_) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    _updateTimer.cancel();
    super.dispose();
  }

  void _clearChat() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Clear Chat'),
        content: const Text('Are you sure you want to clear all messages?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _messages = [
                  _ChatMessage(
                    text:
                        "Hello, I'm Somnus. Ask me anything about your sleep, bedtime habits, or how to wake up better.",
                    isUser: false,
                    timestamp: DateTime.now(),
                  ),
                ];
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Chat cleared ✓'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            child: const Text('Clear'),
          ),
        ],
      ),
    );
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scrollController.hasClients) return;
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 240),
        curve: Curves.easeOut,
      );
    });
  }

  Future<void> _sendMessage([String? preset]) async {
    final text = (preset ?? _messageController.text).trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add(
          _ChatMessage(text: text, isUser: true, timestamp: DateTime.now()));
      _messages.add(_ChatMessage.loading());
      _messageController.clear();
      _isLoading = true;
    });
    _scrollToBottom();

    final apiKey = await ref.read(geminiApiKeyProvider.future);
    if (apiKey.isEmpty) {
      if (!mounted) return;
      setState(() {
        _messages.removeWhere((message) => message.isLoading);
        _messages.add(
          _ChatMessage(
            text:
                'AI is not enabled yet. Please add your Gemini API key in Settings to use Somnus.',
            isUser: false,
            timestamp: DateTime.now(),
          ),
        );
        _isLoading = false;
      });
      _scrollToBottom();
      return;
    }

    try {
      final service = await ref.read(geminiServiceProvider.future);
      final reply = await service.chat(text);
      if (!mounted) return;
      setState(() {
        _messages.removeWhere((message) => message.isLoading);
        _messages.add(
          _ChatMessage(
            text: reply,
            isUser: false,
            timestamp: DateTime.now(),
          ),
        );
        _isLoading = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _messages.removeWhere((message) => message.isLoading);
        _messages.add(
          _ChatMessage(
            text:
                'AI could not start right now. Please check your Gemini API key in Settings.',
            isUser: false,
            timestamp: DateTime.now(),
          ),
        );
        _isLoading = false;
      });
    }
    _scrollToBottom();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Somnus'),
        backgroundColor: AppColors.background,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: _clearChat,
            tooltip: 'Clear chat',
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppConstants.spacing20,
                AppConstants.spacing12,
                AppConstants.spacing20,
                AppConstants.spacing16,
              ),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.spacing16,
                  vertical: AppConstants.spacing12,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primary.withOpacity(0.12),
                      AppColors.tertiary.withOpacity(0.08),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(AppBorderRadius.large),
                  border: Border.all(
                    color: AppColors.primary.withOpacity(0.25),
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(AppConstants.spacing8),
                      decoration: BoxDecoration(
                        gradient: AppColors.primaryGradient,
                        borderRadius:
                            BorderRadius.circular(AppBorderRadius.medium),
                      ),
                      child: const Icon(
                        Icons.auto_awesome,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                    const SizedBox(width: AppConstants.spacing12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Somnus - Your Sleep Coach',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                  color: AppColors.textPrimary,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          const SizedBox(height: AppConstants.spacing4),
                          Text(
                            'Ask me anything about sleep',
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(
                                  color: AppColors.textMuted,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ).animate().fadeIn(duration: 400.ms).slideY(begin: -0.1, end: 0),
            ),
            Expanded(
              child: _messages.length <= 1
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.auto_awesome,
                            size: 64,
                            color: AppColors.primary.withOpacity(0.4),
                          ),
                          const SizedBox(height: AppConstants.spacing20),
                          Text(
                            'Start a conversation',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  color: AppColors.textPrimary,
                                ),
                          ),
                          const SizedBox(height: AppConstants.spacing8),
                          Text(
                            'Ask me about sleep habits and bedtime routines',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: AppColors.textMuted,
                                ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      controller: _scrollController,
                      padding: const EdgeInsets.fromLTRB(
                        AppConstants.spacing20,
                        AppConstants.spacing12,
                        AppConstants.spacing20,
                        AppConstants.spacing12,
                      ),
                      itemCount: _messages.length,
                      itemBuilder: (context, index) =>
                          _ChatBubble(message: _messages[index]),
                    ),
            ),
            if (_messages.length <= 1 && !_isLoading)
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppConstants.spacing20,
                  0,
                  AppConstants.spacing20,
                  AppConstants.spacing12,
                ),
                child: SizedBox(
                  height: 38,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: _quickPrompts
                        .map(
                          (p) => Padding(
                            padding: const EdgeInsets.only(
                                right: AppConstants.spacing8),
                            child: Material(
                              color: AppColors.primary.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(
                                  AppBorderRadius.circular),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(
                                    AppBorderRadius.circular),
                                onTap: () => _sendMessage(p),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: AppConstants.spacing12,
                                    vertical: AppConstants.spacing8,
                                  ),
                                  child: Text(
                                    p,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall
                                        ?.copyWith(
                                          color: AppColors.primary,
                                        ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppConstants.spacing20,
                0,
                AppConstants.spacing20,
                AppConstants.spacing16,
              ),
              child: _Composer(
                  controller: _messageController, onSend: _sendMessage),
            ),
          ],
        ),
      ),
    );
  }
}

class _Composer extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<String?> onSend;
  const _Composer({required this.controller, required this.onSend});

  @override
  State<_Composer> createState() => _ComposerState();
}

class _ComposerState extends State<_Composer> {
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.spacing16,
        vertical: AppConstants.spacing12,
      ),
      decoration: BoxDecoration(
        color: AppColors.surfaceDark,
        borderRadius: BorderRadius.circular(AppBorderRadius.large),
        border: Border.all(
          color:
              _isFocused ? AppColors.primary : Colors.white.withOpacity(0.15),
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.auto_awesome_rounded,
            color: AppColors.primary,
            size: 20,
          ),
          const SizedBox(width: AppConstants.spacing12),
          Expanded(
            child: TextField(
              controller: widget.controller,
              textInputAction: TextInputAction.send,
              onSubmitted: widget.onSend,
              onTap: () => setState(() => _isFocused = true),
              onEditingComplete: () => setState(() => _isFocused = false),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textPrimary,
                  ),
              decoration: InputDecoration(
                hintText: 'Ask about your sleep…',
                hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.textMuted,
                    ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 8),
              ),
            ),
          ),
          const SizedBox(width: AppConstants.spacing12),
          SizedBox(
            width: 40,
            height: 40,
            child: Material(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(AppBorderRadius.large),
              child: InkWell(
                borderRadius: BorderRadius.circular(AppBorderRadius.large),
                onTap: () {
                  widget.onSend(null);
                  setState(() => _isFocused = false);
                },
                child: const Icon(
                  Icons.send_rounded,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChatBubble extends StatelessWidget {
  final _ChatMessage message;
  const _ChatBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    final isUser = message.isUser;
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: math.min(MediaQuery.of(context).size.width * 0.82, 360),
        ),
        child: Container(
          margin: const EdgeInsets.only(bottom: AppConstants.spacing10),
          padding: const EdgeInsets.all(AppConstants.spacing16),
          decoration: BoxDecoration(
            color: isUser ? AppColors.primary : AppColors.surfaceDark,
            borderRadius: BorderRadius.circular(AppBorderRadius.large),
            border: isUser
                ? null
                : Border.all(
                    color: Colors.white.withOpacity(0.15),
                    width: 0.5,
                  ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (message.isLoading)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _TypingDot(color: AppColors.textMuted),
                    const SizedBox(width: AppConstants.spacing4),
                    _TypingDot(color: AppColors.textMuted),
                    const SizedBox(width: AppConstants.spacing4),
                    _TypingDot(color: AppColors.textMuted),
                  ],
                )
              else
                Text(
                  message.text,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: isUser ? Colors.white : AppColors.textPrimary,
                        height: 1.6,
                      ),
                ),
              const SizedBox(height: AppConstants.spacing8),
              Text(
                message.formattedTime,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: AppColors.textMuted,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TypingDot extends StatelessWidget {
  final Color color;

  const _TypingDot({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _ChatMessage {
  final String text;
  final bool isUser;
  final DateTime timestamp;
  final bool isLoading;

  _ChatMessage({
    required this.text,
    required this.isUser,
    required this.timestamp,
  }) : isLoading = false;

  _ChatMessage.loading()
      : text = 'Thinking...',
        isUser = false,
        timestamp = DateTime.now(),
        isLoading = true;

  String get formattedTime {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inSeconds < 60) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} min ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hour${difference.inHours == 1 ? '' : 's'} ago';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      return '${difference.inDays ~/ 7} week${(difference.inDays ~/ 7) == 1 ? '' : 's'} ago';
    }
  }
}
