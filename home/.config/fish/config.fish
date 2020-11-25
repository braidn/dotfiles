# ==================================================================
# Global variable definitions
# ==================================================================
set -U VISUAL "nvim -f"
set -U AWS_SDK_LOAD_CONFIG true
set -U EDITOR "nvim -f"
set -U LC_CTYPE en_US.UTF-8
set -U LC_ALL en_US.UTF-8
set -U GPG_TTY $tty
set -U SSH_AUTH_SOCK $HOME/.gnupg/S.gpg-agent.ssh
set -U CLICOLOR 1
set -U HOMEBREW_NO_AUTO_UPDATE 1
set -U FZF_DEFAULT_COMMAND 'rg --files --no-ignore --hidden --follow -g "!{.git,node_modules,/ops/node_modules}/*"'
set -U FZF_DEFAULT_OPTS '--bind J:down,K:up --ansi '
set -U NNN_OPENER nvim
set -U fish_greeting ""

# Start or re-use a gpg-agent
gpgconf --launch gpg-agent

# Ensure that GPG Agent is used as the SSH agent
set -e SSH_AUTH_SOCK
set -U -x SSH_AUTH_SOCK ~/.gnupg/S.gpg-agent.ssh
# ==================================================================
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
alias le="exa --long --header --git -a --group-directories-first"
alias powah="pmset -g batt"
alias icat="kitty +kitten icat"
alias stitle="kitty @ set-tab-title"
alias omsd="overmind start -D --procfile Procfile.dev"
alias batl="bat --paging=never -l log"
alias postcmd="history -S; history -M"
#Docker
alias de="dcr web bundle exec"
alias dcr="docker-compose run --rm"
alias dcb="docker-compose build"
alias dcs="docker-compose stop"
alias dcu="docker-compose up"
alias drm="docker system prune -f"
alias dsa="docker ps -a | awk 'NR > 1{print $1}' | xargs docker stop > /dev/null 2>&1"
alias dpsa="docker ps -a"
alias images="docker images"
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
#HTTP
alias glosup="http --check-status HEAD https://www.glossier.com"
alias itgup="http --check-status HEAD https://intothegloss.com"
alias ptrnup="http --check-status HEAD https://www.pttrns.com"
# ==================================================================
# Source helper plugins
# ==================================================================
source ~/.asdf/asdf.fish
starship init fish | source
eval (direnv hook fish)
# ==================================================================
# Nord theme
# ==================================================================
set polar_night_darkest 2e3440
set polar_night_dark 3b4252
set polar_night_light 434c5e
set polar_night_lightest 4c566a
set polar_night_comment 616e88

set snow_storm_dark d8dee9
set snow_storm_mid e5e9f0
set snow_storm_light eceff4

set frost_darkest 5e81ac
set frost_dark 81a1c1
set frost_light 88c0d0
set frost_lightest 8fbcbb

set aurora_red bf616a
set aurora_orange d08770
set aurora_yellow ebcb8b
set aurora_green a3be8c
set aurora_magenta b48ead

set fish_color_error $aurora_red --underline
set fish_color_comment $polar_night_comment
set fish_color_quote $aurora_green
set fish_color_match $frost_lightest
set fish_color_command $frost_light
set fish_color_param $snow_storm_dark
set fish_color_autosuggestion $polar_night_comment
set fish_color_redirection $aurora_orange
set fish_color_end $aurora_yellow
set fish_color_operator $frost_light
set fish_color_escape $frost_light

set fish_pager_color_description $frost_light
set fish_pager_color_prefix $snow_storm_dark
set fish_pager_color_completion $frost_dark

set fish_pager_color_selected_description $snow_storm_dark --bold
set fish_pager_color_selected_prefix $snow_storm_dark --bold
set fish_pager_color_selected_completion $snow_storm_dark --bold
set fish_pager_color_selected_background --background=$polar_night_light

set fish_pager_color_progress $aurora_orange
