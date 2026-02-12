# hardened-git-image

A minimal, hardened container image with `git` and `curl`. Built on [Docker Hardened Images (DHI)](https://hub.docker.com/hardened-images/catalog) Alpine base.

This is a secure, lightweight alternative to `bitnami/git` with multi-arch support (amd64/arm64).

## What's included

- `git` — full git client with HTTPS support
- `curl` — HTTP client with TLS
- `wget` — included in the Alpine base
- `unzip` — included in the Alpine base
- `sh` — POSIX shell

## Usage

```bash
docker pull ghcr.io/dylanmtaylor/hardened-git-image:latest
```

```yaml
# Kubernetes example
containers:
  - name: git-sidecar
    image: ghcr.io/dylanmtaylor/hardened-git-image:latest
    command: ["/bin/sh"]
    args:
      - -c
      - git clone --depth 1 https://example.com/repo.git /data
```

## Image size

~21 MB — compared to ~330 MB for `bitnami/git`.

## How it's built

Uses a multi-stage build to install packages via the DHI `-dev` image, then copies only the necessary binaries and libraries into the hardened, minimal base image. No package manager in the final image.
