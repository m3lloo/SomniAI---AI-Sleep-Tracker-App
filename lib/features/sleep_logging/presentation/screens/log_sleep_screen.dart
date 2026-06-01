import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:somni_ai/core/themes/app_theme.dart';
import 'package:somni_ai/core/constants/design_tokens.dart';
import 'package:somni_ai/core/widgets/index.dart';
import 'package:somni_ai/local_database/models/sleep_session_model.dart';
import 'package:somni_ai/features/sleep_tracking/data/repositories/sleep_session_repository.dart';
import 'package:somni_ai/features/sleep_tracking/presentation/screens/sleep_score_result_screen.dart';

// ignore_for_file: unused_field

class LogSleepScreen extends ConsumerStatefulWidget {
  const LogSleepScreen({super.key});

  @override
  ConsumerState<LogSleepScreen> createState() => _LogSleepScreenState();
}

class _LogSleepScreenState extends ConsumerState<LogSleepScreen> {
  late TimeOfDay _bedTime = TimeOfDay.now();
  late TimeOfDay _wakeTime = TimeOfDay.fromDateTime(DateTime.now().add(const Duration(hours: 8)));
  late int _qualityRating = 3;
  final List<String> _selectedMoodTags = [];
  final TextEditingController _dreamNotesController = TextEditingController();
  final List<String> _moodOptions = const [
    'rested',
    'groggy',
    'anxious',
    'energetic',
    'refreshed',
    'tired'
  ];

  @override
  void dispose() {
    _dreamNotesController.dispose();
    super.dispose();
  }

  Future<void> _saveSleepLog() async {
    HapticFeedback.mediumImpact();

    // Create DateTime objects for sleep and wake
    final now = DateTime.now();
    final sleepTime = DateTime(
      now.year,
      now.month,
      now.day,
      _bedTime.hour,
      _bedTime.minute,
    );

    // If wake time is earlier than sleep time, it's next day
    var wakeTime = DateTime(
      now.year,
      now.month,
      now.day,
      _wakeTime.hour,
      _wakeTime.minute,
    );
    if (wakeTime.isBefore(sleepTime)) {
      wakeTime = wakeTime.add(const Duration(days: 1));
    }

    // Calculate duration in hours
    final durationHours = wakeTime.difference(sleepTime).inMinutes / 60.0;

    // Calculate score based on quality rating (1-5) and duration
    final score = _calculateManualSleepScore(durationHours, _qualityRating);

    // Estimate movement score from quality rating (inverse relationship)
    final movementScore = _estimateMovementFromQuality(_qualityRating);

    // Estimate sleep stages
    final stages = _estimateSleepStages(durationHours, movementScore);

    // Create sleep session
    final session = SleepSessionModel()
      ..sleepTime = sleepTime
      ..wakeTime = wakeTime
      ..sleepScore = score
      ..interruptions = _estimateInterruptionsFromQuality(_qualityRating)
      ..movementScore = movementScore
      ..durationHours = durationHours
      ..estimatedLightSleep = stages['light']!
      ..estimatedDeepSleep = stages['deep']!
      ..estimatedRemSleep = stages['rem']!
      ..estimatedAwakeTime = stages['awake']!
      ..snoreDetected = false
      ..snoreEventCount = 0
      ..avgNoiseLevel = 0.0
      ..metSleepGoal = durationHours >= 7.0
      ..consistencyScore = _calculateConsistencyScore(sleepTime, wakeTime)
      ..notes = _dreamNotesController.text.isNotEmpty ? _dreamNotesController.text : null;

    // Save to database
    await SleepSessionRepository().saveSession(session);

    if (!mounted) return;

    // Navigate to result screen
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => SleepScoreResultScreen(
          session: session,
        ),
      ),
    );
  }

  int _calculateManualSleepScore(double durationHours, int qualityRating) {
    // Duration score (0-40 pts)
    double durationScore = 0;
    if (durationHours >= 7 && durationHours <= 9) {
      durationScore = 40;
    } else if (durationHours >= 6) {
      durationScore = 30;
    } else if (durationHours >= 5) {
      durationScore = 20;
    } else {
      durationScore = 10;
    }

    // Quality rating score (0-40 pts) - direct from user rating
    final qualityScore = (qualityRating / 5) * 40;

    // Mood diversity bonus (0-20 pts) - more mood tags = better recovery perception
    final moodBonus = (_selectedMoodTags.length * 3).clamp(0, 20).toDouble();

    return (durationScore + qualityScore + moodBonus).round().clamp(0, 100);
  }

  double _estimateMovementFromQuality(int qualityRating) {
    // Lower quality rating = higher (worse) movement score
    // Quality 5 (excellent) = 0.1 movement
    // Quality 1 (poor) = 0.7 movement
    return (1.0 - (qualityRating / 5.0 * 0.9)).clamp(0.1, 0.9);
  }

  int _estimateInterruptionsFromQuality(int qualityRating) {
    // Based on quality rating, estimate interruptions
    // Quality 5 = 0-1 interruptions
    // Quality 1 = 4-6 interruptions
    return (6 - qualityRating * 1.2).round().clamp(0, 6);
  }

  Map<String, int> _estimateSleepStages(double durationHours, double movementScore) {
    final totalMinutes = (durationHours * 60).round();

    // Rough heuristic-based stage estimation
    final deepPercent = (0.20 - movementScore * 0.10).clamp(0.10, 0.25);
    const remPercent = 0.20;
    final awakePercent = (movementScore * 0.10).clamp(0.02, 0.15);
    final lightPercent = 1.0 - deepPercent - remPercent - awakePercent;

    return {
      'light': (totalMinutes * lightPercent).round(),
      'deep': (totalMinutes * deepPercent).round(),
      'rem': (totalMinutes * remPercent).round(),
      'awake': (totalMinutes * awakePercent).round(),
    };
  }

  int _calculateConsistencyScore(DateTime sleepTime, DateTime wakeTime) {
    // Compare to target bedtime (22:30) and wake (06:30)
    const targetBedHour = 22;
    const targetWakeHour = 6;

    final bedDiff = (sleepTime.hour - targetBedHour).abs();
    final wakeDiff = (wakeTime.hour - targetWakeHour).abs();

    final bedScore = (50 - bedDiff * 10).clamp(0, 50).toDouble();
    final wakeScore = (50 - wakeDiff * 10).clamp(0, 50).toDouble();

    return (bedScore + wakeScore).round().clamp(0, 100);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppAppBar(
        title: 'Log Sleep',
        showBackButton: true,
        backgroundColor: AppColors.background,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppConstants.spacing20,
          AppConstants.spacing4,
          AppConstants.spacing20,
          112,
        ),
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.spacing16,
              vertical: AppConstants.spacing12,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.tertiary.withOpacity(0.12),
                  AppColors.primary.withOpacity(0.08),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(AppBorderRadius.large),
              border: Border.all(
                color: AppColors.tertiary.withOpacity(0.25),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(AppConstants.spacing8),
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    borderRadius: BorderRadius.circular(AppBorderRadius.medium),
                  ),
                  child: const Icon(
                    Icons.bedtime_rounded,
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
                        'Log Your Sleep',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      const SizedBox(height: AppConstants.spacing4),
                      Text(
                        'Track your bedtime and wake time',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: AppColors.textMuted,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ).animate().fadeIn(duration: 400.ms).slideY(begin: -0.1, end: 0),
          const SizedBox(height: AppConstants.spacing20),
          Row(
            children: [
              Expanded(
                child: _TimePickerCard(
                  label: 'Bedtime',
                  time: _bedTime,
                  onTap: () async {
                    final time = await showTimePicker(
                      context: context,
                      initialTime: _bedTime,
                    );
                    if (time != null) setState(() => _bedTime = time);
                  },
                ),
              ),
              const SizedBox(width: AppConstants.spacing12),
              Expanded(
                child: _TimePickerCard(
                  label: 'Wake Time',
                  time: _wakeTime,
                  onTap: () async {
                    final time = await showTimePicker(
                      context: context,
                      initialTime: _wakeTime,
                    );
                    if (time != null) setState(() => _wakeTime = time);
                  },
                ),
              ),
            ],
          ).animate().fadeIn(delay: 100.ms, duration: 400.ms).slideY(begin: -0.05, end: 0),
          const SizedBox(height: AppConstants.spacing20),
          _buildQualitySection()
              .animate()
              .fadeIn(delay: 150.ms, duration: 400.ms)
              .slideY(begin: 0.05, end: 0),
          const SizedBox(height: AppConstants.spacing20),
          _buildMoodSection()
              .animate()
              .fadeIn(delay: 200.ms, duration: 400.ms)
              .slideY(begin: 0.05, end: 0),
          const SizedBox(height: AppConstants.spacing20),
          _buildJournalSection()
              .animate()
              .fadeIn(delay: 250.ms, duration: 400.ms)
              .slideY(begin: 0.05, end: 0),
          const SizedBox(height: AppConstants.spacing20),
          SizedBox(
            width: double.infinity,
            height: 52,
            child: FilledButton(
              onPressed: _saveSleepLog,
              child: const Text('Save Sleep Log'),
            ),
          ).animate().fadeIn(delay: 300.ms, duration: 400.ms),
        ],
      ),
    );
  }

  Widget _buildQualitySection() {
    return SectionCard(
      title: 'Sleep Quality',
      borderRadius: AppBorderRadius.large,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(5, (index) {
              final rating = index + 1;
              final isSelected = _qualityRating == rating;
              final color = rating >= 4
                  ? AppColors.tertiary
                  : rating == 3
                      ? AppColors.warning
                      : AppColors.error;

              return Semantics(
                label: 'Rate $rating out of 5',
                button: true,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(999),
                    onTap: () {
                      HapticFeedback.selectionClick();
                      setState(() => _qualityRating = rating);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeInOut,
                      width: 48,
                      height: 48,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: isSelected ? color : AppColors.surfaceLight,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '$rating',
                        style: TextStyle(
                          color: isSelected ? Colors.white : AppColors.textMuted,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: AppConstants.spacing12),
          Text(
            'Poor    Fair    Average    Good    Excellent',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ],
      ),
    );
  }

  Widget _buildMoodSection() {
    return SectionCard(
      title: 'How Did You Feel?',
      borderRadius: AppBorderRadius.large,
      child: Wrap(
        spacing: AppConstants.spacing8,
        runSpacing: AppConstants.spacing8,
        children: _moodOptions.map((mood) {
          final isSelected = _selectedMoodTags.contains(mood);
          return FilterChip(
            label: Text(mood),
            selected: isSelected,
            onSelected: (_) {
              HapticFeedback.selectionClick();
              setState(() {
                if (isSelected) {
                  _selectedMoodTags.remove(mood);
                } else {
                  _selectedMoodTags.add(mood);
                }
              });
            },
            selectedColor: AppColors.primary,
            checkmarkColor: Colors.white,
            side: BorderSide(
              color: Colors.white.withOpacity(0.15),
              width: 0.5,
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildJournalSection() {
    return SectionCard(
      title: 'Dream Journal',
      borderRadius: AppBorderRadius.large,
      child: TextField(
        controller: _dreamNotesController,
        maxLines: 4,
        decoration: const InputDecoration(
          hintText: 'Write down your dreams or notes about your sleep...',
        ),
      ),
    );
  }
}

class _TimePickerCard extends StatelessWidget {
  final String label;
  final TimeOfDay time;
  final VoidCallback onTap;

  const _TimePickerCard({
    required this.label,
    required this.time,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InputCard(
      backgroundColor: AppColors.surfaceDark,
      borderColor: Colors.white.withOpacity(0.15),
      onTap: onTap,
      padding: const EdgeInsets.all(AppConstants.spacing12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall,
          ),
          const SizedBox(height: AppConstants.spacing8),
          Text(
            time.format(context),
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
        ],
      ),
    );
  }
}
