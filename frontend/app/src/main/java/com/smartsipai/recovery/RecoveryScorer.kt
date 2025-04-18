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
