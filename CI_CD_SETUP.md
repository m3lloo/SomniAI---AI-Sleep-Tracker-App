# 🔄 CI/CD & GitHub Actions Setup Guide - Somni AI

## Overview

Your project now includes automated testing, code analysis, and building through **GitHub Actions**.

---

## 📋 Workflows

### 1. **CI Pipeline** (`ci.yml`)
**Triggered on:** Push to `main`/`develop` or PR

**What it does:**
- ✅ Runs all Flutter tests
- ✅ Analyzes code for issues
- ✅ Checks code formatting
- ✅ Builds APK on main branch
- ✅ Generates code with build_runner

### 2. **Dependency Check** (`dependencies.yml`)
**Triggered on:** Weekly (Mondays at 9 AM UTC) or manually

**What it does:**
- ✅ Lists outdated dependencies
- ✅ Checks pub.dev package health scores
- ✅ Helps keep dependencies up-to-date

---

## 🎯 Quick Setup

### Step 1: Update Badges with Your GitHub Username

1. Go to your newly created GitHub repository
2. Copy your GitHub username
3. Replace `YOUR_USERNAME` in **README.md** badges (line ~3)

**Example:**
```markdown
# Before:
[![CI/CD Pipeline](https://github.com/YOUR_USERNAME/somni_ai/actions/workflows/ci.yml/badge.svg)]

# After:
[![CI/CD Pipeline](https://github.com/mellodevs/somni_ai/actions/workflows/ci.yml/badge.svg)]
```

### Step 2: Push to GitHub

```bash
git add .
git commit -m "feat: Add CI/CD with GitHub Actions"
git push origin main
```

### Step 3: Verify Workflows

1. Go to your repository on GitHub
2. Click **"Actions"** tab
3. You should see your workflows running

---

## 🛠️ Available Badges

### CI/CD Status Badge
```markdown
[![CI/CD Pipeline](https://github.com/YOUR_USERNAME/somni_ai/actions/workflows/ci.yml/badge.svg)](https://github.com/YOUR_USERNAME/somni_ai/actions)
```

### Language/Platform Badges
```markdown
[![Flutter](https://img.shields.io/badge/Flutter-3.0%2B-blue?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.0%2B-blue?logo=dart)](https://dart.dev)
[![Gemini API](https://img.shields.io/badge/AI-Gemini%202.5%20Flash-yellow?logo=google)](https://ai.google.dev)
```

### License Badge
```markdown
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
```

### Custom Badge Examples
```markdown
[![Downloads](https://img.shields.io/badge/downloads-10K%2B-brightgreen)]()
[![Contributors](https://img.shields.io/badge/contributors-1-blue)]()
```

**Badge Generator:** [Shields.io](https://shields.io)

---

## 📊 Monitoring Workflows

### View Workflow Runs
1. Go to **Actions** tab in your repository
2. Click on a workflow name to see details
3. Click on a run to see step-by-step execution

### Workflow Status Indicators
- 🟢 **Green** - All checks passed ✓
- 🔴 **Red** - Tests/checks failed ✗
- 🟡 **Yellow** - In progress ⏳

---

## ⚙️ Customizing Workflows

### Add More Tests

**File:** `.github/workflows/ci.yml`

```yaml
- name: Run integration tests
  run: flutter test integration_test/
```

### Add Notification on Failure

```yaml
- name: Notify Slack on Failure
  if: failure()
  run: curl -X POST ${{ secrets.SLACK_WEBHOOK }} ...
```

### Trigger Manual Builds

```yaml
on:
  workflow_dispatch:  # Allows manual trigger from Actions tab
```

---

## 🚀 Advanced: Deploy APK Automatically

To automatically upload APKs to GitHub Releases:

```yaml
- name: Create Release
  if: success()
  uses: actions/create-release@v1
  with:
    tag_name: v${{ github.run_number }}
    release_name: Release ${{ github.run_number }}
```

---

## ❌ Troubleshooting

### Workflow Not Running?
- Check branch name (must be `main` or `develop`)
- Ensure `.github/workflows/*.yml` files exist
- Check "Actions" permissions in Settings

### Tests Failing?
- Run `flutter test` locally first
- Check error logs in GitHub Actions
- Review recent code changes

### Build Fails?
- Ensure `pubspec.yaml` has all dependencies
- Run `flutter pub get` locally
- Check Flutter version compatibility

---

## 📚 Resources

- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Flutter CI/CD Best Practices](https://flutter.dev/docs/deployment/cd)
- [Dart Code Analysis](https://dart.dev/guides/language/analysis-options)
- [Shields.io Badge Generator](https://shields.io)

---

## ✅ Next Steps

1. ✅ Push code to GitHub
2. ✅ Update README with your GitHub username
3. ✅ Watch workflows run automatically
4. ✅ Share badges in your repository! 🎉

---

**Your project is now production-ready with automated quality checks!** 🚀
