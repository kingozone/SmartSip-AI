package com.smartsipai.ai

import android.util.Log
import com.smartsipai.ai.claude.ClaudeApi
import com.smartsipai.ai.gemini.GeminiApi
import com.smartsipai.ai.openai.OpenAiApi
import com.smartsipai.ai.mistral.MistralApi

object SmartCoachRouter {

    suspend fun getSmartAdvice(prompt: String): String {
        return try {
            ClaudeApi.getSmartTip(prompt)?.takeIf { it.isNotBlank() }
                ?: GeminiApi.getSmartTip(prompt)?.takeIf { it.isNotBlank() }
                ?: OpenAiApi.getSmartTip(prompt)?.takeIf { it.isNotBlank() }
                ?: MistralApi.getSmartTip(prompt)?.takeIf { it.isNotBlank() }
                ?: "Stay hydrated and avoid alcohol before sleep. 🍵"
        } catch (e: Exception) {
            Log.e("SmartCoachRouter", "Fallback error: ${e.message}")
            "Could not fetch advice. Try again later."
        }
    }
}
