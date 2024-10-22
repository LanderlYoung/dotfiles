
# check Clash Verge reachablility
CLASH_PROXY_PORT=7897
if nc -z localhost $CLASH_PROXY_PORT 2> /dev/null; then
  # consist clash port
  export https_proxy=http://localhost:$CLASH_PROXY_PORT \
    http_proxy=http://localhost:$CLASH_PROXY_PORT \
    all_proxy=socks5://localhost:$CLASH_PROXY_PORT
fi

unset CLASH_PROXY_PORT
