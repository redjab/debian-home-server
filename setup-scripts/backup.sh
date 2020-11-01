#!/bin/bash

gsutil -m rsync -r -x ".*(\/)?\.git\/.*|.*\.db$|.*\.log$|core" /persist/home-assistant gs://debian-home-server.appspot.com/home-assistant/$(date +%Y-%m-%d-%H-%M-%S)
gsutil -m rsync -r -x ".*(\/)?\.git\/.*" /persist/unifi-controller/data/backup gs://debian-home-server.appspot.com/unifi-controller/$(date +%Y-%m-%d-%H-%M-%S)
gsutil -m rsync -r /persist/letsencrypt/nginx/site-confs gs://debian-home-server.appspot.com/nginx/$(date +%Y-%m-%d-%H-%M-%S)
gsutil -m rsync -r -x ".*(\/)?\.git\/.*|\.npm\/.*|node_modules/|lib/|.*\.backup$|.*\.log$" /persist/node-red gs://debian-home-server.appspot.com/node-red/$(date +%Y-%m-%d-%H-%M-%S)
