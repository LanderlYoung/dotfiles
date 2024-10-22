# User configuration
if [[ -z $JAVA_HOME && -x /usr/libexec/java_home ]]; then
    # default to JDK 11
    export JAVA_HOME=$(/usr/libexec/java_home -v 11)
fi
function switch_jdk() { export JAVA_HOME=$(/usr/libexec/java_home -v $1); echo $JAVA_HOME }
