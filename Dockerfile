FROM alpine:latest

# The latest server from https://www.minecraft.net/de-de/download/server
ENV MINECRAFT_URL https://launcher.mojang.com/v1/objects/e00c4052dac1d59a1188b2aa9d5a87113aaf1122/server.jar

RUN apk add --no-cache openjdk17-jre
ADD ${MINECRAFT_URL} /usr/libexec/minecraft-server.jar
COPY start.sh /usr/libexec/minecraft-server.sh

USER root
EXPOSE 25565
CMD ["/usr/libexec/minecraft-server.sh"]
