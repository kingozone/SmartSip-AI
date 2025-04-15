package com.smartsip.ai
dependencies {
    implementation("io.sentry:sentry-android:6.32.0")
}

import android.app.Application
import io.sentry.Sentry

class MainApplication : Application() {
    override fun onCreate() {
        super.onCreate()

        Sentry.init { options ->
            options.dsn = "https://your-dsn@o123456.ingest.sentry.io/123456"
            options.tracesSampleRate = 1.0
            options.isDebug = true
        }
    }
}