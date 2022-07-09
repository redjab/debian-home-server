#!/bin/bash
find /persist/home-assistant/backups -maxdepth 1 -type f | xargs -x -r ls -t | awk 'NR>1' | xargs -r -L1 rm

gsutil -m rsync -r -x ".*(\/)?\.git\/.*|.*\.db$|.*\.log$|core" /persist/home-assistant/backups gs://debian-home-server.appspot.com/home-assistant/$(date +%Y-%m-%d-%H-%M-%S)
gsutil -m rsync -r -x ".*(\/)?\.git\/.*" /persist/unifi-controller/data/backup gs://debian-home-server.appspot.com/unifi-controller/$(date +%Y-%m-%d-%H-%M-%S)
gsutil -m rsync -r /persist/letsencrypt/nginx/site-confs gs://debian-home-server.appspot.com/nginx/$(date +%Y-%m-%d-%H-%M-%S)
gsutil -m rsync -r -x ".*(\/)?\.git\/.*|\.npm\/.*|node_modules/|lib/|.*\.backup$|.*\.log$" /persist/node-red gs://debian-home-server.appspot.com/node-red/$(date +%Y-%m-%d-%H-%M-%S)
gsutil -m rsync -r /persist/mosquitto gs://debian-home-server.appspot.com/mosquitto/$(date +%Y-%m-%d-%H-%M-%S)
gsutil -m rsync -r /persist/.vscode gs://debian-home-server.appspot.com/.vscode/$(date +%Y-%m-%d-%H-%M-%S)
gsutil -m rsync -r  -x "logs|generated|uploads" /persist/octoprint/octoprint gs://debian-home-server.appspot.com/octoprint/octoprint/$(date +%Y-%m-%d-%H-%M-%S)
gsutil -m rsync -r  -x "logs|generated|uploads" /persist/octoprint/octoprint gs://debian-home-server.appspot.com/octoprint/octoprint/$(date +%Y-%m-%d-%H-%M-%S)
gsutil -m rsync -r  -x "media" /persist/frigate gs://debian-home-server.appspot.com/frigate/$(date +%Y-%m-%d-%H-%M-%S)
