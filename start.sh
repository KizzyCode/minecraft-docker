#!/bin/sh
set -eu

# Go into minecraft dir
cd "/var/minecraft"
java -Xmx8192M -Xms2048M -jar "/usr/libexec/minecraft-server.jar" nogui
