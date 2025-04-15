<p align="center">
  <img src="https://raw.githubusercontent.com/kingozone/SmartSip-AI/main/assets/logo.png" width="300" alt="SmartSip AI Logo"/>
</p>

<h1 align="center">SmartSip AI 🍷🤖</h1>

<p align="center">
  AI-powered alcohol tracking & wellness coaching app for Android
</p>

<p align="center">
  <a href="https://github.com/kingozone/SmartSip-AI/actions"><img src="https://github.com/kingozone/SmartSip-AI/actions/workflows/android.yml/badge.svg" alt="GitHub Actions Status"/></a>
  <a href="https://circleci.com/gh/kingozone/SmartSip-AI"><img src="https://circleci.com/gh/kingozone/SmartSip-AI.svg?style=shield" alt="CircleCI"/></a>
  <a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/License-MIT-green.svg" alt="License"/></a>
  <img src="https://img.shields.io/badge/API-34-blue" alt="API Level"/>
  <img src="https://img.shields.io/badge/Jetpack-Compose-blueviolet"/>
  <img src="https://img.shields.io/badge/Monitoring-Sentry-orange"/>
  <img src="https://img.shields.io/badge/Feature%20Flags-LaunchDarkly-purple"/>
</p>

---

<details>
  <summary>📸 Screenshots & GIFs (Click to expand)</summary>

  | Onboarding | Drink Catalog | BAC Tracking |
  |-----------|---------------|--------------|
  | ![onboarding](https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExb2NzZ2V0eGl3b2lrNW1kM3g4a3ZkZGNtc2VmZ3BpdmkzNnZtbDd0MSZlcD12MV9naWZzX3NlYXJjaCZjdD1n/F9hQLAVwwM9XnF7ip8/giphy.gif) | ![catalog](https://media.giphy.com/media/Wn74RUT0vjnoU98Hnt/giphy.gif) | ![bac](https://media.giphy.com/media/IcyXwjuh8RjqMCpUIQ/giphy.gif) |

</details>

---

## 🚀 Quickstart

```bash
git clone https://github.com/kingozone/SmartSip-AI.git
cd SmartSip-AI
docker-compose build
docker-compose run android-dev bash
./gradlew build
```

## 🧠 Features
- 🍷 AI-based consumption tracking & predictions
- 🧠 GPT-based coaching & moderation suggestions
- 📶 Sync with BACtrack for real-time BAC data
- 🏋️ Health Connect + Google Fit + Hidrate API integration
- 🍸 Catalog of cocktails, beers, wines + custom drinks
- ⚙️ Fully Dockerized Android build environment
- 🧪 GitHub Actions + CircleCI + Jenkins + Ansible support
- 🔄 LaunchDarkly feature toggles
- 🛡️ Real-time error tracking via Sentry
---

## 📸 Screenshots (Coming Soon)
🧪 Mockups for onboarding, drink catalog, AI assistant & stats

## 🛠️ Dev Stack
| Tech       | Usage                        |
|------------|------------------------------|
| Kotlin     | Android app core             |
| Gradle KTS | Build system                 |
| Docker     | Containerized builds         |
| GitHub Actions | CI/CD & APK artifacts   |
| CircleCI   | Parallel CI/CD workflows     |
| Jenkins + Ansible | Infra as code + builds |
| LaunchDarkly | Feature flag mgmt         |
| Sentry     | Crash & error monitoring     |


## 📦 Folder Structure
```pgsql
SmartSip-AI/
├── app/
├── Dockerfile
├── docker-compose.yml
├── build.gradle.kts
├── settings.gradle.kts
├── gradle/
│   └── wrapper/
├── gradlew
├── gradlew.bat
├── proguard-rules.pro
├── README.md
└── .gitignore
```
## ⚙️ CI/CD Integration

<details> <summary>GitHub Actions</summary>
  
```yaml
# .github/workflows/android.yml
name: Android CI

on:
  push:
    branches: [ main ]
  pull_request:

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Set up JDK
        uses: actions/setup-java@v3
        with:
          distribution: 'temurin'
          java-version: '17'
      - name: Grant execute permission for gradlew
        run: chmod +x gradlew
      - name: Build APK
        run: ./gradlew assembleDebug
      - name: Upload APK
        uses: actions/upload-artifact@v3
        with:
          name: SmartSipAI-debug-apk
          path: app/build/outputs/apk/debug/app-debug.apk
```

</details> <details> <summary>CircleCI (Optional)</summary>
  
```yaml
version: 2.1

jobs:
  build:
    docker:
      - image: cimg/android:2023.11
    steps:
      - checkout
      - run:
          name: Build Debug APK
          command: ./gradlew assembleDebug

```

</details> <details> <summary>Jenkins + Ansible Pipeline (Planned)</summary>
  
- Clone project via Git
- Docker build step
- Ansible deploy to staging
- Archive & store .apk or deploy to Firebase App Distribution
- Trigger Play Store publishing workflow

</details>
  
## 📜 License
MIT © 2025 KingOzone
