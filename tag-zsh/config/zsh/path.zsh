[[ -d /usr/lib/jvm/java-8-openjdk-amd64 ]] &&  export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
[[ -x /usr/libexec/java_home ]] &&  export JAVA_HOME=$(/usr/libexec/java_home)

path=( "/usr/bin" "/bin" "/usr/sbin" "/sbin" )
path=( "node_modules/.bin" "$HOME/.bin" "$HOME/.rbenv/bin" "/usr/local/bin" $path )
path=( "$JAVA_HOME/jre/bin" $path )
