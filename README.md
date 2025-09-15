# kizzycode/minecraft

A trivial minecraft-server docker image

## EULA
Note: by using this image, you agree to the Minecraft Server EULA.

## Mountpoints and Users
Persistent data is stored in `/var/minecraft`, owned by UID `10000`.

## Entering Console
To enter the administrative console, use `docker compose attach minecraft bash`. To detach from the console without
stopping the container, use `Ctrl+P` followed by `Ctrl+Q`.
