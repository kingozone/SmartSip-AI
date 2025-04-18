#!/bin/bash

echo "🧠 Creating SmartCoach AI API wrappers: Gemini, OpenAI, Mistral..."

# === Base Path
AI_DIR=frontend/app/src/main/java/com/smartsipai/ai
mkdir -p "$AI_DIR/gemini" "$AI_DIR/openai" "$AI_DIR/mistral"

# === Gemini API
cat <<EOF > "$AI_DIR/gemini/GeminiApi.kt"
package com.smartsipai.ai.gemini

import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import okhttp3.*
import org.json.JSONObject
import android.util.Log

object GeminiApi {
    private const val API_URL = "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent"
    private const val API_KEY = BuildConfig.GEMINI_API_KEY

    suspend fun getSmartTip(prompt: String): String? = withContext(Dispatchers.IO) {
        try {
            val json = JSONObject().apply {
                put("contents", listOf(mapOf("parts" to listOf(mapOf("text" to prompt)))))
            }

            val body = json.toString().toRequestBody("application/json".toMediaType())
            val request = Request.Builder()
                .url("\$API_URL?key=\$API_KEY")
                .post(body)
                .build()

            val response = OkHttpClient().newCall(request).execute()
            val result = JSONObject(response.body?.string() ?: "")
            return@withContext result
                .getJSONArray("candidates")
                .getJSONObject(0)
                .getJSONObject("content")
                .getJSONArray("parts")
                .getJSONObject(0)
                .getString("text")
        } catch (e: Exception) {
            Log.e("GeminiApi", "Gemini error: \${e.message}")
            null
        }
    }
}
EOF

# === OpenAI API
cat <<EOF > "$AI_DIR/openai/OpenAiApi.kt"
package com.smartsipai.ai.openai

import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import okhttp3.*
import org.json.JSONObject
import android.util.Log

object OpenAiApi {
    private const val API_URL = "https://api.openai.com/v1/chat/completions"
    private const val API_KEY = BuildConfig.OPENAI_API_KEY

    suspend fun getSmartTip(prompt: String): String? = withContext(Dispatchers.IO) {
        try {
            val json = JSONObject().apply {
                put("model", "gpt-4")
                put("messages", listOf(mapOf("role" to "user", "content" to prompt)))
                put("temperature", 0.7)
                put("max_tokens", 256)
            }

            val body = json.toString().toRequestBody("application/json".toMediaType())
            val request = Request.Builder()
                .url(API_URL)
                .addHeader("Authorization", "Bearer \$API_KEY")
                .post(body)
                .build()

            val response = OkHttpClient().newCall(request).execute()
            val result = JSONObject(response.body?.string() ?: "")
            return@withContext result
                .getJSONArray("choices")
                .getJSONObject(0)
                .getJSONObject("message")
                .getString("content")
        } catch (e: Exception) {
            Log.e("OpenAiApi", "OpenAI error: \${e.message}")
            null
        }
    }
}
EOF

# === Mistral API
cat <<EOF > "$AI_DIR/mistral/MistralApi.kt"
package com.smartsipai.ai.mistral

import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import okhttp3.*
import org.json.JSONObject
import android.util.Log

object MistralApi {
    private const val API_URL = "https://api.mistral.ai/v1/chat/completions"
    private const val API_KEY = BuildConfig.MISTRAL_API_KEY

    suspend fun getSmartTip(prompt: String): String? = withContext(Dispatchers.IO) {
        try {
            val json = JSONObject().apply {
                put("model", "mistral-medium")
                put("messages", listOf(mapOf("role" to "user", "content" to prompt)))
                put("temperature", 0.7)
            }

            val body = json.toString().toRequestBody("application/json".toMediaType())
            val request = Request.Builder()
                .url(API_URL)
                .addHeader("Authorization", "Bearer \$API_KEY")
                .post(body)
                .build()

            val response = OkHttpClient().newCall(request).execute()
            val result = JSONObject(response.body?.string() ?: "")
            return@withContext result
                .getJSONArray("choices")
                .getJSONObject(0)
                .getJSONObject("message")
                .getString("content")
        } catch (e: Exception) {
            Log.e("MistralApi", "Mistral error: \${e.message}")
            null
        }
    }
}
EOF

echo "🔐 Add these to your local.properties or CI:"
echo "  GEMINI_API_KEY=sk-..."
echo "  OPENAI_API_KEY=sk-..."
echo "  MISTRAL_API_KEY=sk-..."

echo "✅ Gemini, OpenAI, and Mistral APIs wired up and ready!"
