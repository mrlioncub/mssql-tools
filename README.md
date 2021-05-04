# mssql-tools
[![Build Status](https://img.shields.io/docker/cloud/build/mrlioncub/mssql-tools)](https://hub.docker.com/r/mrlioncub/mssql-tools)
[![Docker Automated build](https://img.shields.io/docker/cloud/automated/mrlioncub/mssql-tools)](https://hub.docker.com/r/mrlioncub/mssql-tools)
[![Docker Image Size](https://img.shields.io/docker/image-size/mrlioncub/mssql-tools/latest)](https://hub.docker.com/r/mrlioncub/mssql-tools)

SQL Server Command Line Tool on Alpine Linux

# Usage

Default run for sqlcmd help:

```bash
docker run mrlioncub/mssql-tools
```

Example connect to SQL server:
```bash
docker run -it mrlioncub/mssql-tools -S <hostname> -U <username>
```
