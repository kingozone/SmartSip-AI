#!/bin/bash

echo "📁 Reorganizing SmartSip-AI into frontend/backend monorepo..."

mkdir -p frontend
mkdir -p backend

# === Move FRONTEND
echo "📦 Moving Android app files into frontend/..."
mv app frontend/
mv gradle frontend/ 2>/dev/null
mv gradlew frontend/
mv gradlew.bat frontend/
mv build.gradle.kts frontend/
mv settings.gradle.kts frontend/
mv local.properties frontend/
mv sentry.properties frontend/ 2>/dev/null

# === Move BACKEND
echo "📦 Moving infra, supabase, ci, and server files into backend/..."

mv .circleci backend/
mv .github backend/
mv .idea backend/ 2>/dev/null
mv api backend/ 2>/dev/null
mv infra backend/ 2>/dev/null
mv launchdarkly backend/ 2>/dev/null
mv supabase backend/
mv web backend/ 2>/dev/null

mv docker-compose.yml backend/
mv Dockerfile backend/
mv .deploy-app.yml backend/
mv .env backend/
mv .gitignore backend/
mv akido.yml backend/
mv .jenkinsfile backend/ 2>/dev/null
mv vercel.json backend/

# === Final cleanup (root)
echo "🧼 Cleaning root..."
rm -rf app gradle gradlew gradlew.bat build.gradle.kts settings.gradle.kts local.properties 2>/dev/null

echo "✅ Project successfully rebased into:"
echo " - frontend/"
echo " - backend/"
echo " - setup_project.sh (still in root)"

