# Holiday Rush Programming Challenge

| Path | Contents |
|---|---|
| [CONTEST_DESCRIPTION.md](CONTEST_DESCRIPTION.md) | The challenge |
| [dataset/](dataset/) | CrunchCo sample data (`dataset/output/`) and the scripts that build it |
| [setup.sh](setup.sh) | One-step dev setup |

## Dev setup

Requires Docker and git. `--dev` mode also requires Node 22 (via [nvm](https://github.com/nvm-sh/nvm)).

```bash
./setup.sh          # SCO Community Edition + SCO Workbench in Docker
./setup.sh --dev    # SCO Community Edition + SCO Workbench from source
```

The script:
1. Clones [sco-community-setup-example](https://github.com/intersystems-community/sco-community-setup-example) into `sco-ce-setup/`, or updates it if it's already there, then starts SCO Community Edition on ports `52773` and `1972`.
2. Clones [SCO Workbench](https://github.com/intersystems-community/sco-workbench) into `sco-workbench/`, or updates it if it's already there.
3. Creates `sco-workbench/.env` from `.env.example` if it doesn't exist yet.
4. Starts the Workbench at http://localhost:3000, or, with `--dev`, installs it from source (start it with `npm run dev`, then open http://localhost:4300).

The default `.env` values are SCO user `superuser` with password `SYS` and namespace `SC`. Check that they match your Community Edition instance. The AI Assistant is optional and needs a Claude provider; see `sco-workbench/.env.example`.

To stop everything:

```bash
docker compose -f sco-ce-setup/docker-compose.yml down
(cd sco-workbench && docker compose down)
```
