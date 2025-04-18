#!/bin/bash

echo "🚀 Setting up prefilled logic files for SmartSip AI..."

# === Claude API integration
CLAUDE_FILE=frontend/app/src/main/java/com/smartsipai/ai/claude/ClaudeApi.kt
mkdir -p "$(dirname "$CLAUDE_FILE")"

cat <<EOF > "$CLAUDE_FILE"
package com.smartsipai.ai.claude

import android.util.Log
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import okhttp3.*
import org.json.JSONObject

object ClaudeApi {
    private const val API_URL = "https://api.anthropic.com/v1/messages"
    private const val API_KEY = BuildConfig.CLAUDE_API_KEY

    suspend fun getSmartTip(prompt: String): String? = withContext(Dispatchers.IO) {
        try {
            val json = JSONObject().apply {
                put("model", "claude-3-opus-20240229")
                put("temperature", 0.7)
                put("max_tokens", 256)
                put("messages", listOf(mapOf("role" to "user", "content" to prompt)))
            }

            val body = RequestBody.create(
                "application/json".toMediaTypeOrNull(), json.toString()
            )

            val request = Request.Builder()
                .url(API_URL)
                .addHeader("x-api-key", API_KEY)
                .addHeader("anthropic-version", "2023-06-01")
                .post(body)
                .build()

            val response = OkHttpClient().newCall(request).execute()

            val result = JSONObject(response.body?.string() ?: "")
            return@withContext result.getJSONArray("content")
                .getJSONObject(0)
                .getString("text")
        } catch (e: Exception) {
            Log.e("ClaudeApi", "Error: \${e.message}")
            null
        }
    }
}
EOF

# === Calendar Sync
CALENDAR_FILE=frontend/app/src/main/java/com/smartsipai/calendar/GoogleCalendarSync.kt
mkdir -p "$(dirname "$CALENDAR_FILE")"

cat <<EOF > "$CALENDAR_FILE"
package com.smartsipai.calendar

import android.content.ContentValues
import android.content.Context
import android.provider.CalendarContract
import android.util.Log
import java.util.*

object GoogleCalendarSync {

    fun insertAlcoholEvent(context: Context, drinkType: String, timestamp: Long) {
        val calId = getPrimaryCalendarId(context) ?: return
        val values = ContentValues().apply {
            put(CalendarContract.Events.DTSTART, timestamp)
            put(CalendarContract.Events.DTEND, timestamp + 60 * 60 * 1000)
            put(CalendarContract.Events.TITLE, "Drink logged: \$drinkType")
            put(CalendarContract.Events.CALENDAR_ID, calId)
            put(CalendarContract.Events.EVENT_TIMEZONE, TimeZone.getDefault().id)
        }
        val uri = context.contentResolver.insert(CalendarContract.Events.CONTENT_URI, values)
        Log.d("CalendarSync", "Inserted calendar event: \$uri")
    }

    private fun getPrimaryCalendarId(context: Context): Long? {
        val projection = arrayOf(CalendarContract.Calendars._ID, CalendarContract.Calendars.IS_PRIMARY)
        val cursor = context.contentResolver.query(CalendarContract.Calendars.CONTENT_URI, projection, null, null, null)

        cursor?.use {
            while (it.moveToNext()) {
                val calId = it.getLong(0)
                val isPrimary = it.getInt(1) == 1
                if (isPrimary) return calId
            }
        }
        return null
    }
}
EOF

# === Recovery Scorer
SCORER_FILE=frontend/app/src/main/java/com/smartsipai/recovery/RecoveryScorer.kt
mkdir -p "$(dirname "$SCORER_FILE")"

cat <<EOF > "$SCORER_FILE"
package com.smartsipai.recovery

import com.smartsipai.data.UserVitals

object RecoveryScorer {
    fun calculate(vitals: UserVitals): Int {
        var score = 100

        if (vitals.bac > 0.08f) score -= 30
        if (vitals.sleepScore < 60) score -= 25
        if (vitals.hydration < 1200) score -= 20
        if (vitals.heartRate > 100) score -= 15

        return score.coerceIn(0, 100)
    }

    fun getLabel(score: Int): String = when {
        score >= 80 -> "Fully Recovered 💪"
        score >= 50 -> "Partially Recovered ⚠️"
        else -> "Recovery Needed 🚨"
    }
}
EOF

# === Makefile
echo "🛠️ Creating Makefile..."

cat <<EOF > Makefile
.PHONY: build clean test run-backend

build:
	cd frontend && ./gradlew build

clean:
	cd frontend && ./gradlew clean

test:
	cd frontend && ./gradlew test

run-backend:
	cd backend && docker-compose up --build

lint:
	cd frontend && ./gradlew ktlintCheck
EOF

# === VSCode Launch Config
echo "🧠 Creating VSCode launch.json..."

mkdir -p .vscode
cat <<EOF > .vscode/launch.json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Android App",
      "type": "android",
      "request": "launch",
      "mainClass": "com.smartsipai.MainActivity",
      "projectType": "gradle"
    },
    {
      "name": "Run Backend (Docker)",
      "type": "shell",
      "request": "launch",
      "command": "make run-backend"
    }
  ]
}
EOF

echo "✅ All prefilled files created!"
