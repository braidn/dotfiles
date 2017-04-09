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
# export BUNDLE_GITHUB__HTTPS=true
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
alias publish="dcr web bundle exec jgd"
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
alias mux="tmuxinator"
#Rails
alias rserv="bundle exec rails s"
alias rc="bundle exec rails c"
#Docker
alias dcr="docker-compose run --rm"
alias dcb="docker-compose build"
alias dcs="docker-compose stop"
alias dcu="docker-compose up"
alias drm="docker ps -a | grep -v 'busybox' | awk 'NR > 1{print $1}' | xargs docker rm > /dev/null 2>&1"
alias dstop="docker ps -a | grep -v 'busybox' | awk 'NR > 1{print $1}' | xargs docker stop > /dev/null 2>&1"
alias dpsa="docker ps -a"
alias images="docker images"
#Language Specific Docker
alias de="dcr web bundle exec"
alias elm='docker run -it --rm -v "$(pwd):/code" -w "/code" -e "HOME=/tmp" -u $UID:$GID -p 8000:8000 codesimple/elm:0.18'
alias crystal='docker run -it --rm -v "$(pwd):/code" -w "/code" -p 3000:3000 --entrypoint crystal crystallang/crystal'
alias shards='docker run -it --rm -v "$(pwd):/code" -w "/code" --entrypoint shards crystallang/crystal'
alias dnode='docker run -it --rm -v "$(pwd):/code" -w "/code" mhart/alpine-node sh'
alias druby='docker run -it --rm -v "$(pwd):/src/repo" -w "/src/repo" braidn/ruby-full-stack:2.3.1 sh'
#Rubys
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
chruby 2.3.0
RUBIES=(/opt/rubies/*)
export RUBIES
#Nodes
export NODENV_ROOT=/opt/nodenv
export NODENV_VERSION=7.4.0

#Functions

# Helper for shell prompts and the like
current-ruby() {
  if [ -z "$RUBY_ROOT" ]; then
    echo "system"
  else
    echo "${RUBY_ROOT##*/}"
  fi
}

if which nodenv > /dev/null; then eval "$(nodenv init -)"; fi

fancy-ctrl-z () {
    fg
    zle redisplay
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z
bindkey -M viins 'jj' vi-cmd-mode
bindkey -v

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[[ -s "$HOME/.qfc/bin/qfc.sh" ]] && source "$HOME/.qfc/bin/qfc.sh"
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

eval "$(direnv hook zsh)"

# added by travis gem
[ -f /Users/braidn/.travis/travis.sh ] && source /Users/braidn/.travis/travis.sh
