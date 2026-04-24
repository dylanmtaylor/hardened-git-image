# hardened-git-image

Built on the official [Docker Hardened Images](https://hub.docker.com/hardened-images/catalog) `git` image (Alpine) with `unzip` added.

## What's included

Everything in `dhi.io/git:2-alpine3.23-dev` plus:

- `unzip` — for extracting zip archives (e.g. CI artifacts)

## Usage

```bash
docker pull ghcr.io/dylanmtaylor/hardened-git-image:latest
```

Runs as `nonroot` (uid 65532) by default.
