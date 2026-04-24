FROM dhi.io/git:2-alpine3.23-dev
USER root
RUN apk add --no-cache unzip
USER nonroot
