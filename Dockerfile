FROM alpine:latest

# The 1.21 server from https://www.minecraft.net/en-us/download/server
ENV MINECRAFT_URL https://piston-data.mojang.com/v1/objects/450698d1863ab5180c25d7c804ef0fe6369dd1ba/server.jar

# Install JVM and add minecraft user
RUN apk add --no-cache openjdk21-jre-headless
RUN adduser -S -H -D -u 10000 -s /sbin/nologin minecraft

# Install server
ADD ${MINECRAFT_URL} /usr/libexec/minecraft-server.jar
RUN chmod u=rwX,g=rx,o=rx /usr/libexec/minecraft-server.jar
COPY start.sh /usr/libexec/minecraft-server.sh

USER minecraft
EXPOSE 25565
CMD ["/usr/libexec/minecraft-server.sh"]
