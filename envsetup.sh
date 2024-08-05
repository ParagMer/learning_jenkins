#!/bin/bash -e

# Print the current directory
if [-d "env"]
then
    echo "Python virtual env exists"
else
    python3 -m venv env
fi

echo $pwd
source env/bin/activate

pip3 install -r requirements.txt

if [-d "logs"]
then
    echo "Log folder exists"
else
    mkdir logs
    touch logs/error.log logs.access.log
fi

sudo chmod -R 777 logs
echo "envsetup finishes"