#!/bin/bash

# Function to check if the database is up and running
is_database_up() {
    /opt/mssql-tools/bin/sqlcmd -S database -U sa -P Dometrain#1234 -Q "SELECT 1" > /dev/null 2>&1
    return $?
}

# Wait for the database to be up and running
echo "Waiting for the database to be up and running..."
until is_database_up -eq 0; do
    sleep 1
done

echo "Database is up and running."

# Run the SQL scripts in the current directory
for sql_file in /sql/*.sql; do
    echo "Running $sql_file..."
    /opt/mssql-tools/bin/sqlcmd -S database -U sa -P Dometrain#1234 -d master -i "$sql_file"
done

echo "All SQL scripts have been executed."