#!/bin/bash

echo "🧱 Scaffolding SmartSip AI full project structure..."

## === FRONTEND ===
echo "📦 Creating frontend folders..."

mkdir -p frontend/app/src/main/java/com/smartsipai/{ui/theme,ui/components,viewmodel,network,data/model,utils,recovery,calendar,ai/{claude,gemini,openai,prompts}}
mkdir -p frontend/app/src/test/java/com/smartsipai
mkdir -p frontend/app/src/androidTest/java/com/smartsipai
mkdir -p frontend/wear/src/main/java/com/smartsipai/wear

## === BLANK FRONTEND FILES ===
echo "📄 Adding blank frontend files..."

touch frontend/app/src/main/java/com/smartsipai/ui/theme/{AppTheme.kt,Color.kt,Typography.kt}
touch frontend/app/src/main/java/com/smartsipai/ui/components/{DrinkCard.kt,RecoveryChip.kt}
touch frontend/app/src/main/java/com/smartsipai/viewmodel/{MainViewModel.kt,CoachViewModel.kt}
touch frontend/app/src/main/java/com/smartsipai/network/{NetworkModule.kt,ApiService.kt}
touch frontend/app/src/main/java/com/smartsipai/data/model/UserVitals.kt
touch frontend/app/src/main/java/com/smartsipai/utils/{DateUtils.kt,BacCalculator.kt}
touch frontend/app/src/main/java/com/smartsipai/calendar/GoogleCalendarSync.kt
touch frontend/app/src/main/java/com/smartsipai/recovery/RecoveryScorer.kt
touch frontend/app/src/test/java/com/smartsipai/{RecoveryScorerTest.kt,AIResponseTest.kt}
touch frontend/app/src/main/java/com/smartsipai/ai/prompts/{FoodPromptTemplate.txt,SmartCoachPersona.json}
touch frontend/app/src/main/java/com/smartsipai/ai/claude/ClaudeApi.kt
touch frontend/app/src/main/java/com/smartsipai/ai/gemini/GeminiApi.kt
touch frontend/app/src/main/java/com/smartsipai/ai/openai/OpenAiApi.kt
touch frontend/wear/src/main/java/com/smartsipai/wear/{WearMainActivity.kt,CompanionSyncWorker.kt}

## === BACKEND ===
echo "📦 Creating backend folders..."

mkdir -p backend/{api/routes,newrelic,infra,launchdarkly,supabase/functions/alerts,migrations,docker,scripts}

## === BLANK BACKEND FILES ===
echo "📄 Adding backend boilerplate files..."

touch backend/.env
touch backend/docker-compose.yml
touch backend/Dockerfile
touch backend/.deploy-app.yml
touch backend/jenkinsfile
touch backend/akido.yml
touch backend/newrelic/newrelic.js
touch backend/supabase/functions/alerts/bac_alert.ts
touch backend/migrations/{init.sql,roles.sql,seed.sql}
touch backend/api/routes/healthcheck.ts
touch backend/scripts/export_user_data.sh

## === META / CI / TOOLING ===
echo "🧰 Creating tooling and CI folders..."

mkdir -p backend/.circleci backend/.github workflows scripts test_data

touch backend/.circleci/config.yml
touch backend/.github/workflows/sentry-release.yml
touch .editorconfig
touch .gitignore
touch .env.example
touch CHANGELOG.md
touch CONTRIBUTING.md
touch SECURITY.md
touch CODEOWNERS

echo "✅ All scaffolding complete!"
echo "🚀 You're ready to code, test, deploy, and build like a 10x dev team."
