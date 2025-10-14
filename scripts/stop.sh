#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
cd docker
echo "Stopping containers..."
docker compose stop
echo "Containers stopped. To bring them up again: 'docker compose start' or './scripts/dev-run.sh'"
#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."/docker

echo "Stopping containers..."
docker compose stop

echo "Containers stopped. To resume, run:"
echo "  cd $(pwd) && docker compose start"

echo "If you prefer a full down (remove), run:"
echo "  cd $(pwd) && docker compose down"
