# hardened-git-image

Built on the official [Docker Hardened Images](https://hub.docker.com/hardened-images/catalog) `git` runtime image (Alpine), with `unzip` and a minimal BusyBox shell added for Kubernetes content-update scripts.

## What's included

Everything in `dhi.io/git:2-alpine3.23` plus:

- `unzip` for extracting CI artifacts
- `/bin/sh` and the minimal BusyBox applets required by the content-update scripts

The final image does not include the Alpine package manager or the development toolchain used by the build stage.

## Usage

```bash
docker pull ghcr.io/dylanmtaylor/hardened-git-image:latest
```

The inherited entrypoint remains `git`. Override it with `/bin/sh` when running a script:

```bash
docker run --rm --entrypoint /bin/sh \
  ghcr.io/dylanmtaylor/hardened-git-image:latest \
  -c 'git --version && curl --version && unzip -v'
```

Runs as `nonroot` (uid 65532) by default.
