FROM debian:stable-slim

# The 1.21.8 server from https://www.minecraft.net/en-us/download/server
ARG MINECRAFT_URL=https://piston-data.mojang.com/v1/objects/6bce4ef400e4efaa63a13d5e6f6b500be969ef81/server.jar

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
