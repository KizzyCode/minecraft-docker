FROM alpine:latest

# The latest server from https://www.minecraft.net/en-us/download/server
ENV MINECRAFT_URL https://piston-data.mojang.com/v1/objects/84194a2f286ef7c14ed7ce0090dba59902951553/server.jar

# Install JVM and add minecraft user
RUN apk add --no-cache openjdk17-jre-headless
RUN adduser -S -H -D -u 1000 -s /sbin/nologin minecraft

# Install server
ADD ${MINECRAFT_URL} /usr/libexec/minecraft-server.jar
RUN chmod u=rwX,g=rx,o=rx /usr/libexec/minecraft-server.jar
COPY start.sh /usr/libexec/minecraft-server.sh

USER minecraft
EXPOSE 25565
CMD ["/usr/libexec/minecraft-server.sh"]
