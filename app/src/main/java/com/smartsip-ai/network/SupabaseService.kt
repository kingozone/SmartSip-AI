package com.smartsip.ai.network

import io.github.jakepurple13.postgrest.PostgrestClient
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import org.json.JSONObject

class SupabaseService {

    companion object {
        private const val SUPABASE_URL = "https://your-project-id.supabase.co/rest/v1"
        private const val API_KEY = "your-anon-or-service-key"
    }

    private val client = PostgrestClient(
        url = SUPABASE_URL,
        headers = mapOf(
            "apikey" to API_KEY,
            "Authorization" to "Bearer $API_KEY"
        )
    )

    suspend fun logDrink(drinkType: String, quantity: Double): Boolean {
        return withContext(Dispatchers.IO) {
            val body = JSONObject()
            body.put("drink_type", drinkType)
            body.put("quantity", quantity)

            val result = client.from("drink_logs")
                .insert(body.toString())

            result.error == null
        }
    }

    suspend fun getUserLogs(userId: String): List<JSONObject> {
        return withContext(Dispatchers.IO) {
            val result = client.from("drink_logs")
                .select()
                .eq("user_id", userId)
                .execute()

            result.data ?: emptyList()
        }
    }
}
