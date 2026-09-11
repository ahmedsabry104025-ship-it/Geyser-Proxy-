FROM eclipse-temurin:21-jre

WORKDIR /app

COPY config.yml /app/config.yml

RUN apt-get update && apt-get install -y curl && \
    curl -L -o Geyser-Standalone.jar https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/standalone

EXPOSE 19132/udp
EXPOSE 19132/tcp

CMD ["java", "-Xmx1024M", "-jar", "Geyser-Standalone.jar"]
