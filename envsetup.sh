#!/bin/bash

# Check if the virtual environment directory exists
if [ -d "env" ]; then
    echo "Python virtual environment exists."
else
    python3 -m venv env
fi

# Activate the virtual environment
source env/bin/activate

# Install the required packages
pip3 install -r requirements.txt

# Check if the logs directory exists
if [ -d "logs" ]; then
    echo "Log folder exists."
else
    mkdir logs
    touch logs/error.log logs/access.log
fi

# Change permissions of the logs directory
sudo chmod -R 777 logs
