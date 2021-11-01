# ==================================================================
# Global variable definitions
# ==================================================================
set -U fish_greeting ""

# Start or re-use a gpg-agent
gpgconf --launch gpg-agent

# Ensure that GPG Agent is used as the SSH agent
set -e SSH_AUTH_SOCK
set -Ux SSH_AUTH_SOCK ~/.gnupg/S.gpg-agent.ssh
set -Ux GPG_TTY (tty)
set -Ux VISUAL "nvim -f"
set -Ux EDITOR "nvim -f"
set -Ux AWS_SDK_LOAD_CONFIG true
set -Ux LC_CTYPE "en_US.UTF-8"
set -Ux LC_ALL "en_US.UTF-8"
set -Ux CLICOLOR 1
set -Ux HOMEBREW_NO_AUTO_UPDATE 1
set -Ux NNN_OPENER "nvim -f"
set -Ux GH_TOKEN 485c5674dc161858b00765de681bf772dcc03531
set -Ux AWS_CONFIGURE_SSO_DEFAULT_SSO_START_URL https://awsgloss.awsapps.com/start
set -Ux AWS_CONFIGURE_SSO_DEFAULT_SSO_REGION us-east-1
set -Ux AWS_DEFAULT_REGION us-east-1
set -Ux AWS_PROFILE dev-rw


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
alias icat="kitty +kitten icat"
alias stitle="kitty @ set-tab-title"
alias omsd="overmind start -D --procfile Procfile.dev"
alias batl="bat --paging=never -l log"
alias postcmd="history -S; history -M"
#Docker
alias dcr="docker-compose run --rm"
alias dcb="docker-compose build"
alias dcs="docker-compose stop"
alias dcu="docker-compose up"
alias drm="docker system prune -f"
alias dsa="docker ps -a | awk 'NR > 1{print $1}' | xargs docker stop > /dev/null 2>&1"
alias dpsa="docker ps -a"
alias images="docker images"
alias de="docker-compose run --rm web bundle exec"
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
zoxide init fish | source
starship init fish | source
eval (direnv hook fish)
# ==================================================================
# # TokyoNight Color Palette
# ==================================================================

set -l foreground c0caf5
set -l selection 364A82
set -l comment 565f89
set -l red f7768e
set -l orange ff9e64
set -l yellow e0af68
set -l green 9ece6a
set -l purple 9d7cd8
set -l cyan 7dcfff
set -l pink bb9af7

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment


# ==================================================================
# Nord theme
# ==================================================================
# set polar_night_darkest 2e3440
# set polar_night_dark 3b4252
# set polar_night_light 434c5e
# set polar_night_lightest 4c566a
# set polar_night_comment 616e88

# set snow_storm_dark d8dee9
# set snow_storm_mid e5e9f0
# set snow_storm_light eceff4

# set frost_darkest 5e81ac
# set frost_dark 81a1c1
# set frost_light 88c0d0
# set frost_lightest 8fbcbb

# set aurora_red bf616a
# set aurora_orange d08770
# set aurora_yellow ebcb8b
# set aurora_green a3be8c
# set aurora_magenta b48ead

# set fish_color_error $aurora_red --underline
# set fish_color_comment $polar_night_comment
# set fish_color_quote $aurora_green
# set fish_color_match $frost_lightest
# set fish_color_command $frost_light
# set fish_color_param $snow_storm_dark
# set fish_color_autosuggestion $polar_night_comment
# set fish_color_redirection $aurora_orange
# set fish_color_end $aurora_yellow
# set fish_color_operator $frost_light
# set fish_color_escape $frost_light

# set fish_pager_color_description $frost_light
# set fish_pager_color_prefix $snow_storm_dark
# set fish_pager_color_completion $frost_dark

# set fish_pager_color_selected_description $snow_storm_dark --bold
# set fish_pager_color_selected_prefix $snow_storm_dark --bold
# set fish_pager_color_selected_completion $snow_storm_dark --bold
# set fish_pager_color_selected_background --background=$polar_night_light

# set fish_pager_color_progress $aurora_orange
# ==================================================================
# Misc
# ==================================================================
set fzf_preview_dir_cmd exa --all --color=always
set fzf_fd_opts --hidden --exclude=.git
# ==================================================================
# function sso
#   set -e AWS_PROFILE
#   set AWS_PROFILE $argv[1]
#   aws sts get-caller-identity &> /dev/null || aws sso login || set -e AWS_PROFILE && aws-configure-sso-profile --profile $argv[1]
#   eval aws-export-credentials --env-export
# end
