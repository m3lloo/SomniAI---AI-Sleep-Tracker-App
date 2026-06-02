// lib/features/analytics/presentation/screens/analytics_screen.dart
import 'dart:developer' as developer;
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../sleep_tracking/data/repositories/sleep_session_repository.dart';
import '../providers/analytics_providers.dart';

class AnalyticsScreen extends ConsumerStatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  ConsumerState<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends ConsumerState<AnalyticsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sessionsAsync = ref.watch(analyticsSessionsProvider);
    final durationBarGroups = ref.watch(durationBarGroupsProvider);
    final sleepScoreSpots = ref.watch(sleepScoreSpotsProvider);
    final consistencySpots = ref.watch(consistencySpotsProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primary.withOpacity(0.12),
                      AppColors.secondary.withOpacity(0.08),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.primary.withOpacity(0.25),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        gradient: AppColors.primaryGradient,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.trending_up_rounded,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sleep Analytics',
                            style: GoogleFonts.outfit(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Analyze your sleep patterns',
                            style: GoogleFonts.outfit(
                              fontSize: 12,
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
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: AppColors.surfaceDark,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  labelStyle: GoogleFonts.outfit(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: AppColors.textMuted,
                  tabs: const [
                    Tab(text: 'Week'),
                    Tab(text: 'Month'),
                    Tab(text: 'Trends'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: sessionsAsync.when(
                data: (sessions) {
                  if (sessions.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.nightlight_rounded,
                            size: 64,
                            color: AppColors.textMuted,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'No sleep data yet',
                            style: GoogleFonts.outfit(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Log your sleep to see analytics',
                            style: GoogleFonts.outfit(
                              fontSize: 14,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return TabBarView(
                    controller: _tabController,
                    children: [
                      _buildWeekView(sessions, durationBarGroups),
                      _buildMonthView(sessions),
                      _buildTrendsView(sessions),
                    ],
                  );
                },
                loading: () => Center(
                  child: CircularProgressIndicator(color: AppColors.indigo),
                ),
                error: (error, stackTrace) {
                  developer.log(
                    'Analytics error: $error',
                    stackTrace: stackTrace,
                    name: 'AnalyticsScreen',
                  );
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error_outline_rounded,
                          size: 64,
                          color: AppColors.error,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Unable to load analytics',
                          style: GoogleFonts.outfit(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Please try again later',
                          style: GoogleFonts.outfit(
                            fontSize: 14,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeekView(List<SleepSessionModel> sessions,
      List<BarChartGroupData> durationBarGroups) {
    final weekSessions = sessions.take(7).toList().reversed.toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          _buildSleepDurationChart(weekSessions, durationBarGroups),
          const SizedBox(height: 20),
          _buildSleepScoreChart(weekSessions),
          const SizedBox(height: 20),
          _buildSummaryCards(sessions),
        ],
      ),
    );
  }

  Widget _buildMonthView(List<SleepSessionModel> sessions) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          _buildSleepScoreChart(sessions),
          const SizedBox(height: 20),
          _buildStageBreakdown(sessions),
        ],
      ),
    );
  }

  Widget _buildTrendsView(List<SleepSessionModel> sessions) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          _buildConsistencyChart(sessions),
          const SizedBox(height: 20),
          _buildBedtimeTrend(sessions),
        ],
      ),
    );
  }

  Widget _buildSleepDurationChart(List<SleepSessionModel> sessions,
      List<BarChartGroupData> durationBarGroups) {
    return _buildChartCard(
      'Sleep Duration',
      'Hours per night',
      BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: 12,
          minY: 0,
          barGroups: durationBarGroups.isNotEmpty
              ? durationBarGroups
              : List.generate(sessions.length, (i) {
                  final session = sessions[i];
                  return BarChartGroupData(
                    x: i,
                    barRods: [
                      BarChartRodData(
                        toY: session.durationHours,
                        gradient: session.durationHours >= 7
                            ? AppColors.cyanGradient
                            : LinearGradient(
                                colors: [AppColors.amber, AppColors.rose]),
                        width: 20,
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(6)),
                        backDrawRodData: BackgroundBarChartRodData(
                          show: true,
                          toY: 12,
                          color: AppColors.surfaceLight,
                        ),
                      ),
                    ],
                  );
                }),
          barTouchData: BarTouchData(
            enabled: true,
            touchTooltipData: BarTouchTooltipData(
              tooltipBgColor: AppColors.cardBg,
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                final hour = rod.toY;
                return BarTooltipItem(
                  '${hour.toStringAsFixed(1)} h',
                  GoogleFonts.outfit(
                    color: AppColors.textPrimary,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                );
              },
            ),
          ),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (val, meta) {
                  if (val.toInt() >= sessions.length) return const SizedBox();
                  final session = sessions[val.toInt()];
                  return Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(
                      DateFormat('E').format(session.sleepTime),
                      style: GoogleFonts.outfit(
                        color: AppColors.textMuted,
                        fontSize: 11,
                      ),
                    ),
                  );
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 3,
                getTitlesWidget: (val, meta) => Text(
                  '${val.toInt()}h',
                  style: GoogleFonts.outfit(
                    color: AppColors.textMuted,
                    fontSize: 10,
                  ),
                ),
                reservedSize: 30,
              ),
            ),
            topTitles: const AxisTitles(),
            rightTitles: const AxisTitles(),
          ),
          gridData: FlGridData(
            horizontalInterval: 3,
            drawVerticalLine: false,
            getDrawingHorizontalLine: (val) => FlLine(
              color: AppColors.surfaceLight,
              strokeWidth: 1,
            ),
          ),
          borderData: FlBorderData(show: false),
        ),
      ),
    );
  }

  Widget _buildSleepScoreChart(List<SleepSessionModel> sessions) {
    if (sessions.isEmpty) return const SizedBox.shrink();

    final spots = ref.watch(sleepScoreSpotsProvider);

    return _buildChartCard(
      'Sleep Score',
      'Quality over time',
      LineChart(
        LineChartData(
          minY: 0,
          maxY: 100,
          lineTouchData: LineTouchData(
            enabled: true,
            touchTooltipData: LineTouchTooltipData(
              tooltipBgColor: AppColors.cardBg,
              getTooltipItems: (touchedSpots) => touchedSpots.map((t) {
                return LineTooltipItem(
                  '${t.y.toStringAsFixed(0)}',
                  GoogleFonts.outfit(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                );
              }).toList(),
            ),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: true,
              gradient: AppColors.primaryGradient,
              barWidth: 3,
              isStrokeCapRound: true,
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    AppColors.indigo.withOpacity(0.25),
                    AppColors.indigo.withOpacity(0.0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              dotData: FlDotData(
                getDotPainter: (spot, _, __, ___) => FlDotCirclePainter(
                  radius: 4,
                  color: AppColors.indigo,
                  strokeWidth: 2,
                  strokeColor: AppColors.background,
                ),
              ),
            ),
            // Target line at 70
            LineChartBarData(
              spots: [
                const FlSpot(0, 70),
                FlSpot((sessions.length - 1).toDouble(), 70),
              ],
              color: AppColors.mint.withOpacity(0.4),
              barWidth: 1.5,
              dashArray: [6, 4],
              dotData: const FlDotData(show: false),
            ),
          ],
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 2,
                getTitlesWidget: (val, meta) {
                  final idx = val.toInt();
                  if (idx >= sessions.length || idx % 2 != 0) {
                    return const SizedBox();
                  }
                  return Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(
                      DateFormat('d').format(sessions[idx].sleepTime),
                      style: GoogleFonts.outfit(
                        color: AppColors.textMuted,
                        fontSize: 10,
                      ),
                    ),
                  );
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 25,
                getTitlesWidget: (val, meta) => Text(
                  '${val.toInt()}',
                  style: GoogleFonts.outfit(
                    color: AppColors.textMuted,
                    fontSize: 10,
                  ),
                ),
                reservedSize: 28,
              ),
            ),
            topTitles: const AxisTitles(),
            rightTitles: const AxisTitles(),
          ),
          gridData: FlGridData(
            horizontalInterval: 25,
            drawVerticalLine: false,
            getDrawingHorizontalLine: (val) => FlLine(
              color: AppColors.surfaceLight,
              strokeWidth: 1,
            ),
          ),
          borderData: FlBorderData(show: false),
        ),
      ),
    );
  }

  Widget _buildConsistencyChart(List<SleepSessionModel> sessions) {
    if (sessions.isEmpty) return const SizedBox.shrink();
    final spots = ref.watch(consistencySpotsProvider);

    return _buildChartCard(
      'Bedtime Consistency',
      'How regular your schedule is',
      LineChart(
        LineChartData(
          minY: 0,
          maxY: 100,
          lineTouchData: LineTouchData(
            enabled: true,
            touchTooltipData: LineTouchTooltipData(
              tooltipBgColor: AppColors.cardBg,
              getTooltipItems: (touchedSpots) => touchedSpots.map((t) {
                return LineTooltipItem(
                  '${t.y.toStringAsFixed(0)}',
                  GoogleFonts.outfit(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                );
              }).toList(),
            ),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: true,
              color: AppColors.purple,
              barWidth: 3,
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    AppColors.purple.withOpacity(0.2),
                    AppColors.purple.withOpacity(0.0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              dotData: FlDotData(
                getDotPainter: (spot, _, __, ___) => FlDotCirclePainter(
                  radius: 4,
                  color: AppColors.purple,
                  strokeWidth: 2,
                  strokeColor: AppColors.background,
                ),
              ),
            ),
          ],
          titlesData: FlTitlesData(
            bottomTitles: const AxisTitles(),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 25,
                getTitlesWidget: (val, meta) => Text(
                  '${val.toInt()}',
                  style: GoogleFonts.outfit(
                    color: AppColors.textMuted,
                    fontSize: 10,
                  ),
                ),
                reservedSize: 28,
              ),
            ),
            topTitles: const AxisTitles(),
            rightTitles: const AxisTitles(),
          ),
          gridData: FlGridData(
            horizontalInterval: 25,
            drawVerticalLine: false,
            getDrawingHorizontalLine: (val) => FlLine(
              color: AppColors.surfaceLight,
              strokeWidth: 1,
            ),
          ),
          borderData: FlBorderData(show: false),
        ),
      ),
      height: 180,
    );
  }

  Widget _buildBedtimeTrend(List<SleepSessionModel> sessions) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.surfaceLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent Sleep Times',
            style: GoogleFonts.outfit(
              color: AppColors.textPrimary,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          ...sessions.take(5).map((s) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  children: [
                    Text(
                      DateFormat('EEE, MMM d').format(s.sleepTime),
                      style: GoogleFonts.outfit(
                        color: AppColors.textSecondary,
                        fontSize: 13,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      DateFormat('h:mm a').format(s.sleepTime),
                      style: GoogleFonts.outfit(
                        color: AppColors.indigo,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text('→',
                        style: GoogleFonts.outfit(color: AppColors.textMuted)),
                    const SizedBox(width: 8),
                    Text(
                      DateFormat('h:mm a').format(s.wakeTime),
                      style: GoogleFonts.outfit(
                        color: AppColors.cyan,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildStageBreakdown(List<SleepSessionModel> sessions) {
    if (sessions.isEmpty) return const SizedBox.shrink();

    double totalLight = 0, totalDeep = 0, totalRem = 0, totalAwake = 0;
    for (final s in sessions) {
      totalLight += s.estimatedLightSleep;
      totalDeep += s.estimatedDeepSleep;
      totalRem += s.estimatedRemSleep;
      totalAwake += s.estimatedAwakeTime;
    }
    final total = totalLight + totalDeep + totalRem + totalAwake;

    return _buildChartCard(
      'Sleep Stage Breakdown',
      'Average distribution',
      PieChart(
        PieChartData(
          sections: [
            PieChartSectionData(
              value: totalLight / total * 100,
              color: AppColors.cyanDim,
              title: 'Light\n${(totalLight / total * 100).round()}%',
              titleStyle: GoogleFonts.outfit(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w600),
              radius: 80,
            ),
            PieChartSectionData(
              value: totalDeep / total * 100,
              color: AppColors.indigo,
              title: 'Deep\n${(totalDeep / total * 100).round()}%',
              titleStyle: GoogleFonts.outfit(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w600),
              radius: 80,
            ),
            PieChartSectionData(
              value: totalRem / total * 100,
              color: AppColors.purple,
              title: 'REM\n${(totalRem / total * 100).round()}%',
              titleStyle: GoogleFonts.outfit(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w600),
              radius: 80,
            ),
            PieChartSectionData(
              value: totalAwake / total * 100,
              color: AppColors.amber,
              title: 'Awake\n${(totalAwake / total * 100).round()}%',
              titleStyle: GoogleFonts.outfit(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w600),
              radius: 80,
            ),
          ],
          centerSpaceRadius: 40,
          sectionsSpace: 3,
        ),
      ),
      height: 220,
    );
  }

  Widget _buildSummaryCards(List<SleepSessionModel> sessions) {
    if (sessions.isEmpty) return const SizedBox.shrink();

    final avgScore =
        sessions.fold(0, (s, e) => s + e.sleepScore) / sessions.length;
    final avgDuration =
        sessions.fold(0.0, (s, e) => s + e.durationHours) / sessions.length;
    final avgInterruptions =
        sessions.fold(0, (s, e) => s + e.interruptions) / sessions.length;

    return Row(
      children: [
        Expanded(
            child: _buildSummaryCard(
                'Avg Score', '${avgScore.round()}', AppColors.indigo)),
        const SizedBox(width: 12),
        Expanded(
            child: _buildSummaryCard('Avg Duration',
                '${avgDuration.toStringAsFixed(1)}h', AppColors.cyan)),
        const SizedBox(width: 12),
        Expanded(
            child: _buildSummaryCard('Avg Wakes',
                avgInterruptions.toStringAsFixed(1), AppColors.amber)),
      ],
    );
  }

  Widget _buildSummaryCard(String label, String value, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: GoogleFonts.outfit(
              color: color,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            label,
            style: GoogleFonts.outfit(
              color: AppColors.textSecondary,
              fontSize: 11,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildChartCard(String title, String subtitle, Widget chart,
      {double height = 200}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.surfaceLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.outfit(
              color: AppColors.textPrimary,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            subtitle,
            style: GoogleFonts.outfit(
              color: AppColors.textMuted,
              fontSize: 11,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(height: height, child: chart),
        ],
      ),
    ).animate().fadeIn(duration: 400.ms);
  }
}
