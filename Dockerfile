FROM debian:stable-slim

# The 1.21.9 server from https://www.minecraft.net/en-us/download/server
ARG MINECRAFT_URL=https://piston-data.mojang.com/v1/objects/11e54c2081420a4d49db3007e66c80a22579ff2a/server.jar

# Install JVM and add minecraft user
RUN apt-get update \
    && apt-get upgrade --yes \
    && apt-get install --yes --no-install-recommends default-jre-headless \
    && apt-get clean
RUN useradd --system --uid 10000 --shell /sbin/nologin minecraft

# Install server
ADD $MINECRAFT_URL /usr/libexec/minecraft-server.jar
RUN chmod u=rwX,g=rx,o=rx /usr/libexec/minecraft-server.jar

# Switch user
USER minecraft
WORKDIR /var/minecraft

# Start server
EXPOSE 25565
CMD [ "/usr/bin/java", "-Xmx8192M", "-Xms2048M", "-jar", "/usr/libexec/minecraft-server.jar", "nogui" ]
