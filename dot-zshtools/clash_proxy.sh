
# check Clash Verge reachablility
CLASH_PROXY_PORT=7897

function proxy_setup() {
  export https_proxy=http://localhost:$CLASH_PROXY_PORT \
      http_proxy=http://localhost:$CLASH_PROXY_PORT \
      all_proxy=socks5://localhost:$CLASH_PROXY_PORT
}

function proxy_unset() {
  unset http_proxy https_proxy all_proxy
}

if nc -z localhost $CLASH_PROXY_PORT 2> /dev/null; then
  proxy_setup
fi

unset CLASH_PROXY_PORT
