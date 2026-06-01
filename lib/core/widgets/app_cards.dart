// lib/core/widgets/app_cards.dart
import 'package:flutter/material.dart';
import '../constants/design_tokens.dart';
import '../themes/app_theme.dart';

/// A consistent card widget used throughout the app
/// Provides a unified look for all card-based content
class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderRadius;
  final BoxShadow? shadow;
  final LinearGradient? gradient;
  final VoidCallback? onTap;
  final double elevation;

  const AppCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(AppConstants.spacing16),
    this.backgroundColor,
    this.borderColor,
    this.borderRadius,
    this.shadow,
    this.gradient,
    this.onTap,
    this.elevation = AppElevation.small,
  });

  @override
  Widget build(BuildContext context) {
    final border = borderColor != null
        ? Border.all(
            color: borderColor!,
            width: 0.5,
          )
        : null;

    final boxShadow = shadow != null ? [shadow!] : null;

    Widget card = Container(
      decoration: BoxDecoration(
        color: gradient == null ? (backgroundColor ?? AppColors.surfaceDark) : null,
        gradient: gradient,
        borderRadius: BorderRadius.circular(borderRadius ?? AppBorderRadius.card),
        border: border,
        boxShadow: boxShadow,
      ),
      child: Padding(
        padding: padding,
        child: child,
      ),
    );

    if (onTap != null) {
      card = Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(borderRadius ?? AppBorderRadius.card),
          child: card,
        ),
      );
    }

    return card;
  }
}

/// A section card with a title and optional icon
/// Commonly used for grouped content with headers
class SectionCard extends StatelessWidget {
  final String title;
  final Widget child;
  final IconData? titleIcon;
  final Color? backgroundColor;
  final EdgeInsets padding;
  final double? borderRadius;
  final Color? borderColor;
  final VoidCallback? onTap;

  const SectionCard({
    super.key,
    required this.title,
    required this.child,
    this.titleIcon,
    this.backgroundColor,
    this.padding = const EdgeInsets.all(AppConstants.spacing16),
    this.borderRadius,
    this.borderColor = const Color.fromARGB(255, 255, 255, 25),
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      borderRadius: borderRadius ?? AppBorderRadius.large,
      onTap: onTap,
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (titleIcon != null) ...[
                Icon(
                  titleIcon,
                  color: AppColors.primary,
                  size: AppIconSize.small,
                ),
                const SizedBox(width: AppConstants.spacing8),
              ],
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppConstants.spacing12),
          child,
        ],
      ),
    );
  }
}

/// A card with gradient background and shadow
/// Used for highlighted/featured content like sleep scores
class GradientCard extends StatelessWidget {
  final LinearGradient gradient;
  final Widget child;
  final EdgeInsets padding;
  final double borderRadius;
  final Color shadowColor;
  final double shadowBlur;
  final Offset shadowOffset;
  final double shadowOpacity;

  const GradientCard({
    super.key,
    required this.gradient,
    required this.child,
    this.padding = const EdgeInsets.all(AppConstants.spacing24),
    this.borderRadius = AppBorderRadius.card,
    this.shadowColor = Colors.black,
    this.shadowBlur = 24,
    this.shadowOffset = const Offset(0, 8),
    this.shadowOpacity = 0.35,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      gradient: gradient,
      borderRadius: borderRadius,
      padding: padding,
      shadow: BoxShadow(
        color: shadowColor.withOpacity(shadowOpacity),
        blurRadius: shadowBlur,
        offset: shadowOffset,
      ),
      child: child,
    );
  }
}

/// A simple input card used for text fields and time pickers
class InputCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsets padding;
  final Color? backgroundColor;
  final Color? borderColor;

  const InputCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding = const EdgeInsets.all(AppConstants.spacing12),
    this.backgroundColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      backgroundColor: backgroundColor ?? AppColors.surfaceDark,
      borderColor: borderColor ?? Colors.white.withOpacity(0.15),
      borderRadius: AppBorderRadius.large,
      onTap: onTap,
      padding: padding,
      child: child,
    );
  }
}
