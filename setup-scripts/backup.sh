#!/bin/bash

current_date=$(date +%Y%m%d%H%M%S);

gsutil -m rsync -r -x ".\git/" /persist/home-assistant gs://debian-home-server-backup/home-assistant/$current_date
gsutil -m rsync -r -x ".\git/" /persist/unifi-controller/data/backup gs://debian-home-server-backup/unifi-controller/$current_date
gsutil -m rsync -r -x ".\git/" /persist/pihole gs://debian-home-server-backup/pihole/$current_date
