# Aliases
alias ls='ls --color'
alias ll='ls --color -lah'
alias vim='nvim'
# alias c='clear'

function color {
    colordiff -U "$@" | less -RF
}
alias colordiff='colordiff -u 8'
alias diff='colordiff -u 8'
alias rm='trash' # trash -F; brew install trash
alias pc='proxychains4 -q'
# colorls -> gem install colorls -> https://github.com/athityakumar/colorls
alias lc='colorls'

if [[ $(uname) == "Darwin" ]]; then
  alias open='open'
  alias clipcopy='pbcopy'
  alias clippast='pbpaste'

  # apps
  alias vs='open -a Visual\ Studio\ Code'
else
  # linux
  alias open='xdg-open'
  alias clipcopy='xclip -selection clipboard'
  alias clippast='xclip -selection clipboard -o'
fi

