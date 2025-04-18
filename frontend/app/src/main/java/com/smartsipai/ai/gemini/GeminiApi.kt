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
                .url("$API_URL?key=$API_KEY")
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
            Log.e("GeminiApi", "Gemini error: ${e.message}")
            null
        }
    }
}
