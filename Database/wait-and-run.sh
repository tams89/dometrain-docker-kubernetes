#!/bin/bash

# Function to check if the database is up and running
is_database_up() {
    /opt/mssql-tools18/bin/sqlcmd -S database -U sa -P Dometrain#123 -Q "SELECT 1" > /dev/null 2>&1
    return $?
}

# Wait for the database to be up and running
until is_database_up -eq 0; do
    /opt/mssql-tools18/bin/sqlcmd -C -S database -U sa -P Dometrain#123 -Q "SELECT 1" > /dev/null 2>&1
    if [ $? -eq 0 ]
    then 
        echo "Database is up and running."
        break
    else
        echo "Waiting for the database to be up and running..."
        sleep 1
    fi
done

# Run the SQL script
/opt/mssql-tools18/bin/sqlcmd -C -S database -U sa -P Dometrain#123 -d master -i /CreateDatabaseAndSeed.sql
echo "All SQL scripts have been executed."