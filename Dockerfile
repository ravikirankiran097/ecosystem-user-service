#Build JAR file using Maven
FROM maven as build
WORKDIR /ecosystem-user-service
COPY . .
RUN mvn clean install

#Create Docker Image
FROM adoptopenjdk/openjdk11:jre-11.0.10_9-alpine
WORKDIR /ecosystem-user-service
COPY --from=build /ecosystem-user-service/target/*.jar /ecosystem-user-service/*.jar
EXPOSE 8081
ENTRYPOINT ["java","-jar","*.jar"]
