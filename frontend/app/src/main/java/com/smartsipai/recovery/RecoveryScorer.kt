package com.smartsipai.recovery

import com.smartsipai.data.UserVitals

object RecoveryScorer {

    fun calculate(vitals: UserVitals): Int {
        var score = 100

        if (vitals.bac > 0.08f) score -= 30
        if (vitals.sleepScore < 60) score -= 20
        if (vitals.hydration < 1000) score -= 15
        if (vitals.heartRate > 100) score -= 10

        return score.coerceIn(0, 100)
    }
}
