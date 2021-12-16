# mssql-tools

SQL Server Command Line Tool on Alpine Linux

# Usage

Default run for sqlcmd help:

```bash
docker run ghcr.io/mrlioncub/mssql-tools
```

Example connect to SQL server:
```bash
docker run -it ghcr.io/mrlioncub/mssql-tools -S <hostname> -U <username>
```
