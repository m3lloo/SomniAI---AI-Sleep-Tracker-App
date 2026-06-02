// lib/features/sleep_tracking/presentation/screens/sleep_tracking_screen.dart
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/themes/app_theme.dart';
import '../../data/services/sleep_tracking_service.dart';
import '../widgets/sleep_tracking_widgets.dart';
import '../widgets/movement_indicator.dart';
import '../widgets/tracking_controls.dart';
import 'sleep_score_result_screen.dart';

class SleepTrackingScreen extends ConsumerStatefulWidget {
  const SleepTrackingScreen({super.key});

  @override
  ConsumerState<SleepTrackingScreen> createState() =>
      _SleepTrackingScreenState();
}

class _SleepTrackingScreenState extends ConsumerState<SleepTrackingScreen>
    with TickerProviderStateMixin {
  late AnimationController _pulseController;
  late AnimationController _waveController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
    _waveController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat();
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _waveController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final trackingData = ref.watch(sleepTrackingServiceProvider);
    final isTracking = trackingData.state == TrackingState.tracking;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Animated background
          _buildAnimatedBackground(isTracking),

          // Main content
          SafeArea(
            child: Column(
              children: [
                _buildHeader(context),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 32),
                          _buildMoonOrb(isTracking, trackingData),
                          const SizedBox(height: 40),
                          SleepTimerDisplay(elapsed: trackingData.elapsed)
                              .animate()
                              .fadeIn(delay: 100.ms, duration: 400.ms)
                              .slideY(begin: -0.1, end: 0),
                          const SizedBox(height: 32),
                          if (isTracking) ...[
                            MovementIndicator(
                                    movement: trackingData.currentMovement)
                                .animate()
                                .fadeIn(delay: 150.ms, duration: 400.ms)
                                .slideY(begin: -0.1, end: 0),
                            const SizedBox(height: 24),
                            _buildStatsRow(trackingData)
                                .animate()
                                .fadeIn(delay: 200.ms, duration: 400.ms)
                                .slideY(begin: -0.1, end: 0),
                          ],
                          const SizedBox(height: 40),
                          TrackingControls(
                            state: trackingData.state,
                            onStart: () => ref
                                .read(sleepTrackingServiceProvider.notifier)
                                .startTracking(),
                            onStop: () => _confirmStop(context),
                          ).animate().fadeIn(delay: 250.ms, duration: 400.ms),
                          const SizedBox(height: 32),
                          if (isTracking)
                            _buildSleepTips()
                                .animate()
                                .fadeIn(delay: 300.ms, duration: 400.ms)
                                .slideY(begin: 0.1, end: 0),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedBackground(bool isTracking) {
    return AnimatedBuilder(
      animation: _waveController,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: isTracking
                  ? [
                      const Color(0xFF050818),
                      const Color(0xFF0A0F2E),
                      const Color(0xFF050818),
                    ]
                  : [AppColors.background, AppColors.surfaceDark],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: isTracking
              ? CustomPaint(
                  painter: StarFieldPainter(_waveController.value),
                  size: Size.infinite,
                )
              : null,
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
      child: Row(
        children: [
          Text(
            'Sleep Tracker',
            style: GoogleFonts.outfit(
              color: AppColors.textPrimary,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings_outlined, color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }

  Widget _buildMoonOrb(bool isTracking, SleepTrackingData data) {
    return AnimatedBuilder(
      animation: _pulseController,
      builder: (context, child) {
        final scale = isTracking ? 1.0 + _pulseController.value * 0.05 : 1.0;
        return Transform.scale(
          scale: scale,
          child: Container(
            width: 180,
            height: 180,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: isTracking
                  ? RadialGradient(
                      colors: [
                        AppColors.indigo.withOpacity(0.9),
                        AppColors.purple.withOpacity(0.6),
                        AppColors.background.withOpacity(0.0),
                      ],
                    )
                  : RadialGradient(
                      colors: [
                        AppColors.surfaceLight,
                        AppColors.surfaceDark.withOpacity(0.5),
                        AppColors.background.withOpacity(0.0),
                      ],
                    ),
              boxShadow: isTracking
                  ? [
                      BoxShadow(
                        color: AppColors.indigo.withOpacity(0.4),
                        blurRadius: 60,
                        spreadRadius: 20,
                      ),
                      BoxShadow(
                        color: AppColors.purple.withOpacity(0.3),
                        blurRadius: 80,
                        spreadRadius: 10,
                      ),
                    ]
                  : [],
            ),
            child: Center(
              child: Icon(
                isTracking ? Icons.nightlight_round : Icons.bedtime_outlined,
                size: 72,
                color: isTracking
                    ? Colors.white.withOpacity(0.95)
                    : AppColors.textMuted,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildStatsRow(SleepTrackingData data) {
    return Row(
      children: [
        _buildStatCard(
          'Movements',
          '${data.movementEvents}',
          Icons.waves,
          AppColors.cyan,
        ),
        const SizedBox(width: 12),
        _buildStatCard(
          'Wake Events',
          '${data.interruptions}',
          Icons.wb_sunny_outlined,
          AppColors.amber,
        ),
      ],
    ).animate().fadeIn(duration: 400.ms);
  }

  Widget _buildStatCard(
      String label, String value, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.cardBg,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withOpacity(0.2)),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: color, size: 18),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: GoogleFonts.outfit(
                    color: AppColors.textPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  label,
                  style: GoogleFonts.outfit(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSleepTips() {
    final tips = [
      '🌙 Keep your room cool (65–68°F)',
      '📵 Avoid blue light screens',
      '🎵 Try white noise or nature sounds',
    ];

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.indigo.withOpacity(0.08),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.indigo.withOpacity(0.15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sleep Tips',
            style: GoogleFonts.outfit(
              color: AppColors.textSecondary,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          ...tips.map((tip) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: Text(
                  tip,
                  style: GoogleFonts.outfit(
                    color: AppColors.textPrimary.withOpacity(0.8),
                    fontSize: 13,
                  ),
                ),
              )),
        ],
      ),
    ).animate().fadeIn(delay: 300.ms, duration: 500.ms);
  }

  Future<void> _confirmStop(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.surfaceDark,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          'Stop Tracking?',
          style: GoogleFonts.outfit(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
        content: Text(
          'Your sleep session will be saved and analyzed.',
          style: GoogleFonts.outfit(color: AppColors.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(
              'Cancel',
              style: GoogleFonts.outfit(color: AppColors.textSecondary),
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.indigo),
            child: Text(
              'Save & Stop',
              style: GoogleFonts.outfit(color: Colors.white),
            ),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      final notifier = ref.read(sleepTrackingServiceProvider.notifier);
      notifier.stopTracking();
      final session = await notifier.finishAndSave();

      if (session != null && context.mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => SleepScoreResultScreen(
              session: session,
            ),
          ),
        );
      }
    }
  }
}

// Simple star field painter for night tracking mode
class StarFieldPainter extends CustomPainter {
  final double progress;
  final Random _rng = Random(42);
  StarFieldPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;
    for (int i = 0; i < 80; i++) {
      final x = _rng.nextDouble() * size.width;
      final y = _rng.nextDouble() * size.height;
      final r = _rng.nextDouble() * 1.5 + 0.3;
      final opacity = 0.2 + sin(progress * pi * 2 + i) * 0.3;
      paint.color = Colors.white.withOpacity(opacity.clamp(0.1, 0.7));
      canvas.drawCircle(Offset(x, y), r, paint);
    }
  }

  @override
  bool shouldRepaint(StarFieldPainter old) => true;
}
