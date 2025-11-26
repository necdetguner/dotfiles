# Disable the default greeting message
set -g fish_greeting

# --- Default Java Version (persistent using a universal variable) ---
# JAVA_DEFAULT_VER is a fish universal variable shared across all fish sessions.
# If it's not set yet, default to 17.
set -q JAVA_DEFAULT_VER; or set -U JAVA_DEFAULT_VER 17

# Compute JAVA_HOME based on JAVA_DEFAULT_VER
if test "$JAVA_DEFAULT_VER" = "system"
    # Use macOS system default Java
    set -gx JAVA_HOME (/usr/libexec/java_home)
else
    # Use a specific Java version (e.g. 17, 21)
    set -gx JAVA_HOME (/usr/libexec/java_home -v $JAVA_DEFAULT_VER)
end

# Prepend the selected JAVA_HOME to PATH
set -gx PATH $JAVA_HOME/bin $PATH

# Set language / locale
set -x LANG en_US.UTF-8

# --- Git Prompt Customization ---
# Configure a detailed and visually informative Git prompt.
set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_showdirtystate 'yes'
set -g __fish_git_prompt_char_stateseparator ' '
set -g __fish_git_prompt_char_dirtystate "✖"
set -g __fish_git_prompt_char_cleanstate "✔"
set -g __fish_git_prompt_char_untrackedfiles "…"
set -g __fish_git_prompt_char_stagedstate "●"
set -g __fish_git_prompt_char_conflictedstate "+"
set -g __fish_git_prompt_color_dirtystate yellow
set -g __fish_git_prompt_color_cleanstate green --bold
set -g __fish_git_prompt_color_invalidstate red
set -g __fish_git_prompt_color_branch cyan --dim --italics

# --- Aliases ---
alias 'gsync' 'git fetch upstream; git checkout master; git merge upstream/master; git push origin master'

alias 'dnsflush' 'sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'
alias 'dnsget' 'networksetup -getdnsservers Wi-Fi'
alias 'dnssetlocal' 'networksetup -setdnsservers Wi-Fi 127.0.0.1'
alias 'dnssetgoogle' 'networksetup -setdnsservers Wi-Fi 8.8.8.8 8.8.4.4'
alias 'dnssetempty' 'networksetup -setdnsservers Wi-Fi empty'

# --- OrbStack integration ---
# Automatically installed by OrbStack; loads CLI support
source ~/.orbstack/shell/init2.fish 2>/dev/null || :

# --- LM Studio CLI integration ---
set -gx PATH $PATH /Users/necdet/.lmstudio/bin

# --- Load helper functions if available ---
# jset  → switch Java version easily (and persist choice)
# jver  → show active Java version
functions -q jset; or source ~/.config/fish/functions/jset.fish
functions -q jver; or source ~/.config/fish/functions/jver.fish

# Added by Antigravity
fish_add_path /Users/necdet/.antigravity/antigravity/bin
