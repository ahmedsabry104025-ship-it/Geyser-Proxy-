FROM eclipse-temurin:21-jre

WORKDIR /app

# تثبيت الأدوات المطلوبة وأداة Playit.gg
RUN apt-get update && apt-get install -y curl gnupg && \
    curl -SsL https://playit-cloud.github.io/ppa/key.gpg | gpg --dearmor | tee /etc/apt/trusted.gpg.d/playit.gpg > /dev/null && \
    echo "deb [signed-by=/etc/apt/trusted.gpg.d/playit.gpg] https://playit-cloud.github.io/ppa/data ./" | tee /etc/apt/sources.list.d/playit-cloud.list && \
    apt-get update && apt-get install -y playit

# تنزيل برنامج Geyser Standalone
RUN curl -L -o Geyser-Standalone.jar https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/standalone

COPY config.yml /app/config.yml

EXPOSE 19132/udp
EXPOSE 19132/tcp

# تشغيل Playit المباشر مع Geyser
CMD playit & java -Xmx1024M -jar Geyser-Standalone.jar
