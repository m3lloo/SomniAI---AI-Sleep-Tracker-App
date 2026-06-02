import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:somni_ai/core/themes/app_theme.dart';
import 'package:somni_ai/features/ai_chat/presentation/screens/ai_chat_screen.dart';
import 'package:somni_ai/features/sleep_tracking/presentation/screens/home_screen.dart';
import 'package:somni_ai/features/sleep_logging/presentation/screens/log_sleep_screen.dart';
import 'package:somni_ai/features/sleep_tracking/presentation/screens/analytics_screen.dart';
import 'package:somni_ai/features/settings/presentation/screens/settings_screen.dart';

/// Connectivity provider to check if device is online
final connectivityProvider = StreamProvider<bool>((ref) async* {
  final connectivity = Connectivity();

  // Initial check
  final result = await connectivity.checkConnectivity();
  yield !result.contains(ConnectivityResult.none);

  // Listen to connectivity changes
  await for (final result in connectivity.onConnectivityChanged) {
    yield !result.contains(ConnectivityResult.none);
  }
});

class MainNavigationScreen extends ConsumerStatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  ConsumerState<MainNavigationScreen> createState() =>
      _MainNavigationScreenState();
}

class _MainNavigationScreenState extends ConsumerState<MainNavigationScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    LogSleepScreen(),
    AnalyticsScreen(),
    AIChatScreen(),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isOnlineAsync = ref.watch(connectivityProvider);

    // Properly extract the boolean value from AsyncValue
    final isOnlineValue = isOnlineAsync.maybeWhen(
      data: (isOnline) => isOnline,
      orElse: () => false, // Default to offline if loading/error
    );

    // If offline and trying to access AI, redirect to Home
    int displayIndex = _selectedIndex;
    if (!isOnlineValue && _selectedIndex == 3) {
      displayIndex = 0; // Show Home instead
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      body: _screens[displayIndex],
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(16, 0, 16, 20),
        child: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: AppColors.surfaceDark,
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: Colors.white.withOpacity(0.15)),
          ),
          child: Row(
            children: [
              _NavItem(
                label: 'Home',
                icon: Icons.home_outlined,
                selectedIcon: Icons.home,
                selected: _selectedIndex == 0,
                onTap: () => _onItemTapped(0),
              ),
              _NavItem(
                label: 'Log',
                icon: Icons.add_circle_outline,
                selectedIcon: Icons.add_circle,
                selected: _selectedIndex == 1,
                onTap: () => _onItemTapped(1),
              ),
              _NavItem(
                label: 'Analytics',
                icon: Icons.analytics_outlined,
                selectedIcon: Icons.analytics,
                selected: _selectedIndex == 2,
                onTap: () => _onItemTapped(2),
              ),
              _NavItem(
                label: 'AI',
                icon: Icons.auto_awesome_outlined,
                selectedIcon: Icons.auto_awesome,
                selected: isOnlineValue && _selectedIndex == 3,
                onTap: () {
                  if (!isOnlineValue) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text(
                            'Connect to internet to chat with Somnus 🌐'),
                        backgroundColor: AppColors.error,
                        duration: const Duration(seconds: 2),
                        behavior: SnackBarBehavior.floating,
                        margin: const EdgeInsets.all(16),
                      ),
                    );
                  } else {
                    _onItemTapped(3);
                  }
                },
                enabled: isOnlineValue,
              ),
              _NavItem(
                label: 'Settings',
                icon: Icons.settings_outlined,
                selectedIcon: Icons.settings,
                selected: _selectedIndex == 4,
                onTap: () => _onItemTapped(4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final IconData selectedIcon;
  final bool selected;
  final VoidCallback onTap;
  final bool enabled;

  const _NavItem({
    required this.label,
    required this.icon,
    required this.selectedIcon,
    required this.selected,
    required this.onTap,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(999),
          onTap: enabled ? onTap : null,
          splashColor: AppColors.primary.withOpacity(0.1),
          highlightColor: Colors.transparent,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            height: 52,
            decoration: BoxDecoration(
              color: selected ? AppColors.primary : Colors.transparent,
              borderRadius: BorderRadius.circular(999),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  selected ? selectedIcon : icon,
                  color: enabled
                      ? (selected ? Colors.white : AppColors.textMuted)
                      : AppColors.textMuted.withOpacity(0.4),
                  size: 22,
                ),
                AnimatedOpacity(
                  opacity: selected ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  child: SizedBox(
                    height: selected ? 16 : 0,
                    child: selected
                        ? Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              label,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 9,
                                  ),
                            ),
                          )
                        : null,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
