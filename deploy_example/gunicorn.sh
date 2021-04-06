#! /bin/bash

# declare variables
NAME="deploy_example"
HOMEDIR=/home/programmer/djangoprojects/deploy-jango/
GUNICORN=/home/programmer/.local/share/virtualenvs/deploy-jango-AxTjPbqZ/bin/gunicorn
SOCKFILE=/home/programmer/.local/share/virtualenvs/deploy-jango-AxTjPbqZ/run/gunicorn.sock
USER=programmer
GROUP=programmer
# NUM_WORKERS=2
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
echo "Starting $NAME as `whoami`"
exec $GUNICORN $DJANGO_WSGI_MODULE:application \
    --name=$NAME \
    # --workers=$NUM_WORKERS \
    --user=$USER --group=$GROUP \
    --log-level=debug \
    --bind=unix:$SOCKFILE \
    --forwarded-allow-ips="*"
