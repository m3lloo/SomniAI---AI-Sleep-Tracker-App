import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:somni_ai/core/themes/app_theme.dart';
import 'package:somni_ai/core/themes/theme_mode_provider.dart';
import 'package:somni_ai/core/services/secure_storage_service.dart';
import 'package:somni_ai/core/constants/design_tokens.dart';
import 'package:somni_ai/core/widgets/index.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  bool _notificationsEnabled = true;
  double _sleepGoal = 8.0;
  String _wakeUpTime = '07:00';
  String _bedtimeReminder = '23:00';
  final TextEditingController _geminiApiKeyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadGeminiApiKey();
  }

  @override
  void dispose() {
    _geminiApiKeyController.dispose();
    super.dispose();
  }

  Future<void> _loadGeminiApiKey() async {
    final apiKey = await SecureStorageService.readGeminiApiKey();
    if (!mounted) return;
    setState(() {
      _geminiApiKeyController.text = apiKey;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = ref.watch(themeModeProvider) == ThemeMode.dark;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppAppBar(
        title: 'Settings',
        showBackButton: true,
        backgroundColor: AppColors.background,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppConstants.spacing20,
          AppConstants.spacing4,
          AppConstants.spacing20,
          AppConstants.spacing20,
        ),
        children: [
          _HeaderCard(
            title: 'Personalize your sleep setup',
            subtitle:
                'Tune reminders, preferences, and AI features from one place.',
            icon: Icons.settings_rounded,
          ),
          const SizedBox(height: AppConstants.spacing20),
          _SectionHeader(title: 'Profile'),
          const SizedBox(height: AppConstants.spacing12),
          _SurfaceCard(
            child: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Age',
                    prefixIcon: Icon(Icons.person_outline_rounded),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: AppConstants.spacing12),
                Row(
                  children: [
                    Icon(Icons.bedtime_outlined, color: AppColors.primary),
                    const SizedBox(width: AppConstants.spacing12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sleep Goal',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          Text(
                            '${_sleepGoal.toStringAsFixed(1)} hours',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Slider(
                  value: _sleepGoal,
                  min: 5,
                  max: 12,
                  divisions: 14,
                  label: '${_sleepGoal.toStringAsFixed(1)}h',
                  activeColor: AppColors.primary,
                  onChanged: (value) => setState(() => _sleepGoal = value),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppConstants.spacing20),
          _SectionHeader(title: 'Sleep Schedule'),
          const SizedBox(height: AppConstants.spacing12),
          _SurfaceCard(
            child: Column(
              children: [
                _TimeSettingTile(
                  label: 'Wake Up Time',
                  time: _wakeUpTime,
                  icon: Icons.wb_sunny_rounded,
                  onChanged: (value) => setState(() => _wakeUpTime = value),
                ),
                const Divider(height: 24),
                _TimeSettingTile(
                  label: 'Bedtime Reminder',
                  time: _bedtimeReminder,
                  icon: Icons.nightlight_round,
                  onChanged: (value) =>
                      setState(() => _bedtimeReminder = value),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppConstants.spacing20),
          _SectionHeader(title: 'Notifications'),
          const SizedBox(height: AppConstants.spacing12),
          _SurfaceCard(
            child: SwitchListTile.adaptive(
              contentPadding: EdgeInsets.zero,
              title: const Text('Enable Notifications'),
              subtitle: const Text('Reminders and sleep updates'),
              value: _notificationsEnabled,
              onChanged: (value) {
                HapticFeedback.selectionClick();
                setState(() => _notificationsEnabled = value);
              },
            ),
          ),
          const SizedBox(height: AppConstants.spacing20),
          _SectionHeader(title: 'AI Settings'),
          const SizedBox(height: AppConstants.spacing12),
          _SurfaceCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Gemini API Key',
                    style: Theme.of(context).textTheme.labelLarge),
                const SizedBox(height: AppConstants.spacing12),
                TextField(
                  obscureText: true,
                  controller: _geminiApiKeyController,
                  decoration: InputDecoration(
                    hintText: 'Paste your Gemini API key',
                    prefixIcon: Icon(Icons.key_rounded),
                  ),
                ),
                const SizedBox(height: AppConstants.spacing12),
                SizedBox(
                  width: double.infinity,
                  height: 44,
                  child: FilledButton(
                    onPressed: () async {
                      final messenger = ScaffoldMessenger.of(context);
                      await _saveGeminiApiKey(_geminiApiKeyController.text);
                      if (!mounted) return;
                      messenger.showSnackBar(
                        SnackBar(
                          content: const Text('API key saved successfully ✓'),
                          backgroundColor: AppColors.tertiary,
                          duration: const Duration(seconds: 2),
                          behavior: SnackBarBehavior.floating,
                          margin: const EdgeInsets.all(16),
                        ),
                      );
                    },
                    child: const Text('Save API Key'),
                  ),
                ),
                const SizedBox(height: AppConstants.spacing8),
                Text(
                  'Get your free API key at console.cloud.google.com',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
          ),
          const SizedBox(height: AppConstants.spacing20),
          _SectionHeader(title: 'Display'),
          const SizedBox(height: AppConstants.spacing12),
          _SurfaceCard(
            child: SwitchListTile.adaptive(
              contentPadding: EdgeInsets.zero,
              title: const Text('Dark Mode'),
              subtitle: const Text('Use the system-first dark theme'),
              value: isDark,
              onChanged: (value) {
                HapticFeedback.selectionClick();
                ref.read(themeModeProvider.notifier).state =
                    value ? ThemeMode.dark : ThemeMode.light;
                setState(() {});
              },
            ),
          ),
          const SizedBox(height: AppConstants.spacing20),
          _SectionHeader(title: 'Data'),
          const SizedBox(height: AppConstants.spacing12),
          _SurfaceCard(
            child: Column(
              children: [
                _SettingsTile(
                  icon: Icons.download_rounded,
                  label: 'Export Sleep Data',
                  onTap: _showExportSheet,
                ),
                const Divider(height: 1),
                _SettingsTile(
                  icon: Icons.delete_outline_rounded,
                  label: 'Clear All Data',
                  destructive: true,
                  onTap: _showDeleteConfirmDialog,
                ),
              ],
            ),
          ),
          const SizedBox(height: AppConstants.spacing20),
          _SectionHeader(title: 'About'),
          const SizedBox(height: AppConstants.spacing12),
          _SurfaceCard(
            child: Column(
              children: [
                _SettingsRow(label: 'Version', value: '1.0.0'),
                const SizedBox(height: AppConstants.spacing12),
                _SettingsTile(
                  icon: Icons.privacy_tip_outlined,
                  label: 'Privacy Policy',
                  onTap: _showPrivacySheet,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _saveGeminiApiKey(String value) async {
    await SecureStorageService.saveGeminiApiKey(value);
  }

  void _showExportSheet() {
    HapticFeedback.mediumImpact();
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.surfaceDark,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
            const Text('Export sleep data'),
            const SizedBox(height: 8),
            Text(
              'Your data will be prepared as a local export.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  HapticFeedback.selectionClick();
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Data exported')),
                  );
                },
                child: const Text('Export'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showPrivacySheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.surfaceDark,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
            const Text('Privacy Policy'),
            const SizedBox(height: 8),
            Text(
              'Your sleep data is stored locally in this app. Future cloud or AI integrations should always be opt-in.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                  ),
            ),
            const SizedBox(height: 14),
            Text(
              'You control what is saved, exported, or cleared from Settings.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteConfirmDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.surfaceDark,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          title: const Text('Delete All Data?'),
          content: const Text(
            'This action cannot be undone. All your sleep logs will be permanently deleted.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.error,
              ),
              onPressed: () {
                HapticFeedback.mediumImpact();
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Data cleared')),
                );
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}

class _HeaderCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  const _HeaderCard(
      {required this.title, required this.subtitle, required this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.spacing16,
        vertical: AppConstants.spacing12,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.secondary.withOpacity(0.12),
            AppColors.primary.withOpacity(0.08),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppBorderRadius.large),
        border: Border.all(
          color: AppColors.secondary.withOpacity(0.25),
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
            child: Icon(icon, color: Colors.white, size: 16),
          ),
          const SizedBox(width: AppConstants.spacing12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w600,
                        )),
                const SizedBox(height: 4),
                Text(subtitle,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: AppColors.textMuted,
                        )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SurfaceCard extends StatelessWidget {
  final Widget child;
  const _SurfaceCard({required this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surfaceDark,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withOpacity(0.15), width: 0.5),
      ),
      child: child,
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});
  @override
  Widget build(BuildContext context) =>
      Text(title, style: Theme.of(context).textTheme.labelMedium);
}

class _TimeSettingTile extends StatelessWidget {
  final String label;
  final String time;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const _TimeSettingTile(
      {required this.label,
      required this.time,
      required this.icon,
      required this.onChanged});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: AppColors.primary),
        const SizedBox(width: 12),
        Expanded(child: Text(label)),
        Text(time,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.w700)),
      ],
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool destructive;
  final VoidCallback onTap;
  const _SettingsTile(
      {required this.icon,
      required this.label,
      required this.onTap,
      this.destructive = false});
  @override
  Widget build(BuildContext context) {
    final color = destructive ? AppColors.error : AppColors.primary;
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: color),
      title: Text(label),
      trailing:
          Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.textMuted),
      onTap: onTap,
    );
  }
}

class _SettingsRow extends StatelessWidget {
  final String label;
  final String value;
  const _SettingsRow({required this.label, required this.value});
  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(value,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: AppColors.textMuted)),
        ],
      );
}
