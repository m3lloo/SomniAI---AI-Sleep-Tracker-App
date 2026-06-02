import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:somni_ai/core/themes/app_theme.dart';
import 'package:flutter/services.dart';
import 'package:somni_ai/core/themes/theme_mode_provider.dart';
import 'package:somni_ai/local_database/database/database_service.dart';
import 'package:somni_ai/core/screens/splash_launcher.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Drift database
  await DatabaseService().init();

  // Enable edge-to-edge (full screen) and match system bars to app background
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: AppColors.background,
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.light,
  ));

  runApp(
    const ProviderScope(
      child: SomniAIApp(),
    ),
  );
}

class SomniAIApp extends ConsumerWidget {
  const SomniAIApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final lightTheme = AppTheme.light;
    final darkTheme = AppTheme.dark;

    return MaterialApp(
      title: 'Somni AI',
      debugShowCheckedModeBanner: false,
      // Wrap app with a top SafeArea to avoid device camera cutouts / punch-holes
      builder: (context, child) =>
          SafeArea(top: true, bottom: false, child: child ?? const SizedBox()),
      // Localization delegates removed temporarily to avoid analyzer issues
      // Add back if `flutter_localizations` is available in your SDK.
      supportedLocales: const [Locale('en')],
      themeMode: themeMode,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const SplashLauncher(),
    );
  }
}
