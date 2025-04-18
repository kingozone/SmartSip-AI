package com.smartsipai.ai.coach

import com.smartsipai.data.UserVitals

object FoodSleepCoach {

    fun getTips(vitals: UserVitals): List<String> {
        return when {
            vitals.bac > 0.08 -> listOf("Eat eggs or oats", "Drink coconut water", "Take a cold shower")
            vitals.sleepScore < 50 -> listOf("Avoid alcohol tonight", "Eat kiwis or tart cherries")
            else -> listOf("Stay hydrated", "Track your sleep with Oura")
        }
    }

    fun fallbackToLLM(query: String): String {
        // Placeholder call to OpenAI or Claude
        return "Based on your data, consider hydrating and avoiding stimulants before bed."
    }
}
