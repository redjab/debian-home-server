#!/bin/bash

gsutil -m rsync -r -x ".*/.\git/" /persist gs://debian-home-server-backup/$(date +%Y%m%d%H%M%S)
