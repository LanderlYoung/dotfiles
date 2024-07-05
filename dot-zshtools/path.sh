if [[ $(uname) == "Darwin" ]]; then
  PATH=$PATH:${HOME}/Applications/tools/bin/
  PATH=$PATH:${HOME}/Documents/code/chromium/depot_tools
  PATH=$PATH:${HOME}/.cargo/bin
  export PATH
fi
