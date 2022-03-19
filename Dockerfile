FROM alpine:latest

# The latest server from https://www.minecraft.net/de-de/download/server
ENV MINECRAFT_URL https://launcher.mojang.com/v1/objects/c8f83c5655308435b3dcf03c06d9fe8740a77469/server.jar

RUN apk add --no-cache openjdk17-jre
ADD ${MINECRAFT_URL} /usr/libexec/minecraft-server.jar
COPY start.sh /usr/libexec/minecraft-server.sh

USER root
EXPOSE 25565
CMD ["/usr/libexec/minecraft-server.sh"]
