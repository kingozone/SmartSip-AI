#!/bin/bash

echo "🔁 Reorganizing SmartSip-AI files..."

# === FRONTEND STRUCTURE ===
echo "📦 Organizing frontend..."

mkdir -p frontend
mv app frontend/ 2>/dev/null
mv gradle frontend/ 2>/dev/null
mv gradlew frontend/ 2>/dev/null
mv gradlew.bat frontend/ 2>/dev/null
mv local.properties frontend/ 2>/dev/null
mv sentry.properties frontend/ 2>/dev/null
mv build.gradle.kts frontend/ 2>/dev/null
mv settings.gradle.kts frontend/ 2>/dev/null
mv wear frontend/ 2>/dev/null

# === BACKEND STRUCTURE ===
echo "📦 Organizing backend..."

mkdir -p backend
mv .circleci backend/ 2>/dev/null
mv .github backend/ 2>/dev/null
mv .idea backend/ 2>/dev/null
mv api backend/ 2>/dev/null
mv infra backend/ 2>/dev/null
mv launchdarkly backend/ 2>/dev/null
mv newrelic backend/ 2>/dev/null
mv supabase backend/ 2>/dev/null
mv docker-compose.yml backend/ 2>/dev/null
mv Dockerfile backend/ 2>/dev/null
mv akido.yml backend/ 2>/dev/null
mv .deploy-app.yml backend/ 2>/dev/null
mv .env backend/ 2>/dev/null
mv .gitignore backend/ 2>/dev/null
mv .jenkinsfile backend/jenkinsfile 2>/dev/null

# === Move CLI scripts (stay in root or go to /scripts)
mkdir -p scripts
mv restructure_project.sh scripts/ 2>/dev/null
mv setup_newrelic.sh scripts/ 2>/dev/null
mv advanced_features.sh scripts/ 2>/dev/null

# === Keep these files at root
echo "📂 Keeping root files..."
mv README.md . 2>/dev/null
mv LICENSE . 2>/dev/null
mv vercel.json . 2>/dev/null

echo "✅ Reorganization complete!"
echo "Project structure is now clean and ready to scale. 💼"
