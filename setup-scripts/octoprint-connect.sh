curl -X POST "http://<octo print url>/api/connection" \
     -H "X-Api-Key: <api key>" \
     -H "Content-Type: application/json" \
     --data-raw '{"port":"AUTO","baudrate":0,"printerProfile":"_default","autoconnect":true,"command":"connect"}'