import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/themes/app_theme.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool _requesting = false;

  Future<void> _requestPermissions() async {
    setState(() => _requesting = true);
    // Request microphone and storage permissions as an example
    await Permission.microphone.request();
    await Permission.storage.request();
    setState(() => _requesting = false);
    // Persist that onboarding/permission flow was shown
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seen_onboarding', true);
    if (!mounted) return;
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Welcome',
            style: GoogleFonts.outfit(color: AppColors.textPrimary)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome to SomniAI',
                style: GoogleFonts.outfit(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary)),
            const SizedBox(height: 12),
            Text(
                'SomniAI tracks your sleep and provides insights. To enable tracking, please grant the required permissions.',
                style: GoogleFonts.outfit(color: AppColors.textSecondary)),
            const SizedBox(height: 24),
            Text('Permissions requested',
                style: GoogleFonts.outfit(
                    fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
            const SizedBox(height: 8),
            _permissionTile('Microphone',
                'Required for audio-based tracking and snore detection'),
            const SizedBox(height: 8),
            _permissionTile('Storage', 'Store anonymized session data locally'),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _requesting ? null : _requestPermissions,
              child: _requesting
                  ? const CircularProgressIndicator()
                  : Text('Enable Permissions'),
            ),
          ],
        ),
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
