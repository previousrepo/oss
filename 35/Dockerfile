FROM ubuntu:22.04

# Install OpenJDK
RUN apt-get update && \
    apt-get install -y openjdk-11-jdk && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set JAVA_HOME
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
ENV PATH=$PATH:$JAVA_HOME/bin

# Create app directory
WORKDIR /app

# Copy Java application
COPY HelloWorld.java .

# Compile Java application
RUN javac HelloWorld.java

# Run the application
CMD ["java", "HelloWorld"]
