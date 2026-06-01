// lib/features/sleep_tracking/presentation/widgets/sleep_timer_display.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/themes/app_theme.dart';

class SleepTimerDisplay extends StatelessWidget {
  final Duration elapsed;

  const SleepTimerDisplay({super.key, required this.elapsed});

  @override
  Widget build(BuildContext context) {
    final hours = elapsed.inHours.toString().padLeft(2, '0');
    final minutes = (elapsed.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (elapsed.inSeconds % 60).toString().padLeft(2, '0');

    return Column(
      children: [
        Text(
          '$hours:$minutes:$seconds',
          style: GoogleFonts.outfit(
            color: AppColors.textPrimary,
            fontSize: 56,
            fontWeight: FontWeight.w200,
            letterSpacing: 4,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          elapsed.inSeconds == 0 ? 'Ready to track' : 'Tracking your sleep...',
          style: GoogleFonts.outfit(
            color: AppColors.textSecondary,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

// lib/features/sleep_tracking/presentation/widgets/movement_indicator.dart

class MovementIndicator extends StatelessWidget {
  final double movement; // 0.0 - 1.0

  const MovementIndicator({super.key, required this.movement});

  @override
  Widget build(BuildContext context) {
    final label = movement < 0.2
        ? 'Still'
        : movement < 0.5
            ? 'Light Movement'
            : movement < 0.8
                ? 'Active'
                : 'Restless';

    final color = movement < 0.2
        ? AppColors.mint
        : movement < 0.5
            ? AppColors.cyan
            : movement < 0.8
                ? AppColors.amber
                : AppColors.rose;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Movement',
                style: GoogleFonts.outfit(
                  color: AppColors.textSecondary,
                  fontSize: 13,
                ),
              ),
              Text(
                label,
                style: GoogleFonts.outfit(
                  color: color,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: movement,
              backgroundColor: AppColors.surfaceLight,
              valueColor: AlwaysStoppedAnimation<Color>(color),
              minHeight: 8,
            ),
          ),
        ],
      ),
    );
  }
}
