# Dockerfile

# 빌드 스테이지
FROM maven:3.8.1-openjdk-11 as build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# 실행 스테이지
FROM tomcat:9.0-jdk11-openjdk-slim
COPY --from=build /app/target/elysian-1.0.0-BUILD-SNAPSHOT.war /usr/local/tomcat/webapps/hotel_prj.war
EXPOSE 80
CMD ["catalina.sh", "run"]