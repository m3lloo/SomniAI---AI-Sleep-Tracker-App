import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../sleep_tracking/data/repositories/sleep_session_repository.dart';

final sleepSessionRepositoryProvider = Provider<SleepSessionRepository>((ref) {
  return SleepSessionRepository();
});

final analyticsSessionsProvider =
    FutureProvider<List<SleepSessionModel>>((ref) async {
  final repo = ref.read(sleepSessionRepositoryProvider);
  return repo.getRecentSessions(30);
});

final durationBarGroupsProvider = Provider<List<BarChartGroupData>>((ref) {
  final sessionsAsync = ref.watch(analyticsSessionsProvider);
  return sessionsAsync.maybeWhen(
    data: (sessions) {
      final recent = sessions.take(7).toList().reversed.toList();
      return List.generate(recent.length, (i) {
        final session = recent[i];
        return BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
              toY: session.durationHours,
              gradient: session.durationHours >= 7
                  ? AppColors.cyanGradient
                  : const LinearGradient(
                      colors: [AppColors.amber, AppColors.rose]),
              width: 20,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(6)),
              backDrawRodData: BackgroundBarChartRodData(
                  show: true, toY: 12, color: AppColors.surfaceLight),
            ),
          ],
        );
      });
    },
    orElse: () => [],
  );
});

final sleepScoreSpotsProvider = Provider<List<FlSpot>>((ref) {
  final sessionsAsync = ref.watch(analyticsSessionsProvider);
  return sessionsAsync.maybeWhen(
    data: (sessions) => sessions
        .asMap()
        .entries
        .map((e) => FlSpot(e.key.toDouble(), e.value.sleepScore.toDouble()))
        .toList(),
    orElse: () => [],
  );
});

final consistencySpotsProvider = Provider<List<FlSpot>>((ref) {
  final sessionsAsync = ref.watch(analyticsSessionsProvider);
  return sessionsAsync.maybeWhen(
    data: (sessions) => sessions
        .asMap()
        .entries
        .map((e) =>
            FlSpot(e.key.toDouble(), e.value.consistencyScore.toDouble()))
        .toList(),
    orElse: () => [],
  );
});
