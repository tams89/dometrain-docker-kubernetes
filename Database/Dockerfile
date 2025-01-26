FROM mcr.microsoft.com/mssql/server:2022-latest

COPY ./wait-and-run.sh /wait-and-run.sh
COPY ./drop_create_table.sql /drop_create_table.sql
COPY ./seed_data.sql /seed_data.sql

CMD /wait-and-run.sh