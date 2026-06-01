# 🌙 Somni AI - AI Sleep Tracker App

[![CI/CD Pipeline](https://github.com/YOUR_USERNAME/somni_ai/actions/workflows/ci.yml/badge.svg)](https://github.com/YOUR_USERNAME/somni_ai/actions)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Flutter](https://img.shields.io/badge/Flutter-3.0%2B-blue?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.0%2B-blue?logo=dart)](https://dart.dev)
[![Gemini API](https://img.shields.io/badge/AI-Gemini%202.5%20Flash-yellow?logo=google)](https://ai.google.dev)

A modern **Flutter-based sleep tracking application** powered by **Google Gemini AI**. Somni AI helps users monitor, analyze, and improve their sleep quality through intelligent tracking, pattern analysis, and personalized AI-generated insights.

## ✨ Features

### Core Features

- **📊 Sleep Logging & Tracking**
  - Manual sleep entry (bedtime, wake time, sleep duration)
  - Sleep quality self-rating (1-5 stars)
  - Mood tags (rested, groggy, anxious, energetic, refreshed, tired)
  - Dream journal entries
  - Nap tracking

- **🤖 Gemini AI Integration**
  - **Sleep Analysis**: Analyze sleep patterns from last 7-30 days
  - **Personalized Tips**: Custom sleep hygiene recommendations based on habits
  - **Dream Interpretation**: Reflective dream analysis
  - **Morning Briefing**: Daily motivational summaries
  - **AI Chatbot**: Conversational assistant for sleep-related questions

- **📈 Analytics Dashboard**
  - Weekly and monthly sleep charts
  - Average sleep duration and consistency scores
  - Sleep quality trends
  - Best/worst sleep days highlighted
  - Sleep debt calculator
  - Sleep score out of 100

- **🔔 Smart Notifications**
  - Customizable bedtime reminders
  - Wake-up alarms with gentle vibration
  - Weekly AI report notifications

- **👤 User Profile & Settings**
  - Age and sleep goal configuration
  - Wake-up time preferences
  - Dark/light mode toggle (dark recommended)
  - Gemini API key configuration
  - Data export (CSV/JSON)

## 🏗️ Project Architecture

### Tech Stack

```
Frontend:        Flutter (Dart 3.0+)
AI Engine:       Google Gemini 1.5 Flash API
Local Storage:   Isar Database
State Management: Riverpod 2.x
Charts:          fl_chart
Notifications:   flutter_local_notifications
HTTP Client:     dio
UI Framework:    Material 3
Fonts:           Nunito
```

### Directory Structure

```
lib/
├── core/
│   ├── constants/          # App constants
│   ├── models/             # Data models (SleepLog, AIInsight, UserProfile)
│   ├── repositories/       # Data repositories
│   ├── themes/             # App theme (AppColors, AppTheme)
│   └── services/           # Core services
├── features/
│   ├── home/               # Home/Dashboard screen
│   ├── sleep_logging/      # Log sleep screen
│   ├── analytics/          # Analytics screen
│   ├── ai_chat/            # AI Chat screen
│   ├── dream_journal/      # Dream journal screen
│   ├── settings/           # Settings screen
│   ├── onboarding/         # Onboarding flow
│   └── navigation/         # Main navigation
├── services/
│   └── ai/                 # Gemini AI service
└── main.dart
```

## 🎨 Design System

### Color Palette (Somni AI Theme)

- **Primary**: Deep Indigo (#4F46E5) - Calm, trust, focus
- **Secondary**: Warm Amber (#FB923C) - Energy, alertness
- **Tertiary**: Soft Lavender (#C084FC) - Relaxation, peace
- **Background**: Midnight Navy (#0F1419)
- **Surface**: Dark Blue (#1A2332)

### Typography

- **Font**: Nunito (clean, modern, readable)
- **Light (300)**: Secondary text
- **Regular (400)**: Body text
- **SemiBold (600)**: Emphasized text
- **Bold (700)**: Headlines and titles

### UI Components

- Rounded corners (12-20px) for soft, calming appearance
- Gentle transitions and animations
- Moon/star micro-animations on home screen
- Minimal, wellness-focused design
- No harsh colors or cluttered layouts

## 📱 Screens

1. **Onboarding Screen** - Initial setup (sleep goal, age, API key)
2. **Home/Dashboard** - Today's sleep, AI tip, weekly overview
3. **Log Sleep** - Add/edit sleep entries with mood tags
4. **Analytics** - Sleep metrics, charts, trends
5. **AI Insights** - Gemini-generated weekly analysis
6. **AI Chat** - Conversational AI assistant
7. **Dream Journal** - Log and interpret dreams
8. **Settings** - Profile, notifications, API configuration

## 🚀 Getting Started

### Prerequisites

- Flutter SDK 3.0+
- Dart 3.0+
- Android Studio or Xcode
- Google Generative AI API key ([Get it here](https://console.cloud.google.com))

### Installation

1. **Install dependencies**
   ```bash
   flutter pub get
   ```

2. **Generate code (Isar & Riverpod)**
   ```bash
   flutter pub run build_runner build
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Configuration

1. **Get Gemini API Key**
   - Go to [Google Cloud Console](https://console.cloud.google.com)
   - Create a new project
   - Enable the Generative Language API
   - Create an API key
   - Copy the key

2. **Configure in App**
   - Open Settings in the app
   - Paste your Gemini API key
   - Save

## 💾 Data Privacy

- **Local-First**: All sleep logs stored locally on-device using Isar
- **Minimal Sharing**: Only anonymized, aggregated data sent to Gemini
- **User Control**: Users can view, export, or delete data anytime
- **No Tracking**: No analytics or user tracking

## 📊 Sleep Data Model

```dart
class SleepLogModel {
  final DateTime bedTime;
  final DateTime wakeTime;
  final double sleepDuration;        // in hours
  final int sleepQuality;            // 1-5 stars
  final DateTime logDate;
  final String? dreamNotes;
  final List<String> moodTags;       // rested, groggy, etc.
  final String? notes;
}
```

## 🤖 Gemini API Integration

### Example Usage

```dart
final geminiService = GeminiAIService(apiKey: apiKey);

// Analyze sleep data
final analysis = await geminiService.analyzeSleepData(sleepLogs);

// Generate tips
final tips = await geminiService.generatePersonalizedTips(
  sleepLogs,
  userProfile,
);

// Interpret dreams
final interpretation = await geminiService.interpretDream(dreamDescription);

// Chat
final response = await geminiService.chat("Why do I feel tired?");
```

## 📦 Dependencies

Key packages:

- `flutter_riverpod` - State management
- `isar` - Local database
- `google_generative_ai` - Gemini API
- `fl_chart` - Charts & graphs
- `flutter_local_notifications` - Push notifications
- `dio` - HTTP client
- `google_fonts` - Typography
- `intl` - Internationalization
- `lottie` - Animations

See `pubspec.yaml` for complete list.

## 📝 Gemini Prompt Structure

The app sends structured prompts to Gemini:

```
You are a sleep health assistant. Analyze the following sleep data and provide:
1. A short summary of sleep patterns
2. Key observations
3. Personalized recommendations

Sleep Data:
[User's sleep logs from last 7-30 days]

[User's profile information]

Respond in a warm, friendly, non-clinical tone suitable for a wellness app.
```

## 🛣️ Future Enhancements

- [ ] Device sensor integration (accelerometer for movement)
- [ ] Sleep stage tracking (REM, light, deep)
- [ ] Export to health apps (Apple Health, Google Fit)
- [ ] Social features (share achievements)
- [ ] Wearable device integration
- [ ] Sleep coaching program
- [ ] Advanced ML sleep prediction
- [ ] Offline Gemini capabilities

## � CI/CD Pipeline

This project uses **GitHub Actions** for continuous integration and deployment:

### Workflow: `ci.yml`

**Runs on:**
- Push to `main` or `develop` branches
- Pull requests to `main` or `develop`

**Jobs:**

1. **Test & Analyze** (runs on every push/PR)
   - ✓ Flutter setup
   - ✓ Dependency resolution
   - ✓ Code analysis (`flutter analyze`)
   - ✓ Format checking (`dart format`)
   - ✓ Unit tests (`flutter test`)
   - ✓ Code generation (`build_runner`)

2. **Build APK** (runs on `main` branch push only)
   - ✓ Builds release APK
   - ✓ Uploads artifact for download
   - ✓ Depends on "Test & Analyze" job

3. **Code Quality** (runs on every push/PR)
   - ✓ Unused imports check
   - ✓ Lint analysis
   - ✓ Code style enforcement

### Running Locally

```bash
# Analyze code
flutter analyze

# Run tests
flutter test

# Format code
dart format .

# Generate code
flutter pub run build_runner build

# Build APK
flutter build apk --release

# Build iOS
flutter build ios --release
```

### GitHub Actions Badge

Add the badge to your README (already included above):

```markdown
[![CI/CD Pipeline](https://github.com/YOUR_USERNAME/somni_ai/actions/workflows/ci.yml/badge.svg)](https://github.com/YOUR_USERNAME/somni_ai/actions)
```

*Replace `YOUR_USERNAME` with your actual GitHub username after creating the repository.*

## �📄 License

This project is licensed under the MIT License.

---

**Made with ❤️ for better sleep** 🌙
