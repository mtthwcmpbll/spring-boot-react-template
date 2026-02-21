# Stage 1: Build the application
FROM eclipse-temurin:25-jdk-alpine AS app-builder
WORKDIR /build

# Copy maven wrapper and pom.xml
COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .

# Ensure mvnw is executable
RUN chmod +x ./mvnw

# Copy source code and build
COPY src src
RUN ./mvnw clean package -Pprod -DskipTests

# Stage 2: Create a custom Java runtime
FROM eclipse-temurin:25-jdk-alpine AS jre-builder

# Create a custom Java runtime
RUN jlink \
  --add-modules java.base,java.compiler,java.desktop,java.instrument,java.management,java.naming,java.prefs,java.rmi,java.scripting,java.security.jgss,java.sql,jdk.httpserver,jdk.jfr,jdk.unsupported,jdk.crypto.ec \
  --strip-debug \
  --no-man-pages \
  --no-header-files \
  --compress=zip-6 \
  --output /javaruntime

# Stage 3: Define the final base image
FROM alpine:latest
ENV JAVA_HOME=/javaruntime
ENV PATH="${JAVA_HOME}/bin:${PATH}"

COPY --from=jre-builder /javaruntime $JAVA_HOME

# Create app directory
WORKDIR /app

# Copy the built application from the app-builder stage
# Using a glob that matches the generated executable JAR and ignores the .original file
COPY --from=app-builder /build/target/*-SNAPSHOT.jar app.jar

# Expose the application port
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]