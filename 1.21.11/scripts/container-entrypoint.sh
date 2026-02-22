#!/usr/bin/env bash
set -euo pipefail

if [[ $# -eq 0 ]]; then
  set -- /usr/local/bin/start-minecraft.sh
fi

if [[ "$(id -u)" -eq 0 ]]; then
  mkdir -p /data/config /data/world /data/mods /data/resourcepacks /data/logs /run
  touch /run/minecraft.pid

  # Ensure bind-mounted data directories are writable by the runtime user.
  chown -R minecraft:minecraft /data
  chown minecraft:minecraft /run/minecraft.pid

  exec gosu minecraft "$@"
fi

exec "$@"
