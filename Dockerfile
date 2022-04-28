FROM alpine

LABEL maintainer="mr.lioncub" \
      link1="https://docs.microsoft.com/en-us/sql/connect/odbc/linux-mac/installing-the-microsoft-odbc-driver-for-sql-server" \
      org.opencontainers.image.source="https://github.com/mrlioncub/mssql-tools"

ARG MSSODBCSQL_VERSION=18.0.1.1-1
ARG MSSQLTOOLS_VERSION=18.0.1.1-1

USER root

RUN set -x \
  && tempDir="$(mktemp -d)" \
  && chown nobody:nobody $tempDir \
  && cd $tempDir \
  && wget "https://download.microsoft.com/download/b/9/f/b9f3cce4-3925-46d4-9f46-da08869c6486/msodbcsql18_${MSSODBCSQL_VERSION}_amd64.apk" \
  && wget "https://download.microsoft.com/download/b/9/f/b9f3cce4-3925-46d4-9f46-da08869c6486/mssql-tools18_${MSSQLTOOLS_VERSION}_amd64.apk" \
  && apk add --allow-untrusted msodbcsql18_${MSSODBCSQL_VERSION}_amd64.apk \
  && apk add --allow-untrusted mssql-tools18_${MSSQLTOOLS_VERSION}_amd64.apk \
  && rm -rf $tempDir \
  && rm -rf /var/cache/apk/*

USER 1997

ENTRYPOINT ["/opt/mssql-tools18/bin/sqlcmd"]
CMD ["-?"]
