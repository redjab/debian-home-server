#!/bin/bash

gsutil -m rsync -r -x ".\git/|.*\.db$|.*\.log$" /persist/home-assistant gs://debian-home-server-backup/home-assistant/$(date +%Y-%m-%d-%H-%M-%S)
gsutil -m rsync -r -x ".\git/" /persist/unifi-controller/data/backup gs://debian-home-server-backup/unifi-controller/$(date +%Y-%m-%d-%H-%M-%S)
gsutil -m rsync -r /persist/letsencrypt/nginx/site-confs gs://debian-home-server-backup/nginx/$(date +%Y-%m-%d-%H-%M-%S)
gsutil -m rsync -r -x "node_modules/|lib/|.*\.backup$|.*\.log$" /persist/node-red gs://debian-home-server-backup/node-red/$(date +%Y-%m-%d-%H-%M-%S)
