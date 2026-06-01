// lib/core/widgets/app_bar.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/design_tokens.dart';
import '../themes/app_theme.dart';

/// A consistent AppBar used throughout the app
/// Can be used as a standard AppBar or SliverAppBar
class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData? leadingIcon;
  final VoidCallback? onLeadingTap;
  final List<Widget>? actions;
  final bool showBackButton;
  final Color? backgroundColor;
  final double elevation;
  final double? titleFontSize;
  final FontWeight? titleFontWeight;

  const AppAppBar({
    super.key,
    required this.title,
    this.leadingIcon,
    this.onLeadingTap,
    this.actions,
    this.showBackButton = false,
    this.backgroundColor,
    this.elevation = 0,
    this.titleFontSize,
    this.titleFontWeight = FontWeight.w700,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? AppColors.background,
      elevation: elevation,
      automaticallyImplyLeading: showBackButton,
      leading: leadingIcon != null
          ? IconButton(
              icon: Icon(leadingIcon),
              onPressed: onLeadingTap,
              color: AppColors.textPrimary,
              iconSize: AppIconSize.medium,
            )
          : null,
      title: Text(
        title,
        style: GoogleFonts.outfit(
          fontSize: titleFontSize ?? 20,
          fontWeight: titleFontWeight ?? FontWeight.w700,
          color: AppColors.textPrimary,
        ),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

/// A custom SliverAppBar that matches the home screen design
/// Includes brand icon and theme toggle
class AppSliverAppBar extends StatelessWidget {
  final String appTitle;
  final void Function(bool isDark) onThemeToggle;
  final bool isDarkMode;
  final VoidCallback? onNotificationTap;
  final List<Widget>? actions;
  final double elevation;

  const AppSliverAppBar({
    super.key,
    required this.appTitle,
    required this.onThemeToggle,
    required this.isDarkMode,
    this.onNotificationTap,
    this.actions,
    this.elevation = 0,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.background,
      floating: true,
      snap: true,
      elevation: elevation,
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
                    borderRadius: BorderRadius.circular(AppBorderRadius.small),
                  ),
                  child: const Icon(
                    Icons.nightlight_round,
                    color: Colors.white,
                    size: AppIconSize.extraSmall,
                  ),
                ),
                const SizedBox(width: AppConstants.spacing10),
                Text(
                  appTitle,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  tooltip: isDarkMode ? 'Switch to light theme' : 'Switch to dark theme',
                  onPressed: () => onThemeToggle(isDarkMode),
                  icon: Icon(
                    isDarkMode ? Icons.light_mode : Icons.dark_mode,
                    color: AppColors.textSecondary,
                    size: AppIconSize.medium,
                  ),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints.tightFor(
                    width: 36,
                    height: 36,
                  ),
                ),
                if (onNotificationTap != null)
                  IconButton(
                    onPressed: onNotificationTap,
                    icon: Icon(
                      Icons.notifications_outlined,
                      color: AppColors.textSecondary,
                      size: AppIconSize.medium,
                    ),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints.tightFor(
                      width: 36,
                      height: 36,
                    ),
                  ),
                ...(actions ?? []),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// A header widget for screen sections
/// Used to display section titles with optional actions
class ScreenHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? icon;
  final VoidCallback? onActionTap;
  final IconData? actionIcon;
  final EdgeInsets padding;

  const ScreenHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    this.onActionTap,
    this.actionIcon,
    this.padding = const EdgeInsets.symmetric(
      horizontal: AppConstants.spacing20,
      vertical: AppConstants.spacing12,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    if (icon != null) ...[
                      Icon(
                        icon,
                        color: AppColors.primary,
                        size: AppIconSize.medium,
                      ),
                      const SizedBox(width: AppConstants.spacing8),
                    ],
                    Expanded(
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColors.textPrimary,
                            ),
                      ),
                    ),
                  ],
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: AppConstants.spacing4),
                  Text(
                    subtitle!,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                  ),
                ],
              ],
            ),
          ),
          if (onActionTap != null && actionIcon != null)
            IconButton(
              onPressed: onActionTap,
              icon: Icon(
                actionIcon,
                color: AppColors.primary,
                size: AppIconSize.medium,
              ),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints.tightFor(
                width: 44,
                height: 44,
              ),
            ),
        ],
      ),
    );
  }
}
