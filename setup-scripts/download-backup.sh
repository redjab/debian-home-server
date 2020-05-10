#!/bin/bash

overwrite_ha=$1

ha_dir="/home/$USER/backup_download/home-assistant"
unifi_dir="/home/$USER/backup_download/unifi-controller"

mkdir -p $ha_dir
mkdir -p $unifi_dir

latest_ha="$(gsutil ls gs://debian-home-server-backup/home-assistant | sort -r | head -n 1)"
latest_unifi="$(gsutil ls gs://debian-home-server-backup/unifi-controller | sort -r | head -n 1)"

gsutil -m rsync -r $latest_ha $ha_dir
gsutil -m rsync -r $latest_unifi $unifi_dir

if [ -n "$overwrite_ha" ]
then
    cp -Rf $ha_dir/* /persist/home-assistant
    rm -rf $ha_dir
    docker restart home-assistant
fi
