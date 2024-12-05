# Build a JAR File
FROM maven:3.9.6-eclipse-temurin-21 AS build
WORKDIR /home/app
COPY . /home/app
RUN mvn clean package -DskipTests

# Create an Image
FROM eclipse-temurin:21-jdk-jammy
COPY --from=build /home/app/target/hworld-java-0.0.1-SNAPSHOT.jar /usr/local/lib/app.jar
EXPOSE 5000
ENTRYPOINT ["java", "-jar", "/usr/local/lib/app.jar"]

