#!/bin/sh
set -e

# Run 'bin/rails db:create' and check its exit status
echo "Running 'bin/rails db:create'..."
bin/rails db:create

# Run 'bin/rails db:migrate' after 'db:create', and check its exit status
echo "Running 'bin/rails db:migrate'..."
bin/rails db:migrate

# Run 'bin/rails db:seed' after 'db:migrate', and check its exit status
echo "Running 'bin/rails db:seed'..."
bin/rails db:seed

echo "All database tasks completed successfully."


