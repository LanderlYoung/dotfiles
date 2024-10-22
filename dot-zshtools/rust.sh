# rust mirrors
export RUSTUP_DIST_SERVE=https://mirrors.tuna.tsinghua.edu.cn/rustup

if [[ -e "$HOME/.cargo/env" ]]; then
  . "$HOME/.cargo/env"
fi
