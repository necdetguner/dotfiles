# jver: Display the currently active Java version and JAVA_HOME path.
# Usage:
#   jver

function jver
    echo "JAVA_HOME = $JAVA_HOME"
    java -version
end
