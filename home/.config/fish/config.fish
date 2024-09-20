# ==================================================================
# Global variable definitions
# ==================================================================
fish_config theme choose "Tokyonight Storm"
set -U fish_greeting ""

# Start or re-use a gpg-agent
gpgconf --launch gpg-agent

# Ensure that GPG Agent is used as the SSH agent
set -e SSH_AUTH_SOCK
set -Ux SSH_AUTH_SOCK ~/.gnupg/S.gpg-agent.ssh
set -Ux GPG_TTY (tty)
set -Ux VISUAL hx
set -Ux EDITOR hx
set -Ux GIT_EDITOR hx
set -Ux AWS_SDK_LOAD_CONFIG true
set -Ux LC_CTYPE "en_US.UTF-8"
set -Ux LC_ALL "en_US.UTF-8"
set -Ux CLICOLOR 1
set -Ux BAT_THEME DarkNeon
set -Ux HOMEBREW_NO_AUTO_UPDATE 1
set -Ux NNN_OPENER "nvim -f"
set -Ux KITTY_SHELL_INTEGRATION enabled
set -Ux KITTY_LISTEN_ON "unix:/tmp/mykitty"
set -Ux RUBY_CONFIGURE_OPTS "--with-openssl-dir=/opt/homebrew/opt/openssl@1.1"
set -Ux FLYCTL_INSTALL "/Users/braidn/.fly"
set -Ux LDFLAGS "-L/opt/homebrew/opt/mysql-client@5.7/lib"
set -Ux CPPFLAGS "-I/opt/homebrew/opt/mysql-client@5.7/include"
set -Ux PKG_CONFIG_PATH "/opt/homebrew/opt/mysql-client@5.7/lib/pkgconfig"
set -U fish_user_paths /opt/homebrew/bin/ $fish_user_paths
set -U fish_user_paths "$FLYCTL_INSTALL/bin" $fish_user_paths
set -U fish_user_paths "/opt/homebrew/opt/mysql-client@5.7/bin" $fish_user_paths
set -U fish_user_paths "/Users/braidn/.local/bin" $fish_user_paths
set -Ux PYENV_ROOT $HOME/.pyenv
set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
set -g fish_key_bindings fish_vi_key_bindings


# Set up useful aliases
# ==================================================================
#System
alias flushcache="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder;"
alias g="git"
alias v="nvim"
alias nv="nvim"
alias o.="open ."
alias cl="clear"
alias cwd="pwd | pbcopy"
alias ll="ls -lahG"
alias lp="ls -p"
alias lm="ls -la | more"
alias dt="ditto"
alias jg="jobs"
alias br="gh pr view"
alias rr="ranger"
alias le="nnn -de"
alias powah="pmset -g batt"
alias stitle="kitty @ set-tab-title"
alias icat="kitten icat"
alias catssh="kitten ssh"
alias catdiff="kitten diff"
alias batl="bat --paging=never -l log"
alias postcmd="history -S; history -M"
#Containers
alias docker="colima nerdctl"
alias nctl="colima nerdctl"
alias nrm="colima nerdctl system prune -f"
alias nsa="colima nerdctl ps -a | awk 'NR > 1{print $1}' | xargs docker stop > /dev/null 2>&1"
alias npsa="colima nerdctl ps -a"
alias images="colima nerdctl images"
alias k="kubectl"
##JS
alias yarnit="yarn build"
alias jrepl="npx -p jay-repl jay"
alias y="yarn"
#Ruby
alias be="bundle exec"
alias bu="bundle update"
alias bi="bundle install"
alias bip="bundle install --path=.bundle"
alias bis="bundle install --binstubs"
alias gemwipe="gem uninstall -aIx"
# ==================================================================
# Source helper plugins
# ==================================================================
source ~/.asdf/asdf.fish
zoxide init fish | source
starship init fish | source
eval (direnv hook fish)
# ==================================================================
# Misc
# ==================================================================
set fzf_preview_dir_cmd exa --all --color=always
set fzf_fd_opts --hidden --exclude=.git
## Created by `pipx` on 2021-11-10 18:54:22

if status is-interactive
    atuin init fish --disable-ctrl-r | source
end
