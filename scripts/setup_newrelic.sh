#!/bin/bash

echo "📦 Setting up New Relic integration for frontend and backend..."

# === Android Frontend ===
FRONTEND_DIR="frontend"
FRONTEND_PROPS="$FRONTEND_DIR/local.properties"
FRONTEND_SENTRY="$FRONTEND_DIR/sentry.properties"

mkdir -p "$FRONTEND_DIR/app"

echo "🔧 Adding New Relic to Android (local.properties)..."
if ! grep -q "NEW_RELIC_TOKEN=" "$FRONTEND_PROPS"; then
  echo "NEW_RELIC_TOKEN=your_android_token_here" >> "$FRONTEND_PROPS"
fi

echo "✅ Android setup complete."

# === Backend (Node/Docker/Container) ===
BACKEND_DIR="backend/newrelic"

mkdir -p "$BACKEND_DIR"

echo "🔧 Creating backend New Relic config..."
cat <<EOF > "$BACKEND_DIR/newrelic.js"
'use strict'
exports.config = {
  app_name: ['SmartSip-Backend'],
  license_key: process.env.NEW_RELIC_LICENSE_KEY,
  logging: {
    level: 'info'
  }
}
EOF

# Create .env if missing
ENV_FILE="backend/.env"
touch "$ENV_FILE"
if ! grep -q "NEW_RELIC_LICENSE_KEY=" "$ENV_FILE"; then
  echo "NEW_RELIC_LICENSE_KEY=your_backend_license_key" >> "$ENV_FILE"
fi

echo "✅ Backend setup complete."

# === Dockerfile Note
echo "📌 Reminder: In Dockerfile, make sure to add:"
echo "  ENV NEW_RELIC_LICENSE_KEY=your_key"
echo "  COPY newrelic.js ."

echo ""
echo "🚀 New Relic files added:"
echo " - frontend/local.properties (NEW_RELIC_TOKEN)"
echo " - backend/newrelic/newrelic.js"
echo " - backend/.env (NEW_RELIC_LICENSE_KEY)"
echo ""
echo "🔒 Add secrets to GitHub or CI/CD securely!"
