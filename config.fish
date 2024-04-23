# disable greetings message
set -g fish_greeting

set -x JAVA_HOME (/usr/libexec/java_home -v 17)
set -x PATH $JAVA_HOME/bin $PATH

# git prompt
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

# alias
alias 'gsync' 'git fetch upstream; git checkout master; git merge upstream/master; git push origin master'

alias 'dnsflush' 'sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'
alias 'dnsget' 'networksetup -getdnsservers Wi-Fi'
alias 'dnssetlocal' 'networksetup -setdnsservers Wi-Fi 127.0.0.1'
alias 'dnssetgoogle' 'networksetup -setdnsservers Wi-Fi 8.8.8.8 8.8.4.4'
alias 'dnssetempty' 'networksetup -setdnsservers Wi-Fi empty'