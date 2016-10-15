export VISUAL='nvim -f'
export EDITOR='nvim -f'
export GOPATH=$HOME/src/play/go

# export CC="/usr/bin/gcc-4.2"
# perl warnings
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export DISABLE_SPRING=1
export SSL_CERT_FILE=/usr/local/etc/openssl/cert.pem
export CLICOLOR=1
PS1="$PS1"'$([ -n "$TMUX"  ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'
# export SSL_CERT_FILE=/opt/boxen/homebrew/etc/openssl/certs/ca_bundle.pem
# tmuxinator scripts for saving specific tmux setups and projects
# qfc for quick file completion on
[ -f /opt/boxen/env.sh  ] && source /opt/boxen/env.sh

. `brew --prefix`/etc/profile.d/z.sh


if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

eval "$(fasd --init auto)"

#Blrg
alias publish="bundle exec jgd"
#Bundler
alias be="bundle exec"
alias bu="bundle update"
alias bi="bundle install"
alias bip="bundle install --path=.bundle"
alias bis="bundle install --binstubs"
#System
alias flushcache="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder;"
alias g="git"
alias v="nvim"
alias nv="nvim"
alias o.="open ."
alias cl="clear"
alias cwd='pwd | pbcopy'
alias ll="ls -lahG"
alias lp="ls -p"
alias lm="ls -la | more"
alias dt="ditto"
alias ctr="ctags -R -f ./.git/tags ."
alias agrr="ag --ignore-dir log --ignore-dir tmp --ignore tags --ignore-dir node_modules --ignore-dir _build"
alias jg="jobs"
alias br="hub browse"
alias rr="ranger"
alias avim="NVIM_LISTEN_ADDRESS=/tmp/neovim/neovim nvim"
alias jsc="/System/Library/Frameworks/JavaScriptCore.framework/Versions/Current/Resources/jsc"
alias tagit="ctags -R -f ./.git/tags ."
#Tmux
alias tkil="tmux kill-session -t"
alias tnw="tmux new-window -n"
alias tls="tmux ls"
alias tat="tmux at -d -t"
#Rails
alias rserv="bundle exec rails s"
alias rc="bundle exec rails c"
#Docker
alias dcr="docker-compose run"
#Chruby
source /opt/boxen/chruby/share/chruby/chruby.sh
source /opt/boxen/chruby/share/chruby/auto.sh
RUBIES=(/opt/rubies/*)
export RUBIES

#Functions

# Helper for shell prompts and the like
current-ruby() {
  if [ -z "$RUBY_ROOT" ]; then
    echo "system"
  else
    echo "${RUBY_ROOT##*/}"
  fi
}

fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    fg
    zle redisplay
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[[ -s "$HOME/.qfc/bin/qfc.sh" ]] && source "$HOME/.qfc/bin/qfc.sh"
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

eval "$(direnv hook zsh)"
