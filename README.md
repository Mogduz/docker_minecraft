# minecraft_docker

Minecraft Java Server `1.21.11` auf `ubuntu:24.04` mit persistenter Auslagerung von Config, World, Mods, Resourcepacks und Logs.
Beim Build werden Artefakte fuer `vanilla`, `fabric`, `forge` und `neoforge` heruntergeladen und vorgehalten.
Alle anpassbaren Variablen liegen in `.env`.

## Start

```bash
docker compose up -d --build
```

## Konfiguration ueber `.env`

Passe in `.env` bei Bedarf an:

- Build/Versionen: `MC_VERSION`, `FABRIC_LOADER_VERSION`, `FABRIC_INSTALLER_VERSION`, `FORGE_VERSION`, `NEOFORGE_VERSION`
- Runtime: `SERVER_TYPE`, `JVM_OPTS`, `EULA`, `MC_PORT`, `CONTAINER_NAME`
- Image: `IMAGE_NAME`, `IMAGE_TAG`
- Mounts: `HOST_CONFIG_DIR`, `HOST_WORLD_DIR`, `HOST_MODS_DIR`, `HOST_RESOURCEPACKS_DIR`, `HOST_LOGS_DIR`

## Servertyp waehlen

- Auswahl ueber `SERVER_TYPE` in `.env`
- Erlaubte Werte: `vanilla`, `fabric`, `forge`, `neoforge`
- Default: `vanilla`

## Persistente Daten

- Config: `./minecraft/config` (z. B. `server.properties`, `eula.txt`, `ops.json`)
- World: `./minecraft/world`
- Mods: `./minecraft/mods`
- Resourcepacks: `./minecraft/resourcepacks`
- Logs: `./minecraft/logs`

Stoppen:

```bash
docker compose down
```

## Befehle in die Server-Konsole senden

Direkt als Alias-Befehl im Container (Beispiel):

```bash
docker exec -it minecraft-java help
docker exec -it minecraft-java list
docker exec -it minecraft-java reload
docker exec -it minecraft-java stop
```

Fuer beliebige (auch modded) Commands:

```bash
docker exec -it minecraft-java mc-cmd "<dein command>"
```
