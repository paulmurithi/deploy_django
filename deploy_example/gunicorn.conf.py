import multiprocessing

# name
proc_name = 'deploy_example'
user = 'programmer'
group = 'programmer'

#for development. Remove this lines in production
bind="127.0.0.1:8000"
reload=True

workers=multiprocessing.cpu_count() * 2 + 1

forwarded_allow_ips = '*'
    
# headers used by the front-end proxy to indicate HTTPS
secure_scheme_headers = {
    'X-FORWARDED-PROTOCOL': 'ssl', 
    'X-FORWARDED-PROTO': 'https', 
    'X-FORWARDED-SSL': 'on'
}

# logging
accesslog = '-'
errorlog = '-'
loglevel = 'debug'

# ssl keyfile
keyfile = ''

# ssl certile
certfile = ''

# ssl version to use
ssl_version = 'TLS'
