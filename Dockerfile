FROM maven:3-openjdk-11 as builder
COPY src ./src
COPY pom.xml .
RUN mvn package

FROM azul/zulu-openjdk-alpine:11.0.7
COPY --from=builder target/backend-0.0.1-SNAPSHOT.jar /backend/
WORKDIR /backend
EXPOSE 8080
ENTRYPOINT [ "/usr/lib/jvm/zulu11-ca/bin/java", "-jar", "backend-0.0.1-SNAPSHOT.jar" ]