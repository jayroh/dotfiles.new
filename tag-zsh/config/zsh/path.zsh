[[ -d /usr/lib/jvm/java-8-openjdk-amd64 ]] && export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
[[ -x /usr/libexec/java_home ]]            && export JAVA_HOME=$(/usr/libexec/java_home)
[[ -d "$HOME/.yarn/bin" ]]                 && export PATH="$HOME/.yarn/bin:$PATH"
[[ -d "$HOME/.nvm" ]]                      && export NVM_DIR="$HOME/.nvm"

path=( "/usr/bin" "/bin" "/usr/sbin" "/sbin" "/snap/bin" )
path=( "$HOME/.npm-packages/bin" "node_modules/.bin" "$HOME/.bin" "/usr/local/bin" $path )
path=( "$HOME/.local/bin" $path )
path=( "$JAVA_HOME/jre/bin" $path )
[[ -d $HOME/Qt5.5.1/5.5/clang_64/bin ]] && path=( "$HOME/Qt5.5.1/5.5/clang_64/bin" $path )

PG_APP_BIN="/Applications/Postgres.app/Contents/Versions/latest/bin"
[[ -d $PG_APP_BIN ]] && path=( $PG_APP_BIN $path )

if [ "$(uname -m 2> /dev/null)" = "arm64" ]; then
  export HOMEBREW_HOME="/opt/homebrew"
else
  export HOMEBREW_HOME="/usr/local"
fi

if [[ -f "$HOMEBREW_HOME/bin/brew" ]] &> /dev/null; then
  path=( "$HOMEBREW_HOME/bin" "$HOMEBREW_HOME/sbin" $path )
  path=( "$HOMEBREW_HOME/opt/imagemagick@6/bin" $path )
  path=( "$HOMEBREW_HOME/opt/bison@2.7)/bin" $path )

  if [[ -d $HOMEBREW_HOME/opt/openssl/bin ]]; then
    path=( "$HOMEBREW_HOME/opt/openssl/bin" $path )
    export LDFLAGS="-L$HOMEBREW_HOME/opt/openssl/lib"
    export CPPFLAGS="-I$HOMEBREW_HOME/opt/openssl/include"
    export PKG_CONFIG_PATH="$HOMEBREW_HOME/openssl/lib/pkgconfig"
  fi
fi
