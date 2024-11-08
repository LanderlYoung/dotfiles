# rust mirrors
export RUSTUP_DIST_SERVE=https://mirrors.tuna.tsinghua.edu.cn/rustup

if [[ -e "$HOME/.cargo/env" ]]; then
  . "$HOME/.cargo/env"
fi

if command -v rustup 2>&1 > /dev/null; then
  eval <<< $(rustup completions zsh rustup)
  eval <<< $(rustup completions zsh cargo)
fi
