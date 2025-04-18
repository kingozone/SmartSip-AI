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
            Log.e("ClaudeApi", "Error: ${e.message}")
            null
        }
    }
}
