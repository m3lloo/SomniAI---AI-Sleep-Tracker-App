// Quick Reference Guide - Design System
// Use this as a cheat sheet for implementing consistent design

# 🎨 DESIGN SYSTEM QUICK REFERENCE

## Spacing Values (Use These)
```
AppConstants.spacing4    = 4px    (tiny gap)
AppConstants.spacing8    = 8px    (small gap)
AppConstants.spacing10   = 10px   (small-medium gap)
AppConstants.spacing12   = 12px   (medium gap) ← Most common
AppConstants.spacing16   = 16px   (large gap)
AppConstants.spacing20   = 20px   (very large) ← Screen padding
AppConstants.spacing24   = 24px   (extra large)
AppConstants.spacing32   = 32px   (section padding)
```

## Border Radius (Use These)
```
AppBorderRadius.small       = 8px   (small elements)
AppBorderRadius.medium      = 12px  (regular elements)
AppBorderRadius.large       = 16px  (input fields, chips)
AppBorderRadius.card        = 24px  (main cards) ← Most common
AppBorderRadius.circular    = 999px (buttons, pills)
```

## Icon Sizes (Use These)
```
AppIconSize.extraSmall  = 16px  (tiny icons)
AppIconSize.small       = 20px  (small icons)
AppIconSize.medium      = 24px  (standard icons) ← Most common
AppIconSize.large       = 32px  (large icons)
AppIconSize.extraLarge  = 48px  (extra large icons)
```

## Animation Durations (Use These)
```
AppConstants.animationFast   = 200ms  (quick animations)
AppConstants.animationNormal = 400ms  (standard) ← Most common
AppConstants.animationSlow   = 600ms  (slower animations)
AppConstants.animationSlower = 800ms  (very slow animations)
```

---

## 📋 COMMON PATTERNS

### Pattern 1: Screen with Padding
```dart
ListView(
  padding: const EdgeInsets.fromLTRB(
    AppConstants.spacing20,  // left
    AppConstants.spacing4,   // top
    AppConstants.spacing20,  // right
    AppConstants.spacing20,  // bottom
  ),
  children: [
    // your content
  ],
)
```

### Pattern 2: Card with Content
```dart
SectionCard(
  title: 'Section Title',
  borderRadius: AppBorderRadius.large,
  child: Column(
    children: [
      YourWidget(),
      const SizedBox(height: AppConstants.spacing12),
      AnotherWidget(),
    ],
  ),
)
```

### Pattern 3: Input Field Container
```dart
InputCard(
  backgroundColor: AppColors.surfaceDark,
  borderColor: Colors.white.withOpacity(0.15),
  padding: const EdgeInsets.all(AppConstants.spacing12),
  child: TextField(
    decoration: const InputDecoration(hintText: 'Enter text...'),
  ),
)
```

### Pattern 4: Gradient Card (Featured Content)
```dart
GradientCard(
  gradient: AppColors.primaryGradient,
  padding: const EdgeInsets.all(AppConstants.spacing24),
  shadowOpacity: 0.35,
  child: YourContent(),
)
```

### Pattern 5: App Bar (All Screens)
```dart
appBar: AppAppBar(
  title: 'Screen Title',
  showBackButton: true,
  backgroundColor: AppColors.background,
)
```

---

## 🎯 DO's and DON'Ts

### ✅ DO
- Use `AppConstants.spacing*` for all spacing
- Use `AppBorderRadius.*` for all border radius
- Use `Theme.of(context).textTheme.*` for all text
- Use `AppAppBar` for all app bars
- Use reusable components from `lib/core/widgets/`

### ❌ DON'T
- Don't hardcode spacing values (5, 10, 15, 25, etc.)
- Don't hardcode border radius (14, 20, 28, etc.)
- Don't use `GoogleFonts.outfit()` directly
- Don't create local card/button components
- Don't use transparent AppBar without AppAppBar
- Don't mix spacing patterns

---

## 🚀 Checklist for New Features

- [ ] All spacing uses `AppConstants.spacing*`
- [ ] All border radius uses `AppBorderRadius.*`
- [ ] All text uses `Theme.of(context).textTheme.*`
- [ ] AppBar uses `AppAppBar` component
- [ ] Cards use `AppCard`, `SectionCard`, or `InputCard`
- [ ] No hardcoded padding values
- [ ] No hardcoded font sizes
- [ ] Imports include `package:sleepfamily/core/constants/design_tokens.dart`
- [ ] Imports include `package:sleepfamily/core/widgets/index.dart` if using components
- [ ] Consistent with surrounding screens

---

## 📱 Color Palette
```
Primary:        AppColors.primary (Purple #7F77DD)
Secondary:      AppColors.secondary (Orange #EF9F27)
Success:        AppColors.success (Green #1D9E75)
Warning:        AppColors.warning (Amber #EF9F27)
Error:          AppColors.error (Red #E35D5D)
Background:     AppColors.background (Very dark #0D0D1A)
Surface:        AppColors.surfaceDark (Dark #1A1A2E)
Text Primary:   AppColors.textPrimary (White)
Text Secondary: AppColors.textSecondary (Gray 60%)
```

