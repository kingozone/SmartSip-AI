FROM ubuntu:22.04

# Set environment variables
ENV ANDROID_SDK_ROOT=/opt/android-sdk
ENV PATH=$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/platform-tools

# Install dependencies
RUN apt-get update && apt-get install -y \
    openjdk-17-jdk \
    wget \
    unzip \
    git \
    curl \
    gradle \
    zip \
    && rm -rf /var/lib/apt/lists/*

# Create SDK directory
RUN mkdir -p $ANDROID_SDK_ROOT/cmdline-tools

# Download Android command line tools
RUN cd $ANDROID_SDK_ROOT/cmdline-tools && \
    wget https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip -O tools.zip && \
    unzip tools.zip && rm tools.zip && mv cmdline-tools latest

# Accept licenses and install required packages
RUN yes | sdkmanager --sdk_root=$ANDROID_SDK_ROOT --licenses && \
    sdkmanager \
    "platform-tools" \
    "platforms;android-34" \
    "build-tools;34.0.0"

# Set working directory inside the container
WORKDIR /workspace

# Default command
CMD ["./gradlew", "assembleDebug"]
