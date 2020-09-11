ip=$1

curl -X PUT "https://api.cloudflare.com/client/v4/zones/<zone_id>/dns_records/<record_id>" \
     -H "Authorization: Bearer <token>" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"<name>","content":"'$ip'","ttl":1,"proxied":false}'
