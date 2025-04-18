# Keep line numbers for stack traces
-keepattributes SourceFile,LineNumberTable

# Keep custom models for serialization/deserialization
-keepclassmembers class * {
    @com.google.gson.annotations.SerializedName <fields>;
}
