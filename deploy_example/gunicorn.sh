#! /bin/bash

# declare variables
HOMEDIR=/home/programmer/djangoprojects/deploy-jango/
GUNICORN=/home/programmer/.local/share/virtualenvs/deploy-jango-AxTjPbqZ/bin/gunicorn
SOCKFILE=/home/programmer/.local/share/virtualenvs/deploy-jango-AxTjPbqZ/run/gunicorn.sock
DJANGO_SETTINGS_MODULE=deploy_example.settings
PYTHONPATH=/home/programmer/.local/share/virtualenvs/deploy-jango-AxTjPbqZ/bin/python
DJANGO_WSGI_MODULE=deploy_example.wsgi


# activate virtual environment
cd $HOMEDIR
pipenv shell

cd $HOMEDIR/deploy_example
export DJANGO_SETTINGS_MODULE=$DJANGO_SETTINGS_MODULE
export PYTHONPATH=$PYTHONPATH

RUNDIR=$(dirname $SOCKFILE)
test -d $RUNDIR || mkdir -p $RUNDIR

# start gunicorn
exec $GUNICORN $DJANGO_WSGI_MODULE:application # --bind=unix:$SOCKFILE 
