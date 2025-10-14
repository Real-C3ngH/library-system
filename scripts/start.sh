#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."

# build locally and run with local Tomcat via Docker
cd docker
exec docker compose up -d --build
