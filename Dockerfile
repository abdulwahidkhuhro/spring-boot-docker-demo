FROM maven:3.6.3-jdk-8

WORKDIR /app

COPY . .

RUN mvn clean package -DskipTests

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "target/springboot-docker-demo.jar"]
