import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:somni_ai/core/themes/app_theme.dart';
import 'package:somni_ai/features/navigation/presentation/screens/main_navigation_screen.dart';

class OnboardingSlidesScreen extends StatefulWidget {
  const OnboardingSlidesScreen({super.key});

  @override
  State<OnboardingSlidesScreen> createState() => _OnboardingSlidesScreenState();
}

class _OnboardingSlidesScreenState extends State<OnboardingSlidesScreen> {
  final PageController _controller = PageController();
  int _index = 0;

  final List<Map<String, String>> _slides = [
    {
      'title': 'Track your sleep',
      'subtitle': 'Start, stop, and log sleep sessions effortlessly',
    },
    {
      'title': 'Understand patterns',
      'subtitle': 'Visualize duration, sleep score, and stages over time',
    },
    {
      'title': 'Get AI insights',
      'subtitle': 'Personalized tips and trends powered by AI',
    },
  ];

  Future<void> _completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seen_onboarding', true);
    if (!mounted) return;
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const MainNavigationScreen()));
  }

  bool _requesting = false;

  Future<void> _requestPermissions() async {
    setState(() => _requesting = true);
    await Permission.microphone.request();
    await Permission.storage.request();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seen_onboarding', true);
    setState(() => _requesting = false);
    if (!mounted) return;
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const MainNavigationScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: _slides.length,
                onPageChanged: (i) => setState(() => _index = i),
                itemBuilder: (context, i) {
                  // Final slide shows permission request UI inline
                  if (i == _slides.length - 1) {
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Get AI insights',
                              style: GoogleFonts.outfit(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.textPrimary)),
                          const SizedBox(height: 12),
                          Text(
                              'To provide personalized insights we need a few permissions',
                              style: GoogleFonts.outfit(
                                  color: AppColors.textSecondary),
                              textAlign: TextAlign.center),
                          const SizedBox(height: 24),
                          _permissionTile('Microphone',
                              'Required for audio-based tracking and snore detection'),
                          const SizedBox(height: 12),
                          _permissionTile('Storage',
                              'Store anonymized session data locally'),
                        ],
                      ),
                    );
                  }

                  final slide = _slides[i];
                  return Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 220,
                          height: 220,
                          decoration: BoxDecoration(
                            color: AppColors.cardBg,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: AppColors.surfaceLight),
                          ),
                          child: Center(
                              child: Text(slide['title']!,
                                  style: GoogleFonts.outfit(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700))),
                        ),
                        const SizedBox(height: 24),
                        Text(slide['title']!,
                            style: GoogleFonts.outfit(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textPrimary)),
                        const SizedBox(height: 12),
                        Text(slide['subtitle']!,
                            style: GoogleFonts.outfit(
                                color: AppColors.textSecondary),
                            textAlign: TextAlign.center),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
                  List.generate(_slides.length, (i) => _buildDot(i == _index)),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Row(
                children: [
                  TextButton(
                    onPressed: () => _completeOnboarding(),
                    child: Text('Skip',
                        style: GoogleFonts.outfit(color: AppColors.textMuted)),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: _requesting
                        ? null
                        : () async {
                            if (_index == _slides.length - 1) {
                              // Request permissions inline and navigate onward
                              await _requestPermissions();
                            } else {
                              _controller.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut);
                            }
                          },
                    child: _requesting
                        ? const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : Text(_index == _slides.length - 1
                            ? 'Get Started'
                            : 'Next'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDot(bool active) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      margin: const EdgeInsets.symmetric(horizontal: 6),
      width: active ? 20 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: active ? AppColors.primary : AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  Widget _permissionTile(String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.surfaceLight),
      ),
      child: Row(
        children: [
          Icon(Icons.lock_open, color: AppColors.indigo),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: GoogleFonts.outfit(fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                Text(subtitle,
                    style: GoogleFonts.outfit(
                        color: AppColors.textSecondary, fontSize: 12)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
