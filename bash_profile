export NODE_PATH="/usr/local/lib/node"
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/share/npm/bin:$PATH"
PS1="\u$ "
alias ll="ls -lahG"
alias lp="ls -p"
alias lm="ls -la | more"
alias cwd='pwd | pbcopy'
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # This loads RVM into a shell session.