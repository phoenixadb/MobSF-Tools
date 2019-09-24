#!/bin/bash
# Launch MobSF

export LANG=en_US.UTF-8
source ~/.bash_profile

echo 'MobSF is launching'

cd $HOME/Mobile-Security-Framework-MobSF
. venv/bin/activate 
gunicorn -b 127.0.0.1:8000 MobSF.wsgi:application --workers=1 --threads=10 --timeout=1800 >> ~/Library/Logs/mobsf/mobsf.log &

echo 'MobSF launched'
