FROM alpine:latest

# The latest server from https://www.minecraft.net/de-de/download/server
ENV MINECRAFT_URL https://piston-data.mojang.com/v1/objects/f69c284232d7c7580bd89a5a4931c3581eae1378/server.jar

RUN apk add --no-cache openjdk17-jre
ADD ${MINECRAFT_URL} /usr/libexec/minecraft-server.jar
COPY start.sh /usr/libexec/minecraft-server.sh

USER root
EXPOSE 25565
CMD ["/usr/libexec/minecraft-server.sh"]
