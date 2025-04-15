#!/usr/bin/env sh

##############################################################################
##
##  Gradle start up script for UN*X
##
##############################################################################

# Set default Gradle user home if not set
GRADLE_USER_HOME="${GRADLE_USER_HOME:-$HOME/.gradle}"

# Locate gradle-wrapper.jar
SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
WRAPPER_JAR="$SCRIPT_DIR/gradle/wrapper/gradle-wrapper.jar"

exec java -Xmx64m -classpath "$WRAPPER_JAR" org.gradle.wrapper.GradleWrapperMain "$@"
