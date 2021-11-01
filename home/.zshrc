HISTFILE=~/.zsh_history

export AWS_SDK_LOAD_CONFIG='true'
export VISUAL='nvim -f'
export EDITOR='nvim -f'
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export GPG_TTY=$(tty)
export SSH_AUTH_SOCK=${HOME}/.gnupg/S.gpg-agent.ssh
export CLICOLOR=1
export HOMEBREW_NO_AUTO_UPDATE=1
export PATH="/usr/local/bin:$PATH"

#Ruby
alias gemwipe='gem uninstall -aIx'
alias be="bundle exec"
alias bu="bundle update"
alias bi="bundle install"
##JS
alias yarnit="yarn build"
alias jrepl="npx -p jay-repl jay"
alias y="yarn"
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
alias batl="bat --paging=never -l log"
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
alias de="dcr web bundle exec"
#Functions

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules,/ops/node_modules}/*"'
export FZF_DEFAULT_OPTS='--bind J:down,K:up --ansi '
export NNN_OPENER='nvim'

[[ -s "$HOME/.qfc/bin/qfc.sh" ]] && source "$HOME/.qfc/bin/qfc.sh"
eval "$(direnv hook zsh)"
eval "$(fasd --init auto)"
source /Users/braidn/.config/broot/launcher/bash/br

# ASDF Stuff
. $HOME/.asdf/asdf.sh
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi
eval "$(starship init zsh)"
