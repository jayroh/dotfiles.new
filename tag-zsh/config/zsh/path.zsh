[[ -d /usr/lib/jvm/java-8-openjdk-amd64 ]] &&  export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
[[ -x /usr/libexec/java_home ]]            &&  export JAVA_HOME=$(/usr/libexec/java_home)

path=( "/usr/bin" "/bin" "/usr/sbin" "/sbin" )
path=( "/Applications/Postgres.app/Contents/Versions/latest/bin" $path )
path=( "$HOME/.npm-packages/bin" "node_modules/.bin" "$HOME/.bin" "$HOME/.rbenv/bin" "/usr/local/bin" $path )
path=( "/usr/local/opt/elasticsearch@2.4/bin" $path )
path=( "$JAVA_HOME/jre/bin" $path )
path=( "/usr/lib/go-1.8/bin" $path )
path=( "/usr/local/opt/imagemagick@6/bin" $path )

[[ -d $HOME/Qt5.5.1/5.5/clang_64/bin ]] && path=( "$HOME/Qt5.5.1/5.5/clang_64/bin" $path )

if [[ -d /usr/local/opt/openssl/bin ]]; then
  path=( "/usr/local/opt/openssl/bin" $path )
  export LDFLAGS=-L/usr/local/opt/openssl/lib
  export CPPFLAGS=-I/usr/local/opt/openssl/include
  export PKG_CONFIG_PATH=/usr/local/opt/openssl/lib/pkgconfig
fi
