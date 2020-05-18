source /usr/local/share/antigen/antigen.zsh
PROMPT_GEOMETRY_COLORIZE_SYMBOL=true
antigen bundle robbyrussell/oh-my-zsh lib/

antigen bundle git
antigen bundle vi-mode
antigen bundle rupa/z
antigen bundle gem
antigen bundle tmuxinator
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle colored-man-pages
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure

antigen apply

PURE_GIT_PULL=0
HISTFILE=~/.zsh_history
zstyle :prompt:pure:prompt:success color white


export AWS_SDK_LOAD_CONFIG='true'
export VISUAL='nvim -f'
export EDITOR='nvim -f'
export GOPATH=$HOME/src/play/go
export ASDF_DIR=/usr/local/opt/asdf

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export GPG_TTY=$(tty)
export SSH_AUTH_SOCK=${HOME}/.gnupg/S.gpg-agent.ssh
export CLICOLOR=1
export HOMEBREW_NO_AUTO_UPDATE=1
export PATH="/usr/local/bin:$PATH"
PS1="$PS1"'$([ -n "$TMUX"  ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'
eval "$(fasd --init auto)"

#Bundler
alias be="bundle exec"
alias bu="bundle update"
alias bi="bundle install"
alias bip="bundle install --path=.bundle"
alias bis="bundle install --binstubs"
#Yarn
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
alias jg="jobs"
alias br="gh pr view"
alias rr="ranger"
alias avim="NVIM_LISTEN_ADDRESS=/tmp/neovim/neovim nvim"
alias jsc="/System/Library/Frameworks/JavaScriptCore.framework/Versions/Current/Resources/jsc"
alias kcli="'/Library/Application Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli'"
alias tagit="ctags -R -f ./.git/tags ."
alias le="exa --long --header --git -a --group-directories-first"
alias powah="pmset -g batt"
alias icat="kitty +kitten icat"
alias stitle="kitty @ set-tab-title"
alias omsd="overmind start -D --procfile Procfile.dev"
#Services
alias bs="brew services"
alias bsglossa="brew services start postgresql && brew services start redis"
alias bsglosso="brew services stop postgresql && brew services stop redis"
#Rails
alias rserv="bundle exec rails s"
alias rc="bundle exec rails c"
#Ruby
alias gemwipe='gem uninstall -aIx'
#Docker
alias dcr="docker-compose run --rm"
alias dcb="docker-compose build"
alias dcs="docker-compose stop"
alias dcu="docker-compose up"
alias drm="docker system prune -f"
alias dsa="docker ps -a | awk 'NR > 1{print $1}' | xargs docker stop > /dev/null 2>&1"
alias dpsa="docker ps -a"
alias images="docker images"
alias k="kubectl"
#Language Specific Docker
##JS
alias yarnit="yarn build"
alias jrepl="npx -p jay-repl jay"
alias y="yarn"
##Ruby
alias de="dcr web bundle exec"
##Elm
alias elm='docker run -it --rm -v "$(pwd):/code" -w "/code" -e "HOME=/tmp" -u $UID:$GID -p 8000:8000 codesimple/elm:0.18'
##Rust
alias cargod='docker run --rm --user "$(id -u)":"$(id -g)" -v "$PWD":/usr/src/myapp -w /usr/src/myapp -e USER="old-gregg" rust:1.21 cargo'
alias rustc='docker run --rm --user "$(id -u)":"$(id -g)" -v "$PWD":/usr/src/myapp -w /usr/src/myapp rust:1.21 rustc'
alias rustr='docker run --rm --user "$(id -u)":"$(id -g)" -v "$PWD":/usr/src/myapp -w /usr/src/myapp rust:1.21'
#Swagger
alias swagger-edit='docker run -ti --rm --volume="$(pwd)":/swagger -p 8080:8080 zixia/swagger-edit'
#HTTP
alias glosup='http --check-status HEAD https://www.glossier.com'
alias itgup='http --check-status HEAD https://intothegloss.com'
alias ptrnup='http --check-status HEAD https://www.pttrns.com'
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
    fg
    zle redisplay
}
zle -N fancy-ctrl-z
bindkey '^X' fancy-ctrl-z
bindkey -M viins 'jj' vi-cmd-mode
bindkey -v

function fzf-history() {
  BUFFER=$(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="History > ")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N fzf-history
bindkey '^r' fzf-history

unalias z 2> /dev/null
z() {
  [ $# -gt 0 ] && _z "$*" && return
  cd "$(_z -l 2>&1 | fzf --height 40% --nth 2.. --reverse --inline-info +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//')"
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules,/ops/node_modules}/*"'
export FZF_DEFAULT_OPTS='--bind J:down,K:up --ansi '
export NNN_OPENER='nvim'
export NNN_NOTE='/Users/braidn/src/wiki'

[[ -s "$HOME/.qfc/bin/qfc.sh" ]] && source "$HOME/.qfc/bin/qfc.sh"
eval "$(direnv hook zsh)"
eval "`fnm env --multi`"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
[[ -s "$HOME/.asdf/asdf.sh" ]] && source "$HOME/.asdf/asdf.sh"
[[ -s "$HOME/.asdf/completions/asdf.bash" ]] && source "$HOME/.asdf/completions/asdf.bash"
