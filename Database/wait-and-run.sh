#!/bin/bash

# Function to check if the database is up and running
is_database_up() {
    nc -z database 5432
    return $?
}

# Wait for the database to be up and running
echo "Waiting for the database to be up and running..."
until is_database_up; do
    sleep 1
done

echo "Database is up and running."

# Run the SQL scripts in the current directory
for sql_file in *.sql; do
    echo "Running $sql_file..."
    psql -h database -U sa -P Dometrain#1234 -d master -i "$sql_file"
done

echo "All SQL scripts have been executed."