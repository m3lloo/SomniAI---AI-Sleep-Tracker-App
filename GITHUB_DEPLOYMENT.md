# 🚀 GitHub Deployment Guide - Somni AI

## Prerequisites
- Git installed on your machine
- GitHub account
- GitHub Desktop or Command Line

---

## Step 1: Initialize Git Repository (if not already done)

```bash
cd "c:\Users\Mello\OneDrive\Documents\Desktop\Flutter Project\flutterdev\flutterdev"
git init
```

---

## Step 2: Add All Files to Git

```bash
git add .
```

---

## Step 3: Create Initial Commit

```bash
git commit -m "Initial commit: SleepMind - AI Sleep Tracker App

- Core Features: Sleep logging, tracking, and analytics
- AI Integration: Gemini 2.5 Flash for sleep insights
- Real-time timestamps with auto-refresh
- Offline-first architecture with Isar local database
- Multi-language support (English, Tagalog)
- Riverpod state management
- Clean Architecture pattern"
```

---

## Step 4: Create Repository on GitHub

1. Go to [GitHub.com](https://github.com)
2. Click **"+"** in top right → **"New repository"**
3. Fill in:
   - **Repository name:** `somni_ai` (or `Somni-AI`)
   - **Description:** `AI-powered sleep tracking app with Gemini insights`
   - **Visibility:** Public (or Private)
   - **License:** MIT (recommended) or your choice
   - **Add .gitignore:** Select "Dart"
   - **Add README:** Skip (you have one already)
4. Click **"Create repository"**

---

## Step 5: Add Remote & Push to GitHub

Copy the repository URL from GitHub (HTTPS or SSH), then run:

```bash
# Add remote repository
git remote add origin https://github.com/YOUR_USERNAME/somni_ai.git

# Rename branch to main (if needed)
git branch -M main

# Push to GitHub
git push -u origin main
```

---

## Step 6: Verify on GitHub

1. Go to https://github.com/YOUR_USERNAME/somni_ai
2. Verify all files are there ✓
3. Check README displays properly ✓

---

## 📋 Checklist Before Each Push

- [ ] No build artifacts (`/build/` deleted)
- [ ] No API keys in code
- [ ] `.gitignore` is updated
- [ ] README is descriptive
- [ ] Code is formatted (`dart format .`)
- [ ] Tests pass (if applicable)
- [ ] Commit message is descriptive

---

## 📝 Good Commit Message Examples

```
feat: Add real-time timestamp updates with auto-refresh
fix: Update Gemini model to 2.5-flash with Tagalog support
docs: Update README with deployment instructions
refactor: Improve timestamp formatting logic
```

---

## Future Pushes

After initial setup, just use:

```bash
git add .
git commit -m "Your commit message"
git push
```

---

## Using GitHub Desktop (GUI Alternative)

1. **File → Clone Repository** → Paste your repo URL
2. **Changes tab** → Check boxes of files to add
3. **Bottom left** → Add commit message
4. **Commit to main** button
5. **Push origin** at top

---

## 🔐 Important Security Notes

- ✅ **API Keys:** Stored in `flutter_secure_storage` (not in code)
- ✅ **Secrets:** Use GitHub Secrets for CI/CD (if applicable)
- ✅ **Environment:** Add `.env` to `.gitignore` (already done)

---

## Questions?

See [GitHub Docs](https://docs.github.com/en/get-started/importing-your-project-to-github/importing-a-repository-with-github-importer)

Happy coding! 🌙
