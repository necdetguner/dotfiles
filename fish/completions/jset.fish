# jset.fish - Autocompletions for the jset function
# This file enables TAB completion for Java version switching.
#
# When typing:  jset <TAB>
# Fish will show: 17, 21, system

# Provide autocomplete options for version 17
complete -c jset -f -a "17" -d "Use Java 17"

# Provide autocomplete options for version 21
complete -c jset -f -a "21" -d "Use Java 21"

# Provide autocomplete option for system default Java
complete -c jset -f -a "system" -d "Use macOS system default Java"
