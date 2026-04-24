FROM dhi.io/git:2-alpine3.23-dev AS build
USER root
RUN apk add --no-cache unzip

FROM dhi.io/git:2-alpine3.23
COPY --from=build /usr/bin/unzip /usr/local/bin/unzip
USER nonroot
