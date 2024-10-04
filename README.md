
# Dotfiles

A collection of scripts and settings files that configure my computers with my programming tools.

## MacOS settings

* Enable key repeats.

```sh
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
```

* Speed up key repeats. (https://apple.stackexchange.com/questions/10467/how-to-increase-keyboard-key-repeat-rate-on-os-x)

```sh
defaults write -g InitialKeyRepeat -int 15 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 2 # normal minimum is 2 (30 ms)
```

* Add shortcut for maximizing window -- https://apple.stackexchange.com/questions/372719/maximize-window-shortcut
* TODO: Disable CMD+H in alacritty

## Terminal

* Alacritty (optional)
* Install [powerlevel10k](https://github.com/romkatv/powerlevel10k)
    * Install Menlo font
* brew
    * Install Homebrew
    * Configure zsh completions. Add the following to the end of `~/.zshrc`

    ```sh
    fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
    autoload -Uz compinit
    compinit
    ```
* Install [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions).
    * Configure autosuggestions. Add the following to the end of `~/.zshrc`

    ```sh
    source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    ```

### Command-Line Tools

* [eza](https://github.com/eza-community/eza) -- A modern `ls`.
* [bat](https://github.com/sharkdp/bat) -- A modern `cat`
* [skim](https://github.com/lotabout/skim) -- A modern fuzzy finder.
    * Enable reverse search fuzzy finder. Add the following to `~/.zshrc`

    ```sh
    # enable skim reverse search
    source /opt/homebrew/share/zsh/site-functions/key-bindings.zsh
    ```
* ripgrep

## VSCode

* Download [VSCode](https://code.visualstudio.com/)
* Install VSCode Command Line Tools
    * Search for "Shell Command: Install 'code' command in PATH" in Command Palette
* Replace `~/Library/Application Support/Code/User/settings.json` with `vscode/settings.json`.
* Replace `~/Library/Application Support/Code/User/keybindings.json` with `vscode/keybindings.json`.
