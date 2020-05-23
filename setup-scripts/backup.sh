#!/bin/bash

gsutil -m rsync -r -x ".\git/" /persist/home-assistant gs://debian-home-server-backup/home-assistant/$(date +%Y-%m-%d-%H-%M-%S)
gsutil -m rsync -r -x ".\git/" /persist/unifi-controller/data/backup gs://debian-home-server-backup/unifi-controller/$(date +%Y-%m-%d-%H-%M-%S)
