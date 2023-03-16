# New Machine Install

```sh
xcode-select --install

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

git clone https://github.com/jayroh/dotfiles.new.git ~/.dotfiles && \
  cd ~/.dotfiles && \
  ./setup
```

The above _will_ install the following via Homebrew cask or the Apple app store:

* Alfred: https://www.alfredapp.com/
* Bartender: https://www.macbartender.com/
* Spotify: https://spotify.com
* Hazel: https://www.noodlesoft.com
* Irvue: https://irvue.tumblr.com/
* JDK: http://www.oracle.com/technetwork/java/javase/downloads/jdk9-downloads-3848520.html
* Magnet: https://magnet.crowdcafe.com/
* Pixelmator Pro: https://www.pixelmator.com/pro/
* Postgres.app: https://postgresapp.com/
* Slack: https://slack.com/downloads/instructions/osx
