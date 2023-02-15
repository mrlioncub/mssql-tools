FROM alpine

LABEL maintainer="mr.lioncub" \
      link1="https://docs.microsoft.com/en-us/sql/connect/odbc/linux-mac/installing-the-microsoft-odbc-driver-for-sql-server" \
      org.opencontainers.image.source="https://github.com/mrlioncub/mssql-tools"

USER root

RUN set -x \
  && tempDir="$(mktemp -d)" \
  && chown nobody:nobody $tempDir \
  && cd $tempDir \
  && wget https://download.microsoft.com/download/8/6/8/868e5fc4-7bfe-494d-8f9d-115cbcdb52ae/msodbcsql18_18.1.2.1-1_amd64.apk \
  && wget https://download.microsoft.com/download/8/6/8/868e5fc4-7bfe-494d-8f9d-115cbcdb52ae/mssql-tools18_18.1.1.1-1_amd64.apk \
  && apk add --allow-untrusted msodbcsql18_18.1.2.1-1_amd64.apk \
  && apk add --allow-untrusted mssql-tools18_18.1.1.1-1_amd64.apk \
  && rm -rf $tempDir \
  && rm -rf /var/cache/apk/*

USER 1997

ENTRYPOINT ["/opt/mssql-tools18/bin/sqlcmd"]
CMD ["-?"]
