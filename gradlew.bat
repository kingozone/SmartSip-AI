@echo off
setlocal
set GRADLE_USER_HOME=%USERPROFILE%\.gradle
set DIR=%~dp0
set GRADLE_JAR=%DIR%gradle\wrapper\gradle-wrapper.jar
java -Xmx64m -classpath "%GRADLE_JAR%" org.gradle.wrapper.GradleWrapperMain %*
