# Use the official OpenJDK 8 image as the base image
FROM openjdk:8

# Set the working directory to '/app'
WORKDIR /app

# Copy the JAR file from the 'target' directory to the '/app' directory in the image
COPY target/devops-integration.jar /app/devops-integration.jar

# Expose port 8080 to the host machine
EXPOSE 8080

# Define the default command to run when the container starts
CMD ["java", "-jar", "devops-integration.jar"]
