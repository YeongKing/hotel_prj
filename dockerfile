# 빌드 스테이지
FROM maven:3.8.4-openjdk-11 as build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# 실행 스테이지
FROM openjdk:11-jdk-slim
COPY --from=build /app/target/simple-web-app.war /app.war
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app.war"]