# jset: Switch between different Java versions (17, 21, system)
# Usage:
#   jset 17
#   jset 21
#   jset system
#
# This function updates:
#   - JAVA_DEFAULT_VER (universal, shared across sessions)
#   - JAVA_HOME and PATH for the current shell.

function jset
    if test (count $argv) -eq 0
        echo "Usage: jset 17 | 21 | system"
        return
    end

    # Store the chosen version in a universal variable so it persists
    switch $argv[1]
        case 17
            set -U JAVA_DEFAULT_VER 17
            set -gx JAVA_HOME (/usr/libexec/java_home -v 17)
        case 21
            set -U JAVA_DEFAULT_VER 21
            set -gx JAVA_HOME (/usr/libexec/java_home -v 21)
        case system
            # Use macOS system default Java
            set -U JAVA_DEFAULT_VER system
            set -gx JAVA_HOME (/usr/libexec/java_home)
        case '*'
            echo "Invalid version: $argv[1]"
            return
    end

    # Update PATH so the chosen Java version is used globally in this shell
    set -gx PATH $JAVA_HOME/bin $PATH

    echo "JAVA_DEFAULT_VER → $JAVA_DEFAULT_VER"
    echo "JAVA_HOME       → $JAVA_HOME"
end
