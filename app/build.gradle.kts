plugins {
    id("com.android.application")
    kotlin("android")
}

android {
    namespace = "com.smartsip.ai"
    compileSdk = 34

    defaultConfig {
        applicationId = "com.smartsip.ai"
        minSdk = 24
        targetSdk = 34
        versionCode = 1
        versionName = "1.0"
    }

    buildTypes {
        release {
            isMinifyEnabled = false
        }
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = "17"
    }
}

val client = PostgrestClient(
    url = "https://your-supabase-project.supabase.co/rest/v1",
    headers = mapOf("apikey" to "your-public-api-key")
)



dependencies {
    implementation("androidx.core:core-ktx:1.12.0")
    implementation("androidx.appcompat:appcompat:1.6.1")
    implementation("com.google.android.material:material:1.11.0")
        // Kotlin Supabase/PostgREST client (community)
    implementation("io.github.jakepurple13:postgrest-kt:0.2.2")

    // Optional: Supabase auth wrapper
    implementation("io.github.jakepurple13:supabase-kt:0.2.2")

    // Or: Ktor client for RESTful Supabase access
    implementation("io.ktor:ktor-client-core:2.3.4")
    implementation("io.ktor:ktor-client-cio:2.3.4")
    implementation("io.ktor:ktor-client-content-negotiation:2.3.4")
    implementation("io.ktor:ktor-serialization-kotlinx-json:2.3.4")

    // Other app dependencies
    implementation("androidx.core:core-ktx:1.12.0")
    implementation("androidx.appcompat:appcompat:1.6.1")
    implementation("com.google.android.material:material:1.11.0")
}
