HISTFILE=~/.zsh_history
ZSH_DISABLE_COMPFIX=true

export AWS_SDK_LOAD_CONFIG='true'
export VISUAL='hx'
export EDITOR='hx'
export GIT_EDITOR='hx'
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export GPG_TTY=$(tty)
export SSH_AUTH_SOCK=${HOME}/.gnupg/S.gpg-agent.ssh
export CLICOLOR=1
export HOMEBREW_NO_AUTO_UPDATE=1
export PATH="/opt/homebrew/bin:$PATH"
path+=('/Users/braden.douglass/.rd/bin')

# Aliases
alias batl='bat --paging=never -l log'
alias be='bundle exec'
alias bi='bundle install'
alias bu='bundle update'
alias cwd='pwd | pbcopy'
alias g='git'
alias jg='jobs'
alias ll='ls -lahG'
alias lm='ls -la | more'
alias lp='ls -p'
alias nv='nvim'
alias yarnit='yarn build'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules,/ops/node_modules}/*"'
export FZF_DEFAULT_OPTS='--bind J:down,K:up --ansi '
export NNN_OPENER='nvim'

[[ -s "$HOME/.qfc/bin/qfc.sh" ]] && source "$HOME/.qfc/bin/qfc.sh"
eval "$(direnv hook zsh)"
eval "$(fasd --init auto)"

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

if [[ $TERM_PROGRAM != "WarpTerminal" ]]; then
  fpath+=$HOME/.zsh/typewritten
  autoload -U promptinit; promptinit
  prompt typewritten
fi

fpath=($fpath "/Users/braden.douglass/.zfunctions")
source /Users/braden.douglass/.config/op/plugins.sh
