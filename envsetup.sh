#!/bin/bash

# Check if the virtual environment directory exists
if [ -d "env" ]; then
    echo "Python virtual env exists"
else
    python3 -m venv env
fi

# Print the current directory
echo $PWD

# Activate the virtual environment
if [ -f "env/bin/activate" ]; then
    source env/bin/activate
else
    echo "Failed to activate virtual environment"
    exit 1
fi

# Install the required Python packages
if command -v pip &> /dev/null; then
    pip install -r requirements.txt
else
    echo "pip not found"
    exit 1
fi

# Check if the logs directory exists
if [ -d "logs" ]; then
    echo "Log folder exists"
else
    mkdir logs
    touch logs/error.log logs/access.log
fi

# Change permissions for the logs directory
chmod -R 777 logs

echo "envsetup finishes"
