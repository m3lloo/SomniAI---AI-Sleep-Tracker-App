// lib/features/home/presentation/screens/home_screen.dart
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../sleep_tracking/data/repositories/sleep_session_repository.dart';
import '../../../sleep_tracking/data/services/sleep_tracking_service.dart';

final lastSessionProvider = FutureProvider<SleepSessionModel?>((ref) async {
  return SleepSessionRepository().getLastSession();
});

final weeklyAverageProvider = FutureProvider<double>((ref) async {
  return SleepSessionRepository().getWeeklyAverageScore();
});

final currentTimeProvider = StreamProvider<DateTime>((ref) {
  final controller = StreamController<DateTime>();
  final timer = Timer.periodic(const Duration(minutes: 1), (_) {
    controller.add(DateTime.now());
  });

  ref.onDispose(() {
    timer.cancel();
    controller.close();
  });

  return controller.stream;
});

final sleepStreakProvider = FutureProvider<int>((ref) async {
  return SleepSessionRepository().calculateStreak();
});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key, this.onSelectTab, this.onSetAlarm});

  final ValueChanged<int>? onSelectTab;
  final VoidCallback? onSetAlarm;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lastSession = ref.watch(lastSessionProvider);
    final weeklyAvg = ref.watch(weeklyAverageProvider);
    final trackingData = ref.watch(sleepTrackingServiceProvider);
    final now = ref.watch(currentTimeProvider).value ?? DateTime.now();
    final streak = ref.watch(sleepStreakProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          _buildSliverAppBar(context, ref),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildGreetingSection(now),
                const SizedBox(height: 24),
                lastSession.when(
                  data: (session) => session != null
                      ? _buildSleepScoreCard(session)
                      : _buildNoDataCard(),
                  loading: () => _buildScoreCardSkeleton(),
                  error: (_, __) => _buildNoDataCard(),
                ),
                const SizedBox(height: 20),
                weeklyAvg.when(
                  data: (avg) => _buildWeeklyStats(avg, streak),
                  loading: () => const SizedBox.shrink(),
                  error: (_, __) => const SizedBox.shrink(),
                ),
                const SizedBox(height: 20),
                _buildQuickActions(context, ref, trackingData, streak),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                  child: _buildAiInsightBanner(),
                ),
                const SizedBox(height: 20),
                lastSession.when(
                  data: (session) => session != null
                      ? _buildLastNightDetails(session)
                      : const SizedBox.shrink(),
                  loading: () => const SizedBox.shrink(),
                  error: (_, __) => const SizedBox.shrink(),
                ),
                const SizedBox(height: 100),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  SliverAppBar _buildSliverAppBar(BuildContext context, WidgetRef ref) {
    return SliverAppBar(
      backgroundColor: AppColors.background,
      floating: true,
      snap: true,
      elevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.nightlight_round,
                      color: Colors.white, size: 16),
                ),
                const SizedBox(width: 10),
                Text(
                  'SomniAI',
                  style: GoogleFonts.outfit(
                    color: AppColors.textPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.notifications_outlined,
                      color: AppColors.textSecondary, size: 22),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints.tightFor(
                    width: 36,
                    height: 36,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGreetingSection(DateTime now) {
    final hour = now.hour;
    final greeting = hour < 5
        ? 'Good Night'
        : hour < 12
            ? 'Good Morning'
            : hour < 17
                ? 'Good Afternoon'
                : hour < 21
                    ? 'Good Evening'
                    : 'Good Night';
    final emoji = hour < 12
        ? '☀️'
        : hour < 17
            ? '🌤️'
            : '🌙';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$greeting $emoji',
          style: GoogleFonts.outfit(
            color: AppColors.textSecondary,
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          DateFormat('EEEE, MMMM d').format(now),
          style: GoogleFonts.outfit(
            color: AppColors.textPrimary,
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    ).animate().fadeIn(duration: 400.ms).slideY(begin: -0.1, end: 0);
  }

  Widget _buildSleepScoreCard(SleepSessionModel session) {
    final gradient = session.sleepScore >= 90
        ? AppColors.scoreExcellent
        : session.sleepScore >= 70
            ? AppColors.scoreGood
            : session.sleepScore >= 50
                ? AppColors.scoreFair
                : AppColors.scorePoor;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: gradient,
        boxShadow: [
          BoxShadow(
            color: gradient.colors.first.withOpacity(0.35),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Last Night',
                    style: GoogleFonts.outfit(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${session.sleepScore}',
                    style: GoogleFonts.outfit(
                      color: Colors.white,
                      fontSize: 64,
                      fontWeight: FontWeight.w800,
                      height: 1,
                    ),
                  ),
                  Text(
                    session.scoreLabel,
                    style: GoogleFonts.outfit(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      _buildMiniStat('🕐', session.durationFormatted),
                      const SizedBox(width: 16),
                      _buildMiniStat('😴', '${session.interruptions} wakes'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            _buildScoreRing(session.sleepScore),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 500.ms).scale(begin: const Offset(0.95, 0.95));
  }

  Widget _buildMiniStat(String emoji, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(emoji, style: const TextStyle(fontSize: 13)),
        const SizedBox(width: 4),
        Text(
          text,
          style: GoogleFonts.outfit(
            color: Colors.white.withOpacity(0.9),
            fontSize: 13,
          ),
        ),
      ],
    );
  }

  Widget _buildScoreRing(int score) {
    return SizedBox(
      width: 90,
      height: 90,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            value: score / 100,
            backgroundColor: Colors.white.withOpacity(0.2),
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
            strokeWidth: 6,
            strokeCap: StrokeCap.round,
          ),
          Text(
            '$score%',
            style: GoogleFonts.outfit(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNoDataCard() {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.surfaceLight),
      ),
      child: Column(
        children: [
          Icon(Icons.bedtime_outlined,
              size: 48, color: AppColors.indigo.withOpacity(0.6)),
          const SizedBox(height: 16),
          Text(
            'No sleep data yet',
            style: GoogleFonts.outfit(
              color: AppColors.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Start tracking your sleep tonight to see your score',
            textAlign: TextAlign.center,
            style: GoogleFonts.outfit(
              color: AppColors.textSecondary,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScoreCardSkeleton() {
    return Container(
      height: 160,
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(24),
      ),
    )
        .animate(onPlay: (c) => c.repeat())
        .shimmer(duration: 1200.ms, color: AppColors.surfaceLight);
  }

  Widget _buildWeeklyStats(double avgScore, AsyncValue<int> streak) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.surfaceLight),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildStatItem(
                'Weekly Avg', '${avgScore.round()}', 'score', AppColors.indigo),
          ),
          Container(width: 1, height: 50, color: AppColors.surfaceLight),
          Expanded(
            child: _buildStatItem('Sleep Goal', '8h', 'target', AppColors.cyan),
          ),
          Container(width: 1, height: 50, color: AppColors.surfaceLight),
          Expanded(
            child: streak.when(
              data: (streakDays) => _buildStatItem(
                  'Streak', '$streakDays', 'days', AppColors.mint),
              loading: () =>
                  _buildStatItem('Streak', '...', 'loading', AppColors.mint),
              error: (_, __) =>
                  _buildStatItem('Streak', '0', 'days', AppColors.mint),
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: 200.ms, duration: 400.ms);
  }

  Widget _buildStatItem(String label, String value, String unit, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.outfit(
            color: color,
            fontSize: 26,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          unit,
          style: GoogleFonts.outfit(
            color: AppColors.textSecondary,
            fontSize: 11,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.outfit(
            color: AppColors.textMuted,
            fontSize: 11,
          ),
        ),
      ],
    );
  }

  Widget _buildQuickActions(
    BuildContext context,
    WidgetRef ref,
    SleepTrackingData tracking,
    AsyncValue<int> streak,
  ) {
    final isTracking = tracking.state == TrackingState.tracking;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Actions',
          style: GoogleFonts.outfit(
            color: AppColors.textSecondary,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildQuickActionTile(
                isTracking ? '⏹ Stop Sleep' : '🌙 Start Sleep',
                isTracking ? AppColors.rose : AppColors.indigo,
                () => isTracking
                    ? _stopSleepFromQuickAction(context, ref)
                    : _startSleepFromQuickAction(context, ref),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildQuickActionTile(
                '📝 Log Sleep',
                AppColors.secondary,
                () => onSelectTab?.call(1),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildQuickActionTile(
                '📊 Analytics',
                AppColors.primary,
                () => onSelectTab?.call(3),
              ),
            ),
          ],
        ),
      ],
    ).animate().fadeIn(delay: 300.ms, duration: 400.ms);
  }

  Widget _buildQuickActionTile(String label, Color color, VoidCallback onTap) {
    return Semantics(
      label: label,
      button: true,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: color.withOpacity(0.25)),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: GoogleFonts.outfit(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  void _startSleepFromQuickAction(BuildContext context, WidgetRef ref) {
    ref.read(sleepTrackingServiceProvider.notifier).startTracking();
    onSelectTab?.call(1);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Sleep tracking started', style: GoogleFonts.outfit()),
        backgroundColor: AppColors.mint,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Future<void> _stopSleepFromQuickAction(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final notifier = ref.read(sleepTrackingServiceProvider.notifier);
    notifier.stopTracking();
    final session = await notifier.finishAndSave();

    ref.invalidate(lastSessionProvider);
    ref.invalidate(weeklyAverageProvider);

    if (!context.mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          session == null
              ? 'Sleep tracking stopped'
              : 'Sleep session saved! Score: ${session.sleepScore}',
          style: GoogleFonts.outfit(),
        ),
        backgroundColor: AppColors.mint,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Widget _buildAiInsightBanner() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.indigo.withOpacity(0.15),
            AppColors.purple.withOpacity(0.1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.indigo.withOpacity(0.2)),
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
                const Icon(Icons.auto_awesome, color: Colors.white, size: 18),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'AI Insight',
                  style: GoogleFonts.outfit(
                    color: AppColors.indigo,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Your sleep improves by ~12% on days you exercise. Keep it up!',
                  style: GoogleFonts.outfit(
                    color: AppColors.textPrimary,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: 400.ms, duration: 500.ms);
  }

  Widget _buildLastNightDetails(SleepSessionModel session) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sleep Stages',
          style: GoogleFonts.outfit(
            color: AppColors.textSecondary,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.cardBg,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.surfaceLight),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStageItem(
                  'Light', session.estimatedLightSleep, AppColors.cyanDim),
              _buildStageItem(
                  'Deep', session.estimatedDeepSleep, AppColors.indigo),
              _buildStageItem(
                  'REM', session.estimatedRemSleep, AppColors.purple),
              _buildStageItem(
                  'Awake', session.estimatedAwakeTime, AppColors.amber),
            ],
          ),
        ),
      ],
    ).animate().fadeIn(delay: 500.ms, duration: 400.ms);
  }

  Widget _buildStageItem(String label, int minutes, Color color) {
    final hours = minutes ~/ 60;
    final mins = minutes % 60;
    final text = hours > 0 ? '${hours}h ${mins}m' : '${mins}m';

    return Column(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(height: 8),
        Text(
          text,
          style: GoogleFonts.outfit(
            color: AppColors.textPrimary,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.outfit(
            color: AppColors.textSecondary,
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}
