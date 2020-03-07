if [[ -d "${HOME}/.nvm" ]]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "${NVM_DIR}/nvm.sh" ] && \. "${NVM_DIR}/nvm.sh"  # This loads nvm
fi

if [[ -d "${HOME}/.yarn/bin" ]]; then
  export PATH="${HOME}/.yarn/bin:$PATH"
fi

if [[ ! -d "${HOME}/.npm-packages" ]]; then
  mkdir "${HOME}/.npm-packages"
fi

export NPM_PACKAGES="${HOME}/.npm-packages"

export PATH="${NPM_PACKAGES}/bin:${PATH}"

export MANPATH="$MANPATH:${NPM_PACKAGES}/share/man"
