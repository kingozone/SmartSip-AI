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
                .addHeader("Authorization", "Bearer $API_KEY")
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
            Log.e("MistralApi", "Mistral error: ${e.message}")
            null
        }
    }
}
