# Installation
1. Clone this repository into the `~/zshrc` folder.
2. Copy this line into your `~/.zshrc`:
```
source ~/zshrc/zshrc
```
3. Install `Antidote` (https://getantidote.github.io/install) for zsh plugin management: `brew install Antidote` and run `source $HOMEBREW_PREFIX/opt/antidote/share/antidote/antidote.zsh` (the source command is already in the .zshrc).
5. Build plugins file: `antidote bundle <zsh_plugins.txt >~/.zsh_plugins.sh`
