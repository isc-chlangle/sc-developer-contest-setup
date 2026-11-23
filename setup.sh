#!/bin/bash
# Full dev setup: starts SCO Community Edition, then clones and starts SCO Workbench.
#   ./setup.sh          run the Workbench in Docker (http://localhost:3000)
#   ./setup.sh --dev    install the Workbench from source for development (http://localhost:4300)
set -e
cd "$(dirname "$0")"
ROOT=$(pwd)
CE_REPO=https://github.com/intersystems-community/sco-community-setup-example.git
WORKBENCH_REPO=https://github.com/intersystems-community/sco-workbench.git
MODE=${1:-docker}

command -v docker >/dev/null || { echo "Docker is required."; exit 1; }
command -v git >/dev/null || { echo "git is required."; exit 1; }

# Clone a repo, or update it if already cloned
get_repo() {
  if [ -d "$2/.git" ]; then git -C "$2" pull --ff-only; else git clone "$1" "$2"; fi
}

echo "== Starting SCO Community Edition"
get_repo "$CE_REPO" sco-ce-setup
docker compose -f sco-ce-setup/docker-compose.yml up -d

echo "== Getting SCO Workbench"
get_repo "$WORKBENCH_REPO" sco-workbench
cd sco-workbench

# The .env.example defaults already point at a local SCO (host.docker.internal:52773, namespace SC)
[ -f .env ] || cp .env.example .env

if [ "$MODE" = "--dev" ]; then
  echo "== Installing Workbench from source"
  if ! grep -q '^SQLITE_PATH=' .env; then
    cat >> .env <<EOF

# Local source run (see docs/development.md)
SCO_HOST=localhost
SQLITE_PATH=./data/workbench.sqlite
JDBC_LIB_DIR=$ROOT/sco-workbench/backend/jdbc-lib
EOF
  fi
  export NVM_DIR="${NVM_DIR:-$HOME/.nvm}"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" && nvm install
  node -v | grep -q '^v22' || echo "Warning: Workbench expects Node 22 (see .nvmrc)."
  npm install
  echo
  echo "Done. Start the Workbench with:  cd sco-workbench && nvm use && npm run dev"
  echo "Then open http://localhost:4300"
else
  echo "== Starting Workbench in Docker"
  docker compose up -d --build
  echo
  echo "Done. Workbench: http://localhost:3000"
fi
echo "SCO Management Portal: http://localhost:52773/csp/sys/%25CSP.Portal.Home.zen?\$NAMESPACE=SC"
echo "Load the challenge data from dataset/output (see dataset/README.md)."
