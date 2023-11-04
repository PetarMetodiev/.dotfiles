# Installation instructions

## Configure commit-msg hook

1. Rename `./.git/hooks/commit-msg.sample` to `./.git/hooks/commit-msg`.
2. Replace the contents of `./.git/hooks/commit-msg` with this:

```sh
check=$(head -1 $1 | grep -w "nvim:\|kitty:\|docs:\|git:\|tmux:\|shell:")
if [ "" = "$check" ]; then
	echo "Commit message should start with nvim, kitty, docs, git, tmux or shell." 1>&2
	echo "Required format:" 1>&2
	echo "    [prefix]: <description>" 1>&2
	exit 1
fi
```

3. Save and exit.

## Needed software

- ### [kitty](https://sw.kovidgoyal.net/kitty/)

  ```sh
  curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
  ```

- ### [maccy](https://maccy.app/) - clipboard manager

  ```sh
  brew install --cask maccy
  ```

- ### [Homebrew](https://brew.sh/)

  ```sh
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  ```

- ### [git(Homebrew formula)](https://formulae.brew.sh/formula/git#default)

  ```sh
  brew install git
  ```

- ### [tmux(Homebrew formula)](https://formulae.brew.sh/formula/tmux)

  ```sh
  brew install tmux
  ```

  - ### With true color(not tested):

    ```sh
    brew install tmux --with-truecolor
    ```

- ### [tmux plugin manager](https://github.com/tmux-plugins/tpm)

  ```sh
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  ```

- ### [zsh(Homebrew formula)](https://formulae.brew.sh/formula/zsh#default)

  ```sh
  brew install zsh
  ```

- ### [Prezto](https://github.com/sorin-ionescu/prezto) - Instantly Awesome Zsh

  ```sh
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
  ```

- ### [NerdFonts](https://github.com/ryanoasis/nerd-fonts)

  ```sh
  brew tap homebrew/cask-fonts
  ```

  `brew install --cask font-caskaydia-cove-nerd-font` - also a good option, set horizontal spacing to 101 inside iTerm2

  `brew install --cask font-hasklig-nerd-font` - alternative font

  `brew install --cask font-victor-mono` - cursive font

- ### [zsh-completions](https://github.com/zsh-users/zsh-completions)

  ```sh
  brew install zsh-completions
  ```

  - ### Not sure if really needed or `Prezto` comes with it out of the box

- ### [coreutils(Homebrew formula)](https://formulae.brew.sh/formula/coreutils#default)

  ```sh
  brew install coreutils
  ```

- ### [nvm](https://github.com/nvm-sh/nvm)

  > _Optional_

  ```sh
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
  ```

- ### [Node](https://nodejs.org/en/)

  - Via `Homebrew`

    ```sh
    brew install node
    ```

  - Via `nvm`

    ```sh
    nvm install node # "node" is an alias for the latest version
    ```

- ### [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy)

  ```sh
  npm install -g diff-so-fancy
  ```

- ### [prettierd](https://github.com/fsouza/prettierd)

  ```sh
  npm install -g @fsouza/prettierd
  ```

- ### [eslint_d](https://github.com/mantoni/eslint_d.js)

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
