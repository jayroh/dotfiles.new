export JAVA_HOME=$(/usr/libexec/java_home)

path=( "/usr/bin" "/bin" "/usr/sbin" "/sbin" )
path=( "$HOME/.bin" "$HOME/.rbenv/bin" "/usr/local/bin" $path )
path=( "$JAVA_HOME/jre/bin" $path )
