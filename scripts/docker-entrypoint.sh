# start the nginx service
service nginx start

# start the consul template
consul-template \
  -consul "$CONSUL_HOST" \
  -log-level "$CONSUL_LOG_LEVEL" \
  -config "$CONSUL_CONFIG"
