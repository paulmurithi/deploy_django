import multiprocessing

#for development. Remove this line in production
bind="127.0.0.1:8000"
workers=multiprocessing.cpu_count() * 2 + 1
# forwarded-allow-ips="*"
# log-level=debug
reload=True