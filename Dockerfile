FROM dhi.io/git:2-alpine3.23-dev AS build
USER root
RUN apk add --no-cache unzip \
    && mkdir -p /runtime-bin \
    && cp /bin/busybox /runtime-bin/busybox \
    && for applet in cat chmod cp cut date find grep head id ln mkdir mv rm sh sleep; do \
         ln -s busybox "/runtime-bin/${applet}"; \
       done

FROM dhi.io/git:2-alpine3.23
COPY --from=build /usr/bin/unzip /usr/local/bin/unzip
COPY --from=build /runtime-bin/ /bin/
USER nonroot
