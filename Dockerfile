FROM dhi.io/alpine-base:3.23-dev AS build
RUN apk add --no-cache git curl wget

FROM dhi.io/alpine-base:3.23
COPY --from=build /usr/lib/ /usr/lib/
COPY --from=build /usr/libexec/git-core /usr/libexec/git-core
COPY --from=build /usr/share/git-core /usr/share/git-core
COPY --from=build /usr/bin/git /usr/local/bin/git
COPY --from=build /usr/bin/curl /usr/local/bin/curl
COPY --from=build /usr/bin/wget /usr/local/bin/wget
