import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:somni_ai/core/themes/app_theme.dart';
import 'package:somni_ai/core/constants/design_tokens.dart';
import 'package:somni_ai/core/widgets/index.dart';
import 'package:somni_ai/local_database/models/models.dart';

class SleepScoreResultScreen extends ConsumerWidget {
  final SleepSessionModel session;

  const SleepScoreResultScreen({
    super.key,
    required this.session,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scoreColor = _getScoreColor(session.sleepScore);

    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop();
        return true;
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
            child: Column(
              children: [
                // Header
                Text(
                  'Sleep Session Complete',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),

                // Main Score Card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        scoreColor.withOpacity(0.15),
                        scoreColor.withOpacity(0.05),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius:
                        BorderRadius.circular(AppBorderRadius.extraLarge),
                    border: Border.all(
                      color: scoreColor.withOpacity(0.3),
                      width: 2,
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Your Sleep Score',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: 120,
                        height: 120,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox.expand(
                              child: CircularProgressIndicator(
                                value: session.sleepScore / 100,
                                strokeWidth: 8,
                                backgroundColor: AppColors.surfaceLight,
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(scoreColor),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${session.sleepScore}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall
                                      ?.copyWith(
                                        color: scoreColor,
                                        fontWeight: FontWeight.w700,
                                      ),
                                ),
                                Text(
                                  '/100',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall
                                      ?.copyWith(
                                        color: AppColors.textSecondary,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        session.scoreLabel,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: scoreColor,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                )
                    .animate()
                    .fadeIn(duration: 500.ms)
                    .scale(begin: const Offset(0.95, 0.95)),
                const SizedBox(height: 32),

                // Stats Grid
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  children: [
                    _StatCard(
                      label: 'Duration',
                      value: session.durationFormatted,
                      icon: Icons.schedule,
                    ),
                    _StatCard(
                      label: 'Quality',
                      value:
                          '${(session.movementScore * 100).toStringAsFixed(0)}%',
                      icon: Icons.trending_up,
                    ),
                    _StatCard(
                      label: 'Interruptions',
                      value: '${session.interruptions}',
                      icon: Icons.pause_circle,
                    ),
                    _StatCard(
                      label: 'Consistency',
                      value: '${session.consistencyScore}%',
                      icon: Icons.check_circle,
                    ),
                  ],
                )
                    .animate()
                    .fadeIn(delay: 100.ms, duration: 500.ms)
                    .slideY(begin: 0.1, end: 0),
                const SizedBox(height: 24),

                // Sleep Stages
                SectionCard(
                  title: 'Sleep Stages',
                  borderRadius: AppBorderRadius.large,
                  child: Column(
                    children: [
                      _SleepStageBar(
                        label: 'Deep Sleep',
                        minutes: session.estimatedDeepSleep,
                        color: AppColors.primary,
                        totalMinutes: session.estimatedLightSleep +
                            session.estimatedDeepSleep +
                            session.estimatedRemSleep +
                            session.estimatedAwakeTime,
                      ),
                      const SizedBox(height: 12),
                      _SleepStageBar(
                        label: 'REM Sleep',
                        minutes: session.estimatedRemSleep,
                        color: AppColors.secondary,
                        totalMinutes: session.estimatedLightSleep +
                            session.estimatedDeepSleep +
                            session.estimatedRemSleep +
                            session.estimatedAwakeTime,
                      ),
                      const SizedBox(height: 12),
                      _SleepStageBar(
                        label: 'Light Sleep',
                        minutes: session.estimatedLightSleep,
                        color: AppColors.tertiary,
                        totalMinutes: session.estimatedLightSleep +
                            session.estimatedDeepSleep +
                            session.estimatedRemSleep +
                            session.estimatedAwakeTime,
                      ),
                      const SizedBox(height: 12),
                      _SleepStageBar(
                        label: 'Awake Time',
                        minutes: session.estimatedAwakeTime,
                        color: AppColors.error,
                        totalMinutes: session.estimatedLightSleep +
                            session.estimatedDeepSleep +
                            session.estimatedRemSleep +
                            session.estimatedAwakeTime,
                      ),
                    ],
                  ),
                )
                    .animate()
                    .fadeIn(delay: 200.ms, duration: 500.ms)
                    .slideY(begin: 0.1, end: 0),
                const SizedBox(height: 24),

                // Time Info
                SectionCard(
                  title: 'Session Details',
                  borderRadius: AppBorderRadius.large,
                  child: Column(
                    children: [
                      _DetailRow(
                        label: 'Sleep Time',
                        value: _formatTime(session.sleepTime),
                      ),
                      const SizedBox(height: 8),
                      _DetailRow(
                        label: 'Wake Time',
                        value: _formatTime(session.wakeTime),
                      ),
                      const SizedBox(height: 8),
                      _DetailRow(
                        label: 'Sleep Goal Met',
                        value: session.metSleepGoal ? 'Yes ✓' : 'No',
                        valueColor: session.metSleepGoal
                            ? AppColors.tertiary
                            : AppColors.error,
                      ),
                    ],
                  ),
                )
                    .animate()
                    .fadeIn(delay: 300.ms, duration: 500.ms)
                    .slideY(begin: 0.1, end: 0),
                const SizedBox(height: 32),

                // Action Buttons
                Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: FilledButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Done'),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: OutlinedButton(
                        onPressed: (session.notes != null &&
                                session.notes!.isNotEmpty)
                            ? () {
                                _showNotesBottomSheet(context, session.notes!);
                              }
                            : null,
                        child: const Text('View Notes'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _getScoreColor(int score) {
    if (score >= 90) return AppColors.tertiary;
    if (score >= 70) return AppColors.secondary;
    if (score >= 50) return AppColors.warning;
    return AppColors.error;
  }

  String _formatTime(DateTime time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  void _showNotesBottomSheet(BuildContext context, String notes) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.surfaceDark,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (_) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 32,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Dream Journal',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    notes,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _StatCard({
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(AppBorderRadius.large),
        border: Border.all(
          color: AppColors.surfaceLight,
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: AppColors.tertiary,
            size: 24,
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: AppColors.textSecondary,
                ),
          ),
        ],
      ),
    );
  }
}

class _SleepStageBar extends StatelessWidget {
  final String label;
  final int minutes;
  final Color color;
  final int totalMinutes;

  const _SleepStageBar({
    required this.label,
    required this.minutes,
    required this.color,
    required this.totalMinutes,
  });

  @override
  Widget build(BuildContext context) {
    final percentage = totalMinutes > 0 ? minutes / totalMinutes : 0.0;
    final displayMinutes = (minutes / 60).toStringAsFixed(1);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.labelSmall,
            ),
            Text(
              '$displayMinutes h',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: AppColors.textSecondary,
                  ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: percentage,
            minHeight: 8,
            backgroundColor: color.withOpacity(0.1),
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ),
      ],
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;

  const _DetailRow({
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.textSecondary,
              ),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: valueColor ?? AppColors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
        ),
      ],
    );
  }
}
