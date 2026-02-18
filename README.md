# minecraft_docker

Minecraft Java Server `1.21.11` auf `ubuntu:24.04` mit persistenter Auslagerung von Config, World, Mods, Resourcepacks und Logs.
Beim Build werden Artefakte fuer `vanilla`, `fabric`, `forge` und `neoforge` heruntergeladen und vorgehalten.
Versionen werden zentral in der `Dockerfile` gepflegt (kein Build-Arg in `docker-compose.yml`).

## Start

```bash
docker compose up -d --build
```

## Servertyp waehlen

- Auswahl ueber `SERVER_TYPE` in `docker-compose.yml`
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
