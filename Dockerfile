FROM alpine:3.20 AS unpack
RUN apk add --no-cache unzip
WORKDIR /tmp
COPY backend-t3-part*.b64 /tmp/
RUN cat /tmp/backend-t3-part*.b64 | base64 -d > /tmp/source.zip \
    && mkdir -p /src \
    && unzip -q /tmp/source.zip -d /src

FROM maven:3.9.9-eclipse-temurin-17 AS build
WORKDIR /app
COPY --from=unpack /src/ /app/
RUN mvn -q -DskipTests dependency:go-offline
RUN mvn -q -DskipTests package

FROM eclipse-temurin:17-jre
WORKDIR /app
RUN useradd -r -u 10001 spring
COPY --from=build /app/target/be-ecommerce-apellidonombre-1.0.0.jar app.jar
USER spring
EXPOSE 8080
ENTRYPOINT ["java","-XX:MaxRAMPercentage=65.0","-jar","/app/app.jar"]
