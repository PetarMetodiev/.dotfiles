# Installation instructions

## Configure commit-msg hook

1. Rename `./.git/hooks/commit-msg.sample` to `./.git/hooks/commit-msg`.
2. Replace the contents of `./.git/hooks/commit-msg` with this:

```sh
check=$(head -1 "$1" | grep -w "nvim:\|kitty:\|docs:\|git:\|tmux:\|karabiner:\|shell:\|hs:\|misc:")
if [ "" = "$check" ]; then
  echo "Commit message should start with nvim, kitty, docs, git, tmux, karabiner, shell, hs(for hammerspoon) or misc." 1>&2
  echo "Required format:" 1>&2
  echo "    [prefix]: <description>" 1>&2
  exit 1
fi
```

3. Save and exit.

## Needed software

- ### Chrome extensions

  - [Stardust cookie cutter](https://chrome.google.com/webstore/detail/stardust-cookie-cutter/knliaomflpbgdhnlhomjmmoahdfhnhae) - automatically close (most) cookie consent popups
  - [JSONVue](https://chrome.google.com/webstore/detail/jsonvue/chklaanhfefbnpoihckbnefhakgolnmc) - nice JSON viewer.
  - [Momentum](https://chrome.google.com/webstore/detail/momentum/laookkfknpbbblfpciffpaejjkokdgca) - pretty default page.
  - [Refined github](https://github.com/refined-github/refined-github) - add cool stuff for github. Config is in `./Refined GitHub/Refined GitHub options.json`
  - [Octolinker](https://octolinker.vercel.app/) - working links inside GitHub.
  - [Video Speed Controller](https://chrome.google.com/webstore/detail/video-speed-controller/nffaoalbilbmmfgbnbgppjihopabppdk) - control the speed of all videos.
  - [VisBug](https://chrome.google.com/webstore/detail/visbug/cdockenadnadldjbbgcallicgledbeoc) - Open source web design debug tools built with JavaScript.

- ### [HotKey](https://apps.apple.com/us/app/hotkey-app/id975890633?mt=12)

  Define keyboard shortcuts to launch Applications or to open folders in Finder. Another way is to open the Apps by selecting them from the Status-Menu in Your Mac’s menu bar.

  Config is in `./HotKey/HotKey.config`

- ### [PurePaste](https://sindresorhus.com/pure-paste)

  Paste as plain text by default

- ### [BetterTouchTool](https://folivora.ai/downloads)

  App that allows you to customize various input devices on your Mac.

  Config is in `./BetterTouchTool/Main.bttpreset`.

- ### [TinkerTool](https://www.bresink.com/osx/TinkerTool.html)

  Application that gives you access to additional preference settings Apple has built into macOS.

- ### [Karabiner Elements](https://karabiner-elements.pqrs.org/)

  [Vim navigation](https://ke-complex-modifications.pqrs.org/#capslock_vim_movements)

- ### [Obsidian](https://obsidian.md/) - Obsidian is the private and flexible writing app that adapts to the way you think

  ```sh
  brew install --cask obsidian
  ```

- ### [kitty](https://sw.kovidgoyal.net/kitty/)

  ```sh
  curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
  ```

- ### [Homebrew](https://brew.sh/)

  ```sh
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  ```

- ### [hammerspoon](https://www.hammerspoon.org/) - a tool for powerful automation of macOS

  ```sh
  brew install hammerspoon --cask
  ```

- ### [maccy](https://maccy.app/) - clipboard manager

  ```sh
  brew install --cask maccy
  ```

- ### [MeetingBar](https://meetingbar.app/)

  ```sh
  brew install meetingbar
  ```

- ### [git(Homebrew formula)](https://formulae.brew.sh/formula/git#default)

  ```sh
  brew install git
  ```

- ### [tmux(Homebrew formula)](https://formulae.brew.sh/formula/tmux)

  ```sh
  brew install tmux
  ```

- ### [tmux plugin manager](https://github.com/tmux-plugins/tpm)

  ```sh
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  ```

  And then install the plugins:

  ```sh
  ~/.tmux/plugins/tpm/bin/install_plugins
  ```

- ### [zsh(Homebrew formula)](https://formulae.brew.sh/formula/zsh#default)

  ```sh
  brew install zsh
  ```

- ### [zoxide](https://github.com/ajeetdsouza/zoxide) - A smarter cd command. Supports all major shells

  ```sh
  brew install zoxide
  ```

- ### [Prezto](https://github.com/sorin-ionescu/prezto) - Instantly Awesome Zsh

  > From forked repo:

  ```sh
  git clone --recursive https://github.com/PetarMetodiev/prezto.git "${ZDOTDIR:-$HOME}/.zprezto
  ```

  Then link all zsh configs:

  ```sh
  setopt EXTENDED_GLOB
  for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  done
  ```

- ### [NerdFonts](https://github.com/ryanoasis/nerd-fonts)

  Main font:

  ```sh
  brew install --cask font-caskaydia-cove-nerd-font
  ```

  Cursive font

  ```sh
  brew install --cask font-victor-mono
  ```

  Alternative font

  ```sh
  brew install --cask font-hasklig-nerd-font

  ```

- ### [coreutils(Homebrew formula)](https://formulae.brew.sh/formula/coreutils#default)

  ```sh
  brew install coreutils
  ```

- ### [nvm](https://github.com/nvm-sh/nvm)

  Install `nvm`:

  ```sh
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
  ```

  Install latest `node`:

  ```sh
  nvm install node # "node" is an alias for the latest version
  ```

- ### [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy)

  ```sh
  npm install -g diff-so-fancy
  ```

- ### [prettierd](https://github.com/fsouza/prettierd)

  > Should be handled by LazyVim. No need to install it.

  ```sh
  npm install -g @fsouza/prettierd
  ```

- ### [eslint_d](https://github.com/mantoni/eslint_d.js)

  > Should be handled by LazyVim. No need to install it.

  ```sh
  npm install -g eslint_d
  ```

- ### [Neovim](https://neovim.io/)

  ```sh
  brew install neovim
  ```

- ### [HTTPie](https://httpie.org/) _optional_

  ```sh
  brew install httpie
  ```

- ### [lsd](https://github.com/Peltoche/lsd)

  ```sh
  brew install lsd
  ```

  - [How to install config](./lsd/README.md)

  - [Color configuration](./lscolors/README.md)

- ### [bat](https://github.com/sharkdp/bat)

  ```sh
  brew install bat
  ```

- ### [fd](https://github.com/sharkdp/fd)

  ```sh
  brew install fd
  ```

- ### [ripgrep](https://github.com/BurntSushi/ripgrep)

  ```sh
  brew install ripgrep
  ```

- ### [stylua](https://github.com/JohnnyMorganz/StyLua)

  ```sh
  brew install stylua
  ```
