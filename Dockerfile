FROM alpine

LABEL maintainer="mr.lioncub" \
      link1="https://docs.microsoft.com/en-us/sql/connect/odbc/linux-mac/installing-the-microsoft-odbc-driver-for-sql-server"

ARG MSSODBCSQL_VERSION=17.7.2.1-1
ARG MSSQLTOOLS_VERSION=17.7.1.1-1

USER root

RUN set -x \
  && tempDir="$(mktemp -d)" \
  && chown nobody:nobody $tempDir \
  && cd $tempDir \
  && wget "https://download.microsoft.com/download/e/4/e/e4e67866-dffd-428c-aac7-8d28ddafb39b/msodbcsql17_${MSSODBCSQL_VERSION}_amd64.apk" \
  && wget "https://download.microsoft.com/download/e/4/e/e4e67866-dffd-428c-aac7-8d28ddafb39b/mssql-tools_${MSSQLTOOLS_VERSION}_amd64.apk" \
  && apk add --allow-untrusted msodbcsql17_${MSSODBCSQL_VERSION}_amd64.apk \
  && apk add --allow-untrusted mssql-tools_${MSSQLTOOLS_VERSION}_amd64.apk \
  && rm -rf $tempDir \
  && rm -rf /var/cache/apk/*

USER 1997

ENTRYPOINT ["/opt/mssql-tools/bin/sqlcmd"]
CMD ["-?"]
