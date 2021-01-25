# Installation instructions

## Needed software
  - ### [iTerm2](https://www.iterm2.com/)
  
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
  > With true color(not tested):
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
  > `brew cask install font-sourcecodepro-nerd-font-mono` - main font
  
  > `brew cask install font-hasklig-nerd-font` - non-ascii font
  
  - ### [Powerlevel9k](https://github.com/bhilburn/powerlevel9k) - The most awesome Powerline theme for ZSH around!
  [Install instructions](https://github.com/bhilburn/powerlevel9k/wiki/Install-Instructions#option-3-install-for-prezto)
  
  - ### [zsh-completions](https://github.com/zsh-users/zsh-completions)
  ```sh
  brew install zsh-completions
  ```
  > Not sure if really needed or `Prezto` comes with it out of the box
  
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
  > Via `Homebrew`
  ```sh
  brew install node
  ```
  > Via `nvm`
  ```sh
  nvm install node # "node" is an alias for the latest version
  ```
  
  - ### [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy)
  ```sh
  npm install -g diff-so-fancy
  ```
  
  - ### [prettier](https://prettier.io)
  ```sh
  npm install -g prettier
  ```
  
  - ### [Vim(Homebrew formula)](https://formulae.brew.sh/formula/vim#default)
  > Needs Xcode
  ```sh
  brew install vim
  ```
  > If `Xcode` is not needed(not sure if this is ok)
  ```sh
  brew install vim --with-override-system-vi
  ```
  
  - ### [Neovim](https://neovim.io/)
  ```sh
  brew install neovim
  ```
  > For latest version(seems to be stable enough)
  ```sh
  brew install neovim --HEAD
  ```
  
  - ### [Python3(Homebrew formula)](https://formulae.brew.sh/formula/python#default)
  > Optionally for neovim
  ```sh
  brew install python
  ```
  
  - ### [Language servers](https://langserver.org/)
  	- #### [javascript-typescript-langserver](https://github.com/sourcegraph/javascript-typescript-langserver)
	  > _Seems to be more popular(based on GitHub stars) but throws random warnings on startup_
	  ```sh
	  npm install -g javascript-typescript-langserver
	  ```
  
	  - #### [typescript-language-server](https://github.com/theia-ide/typescript-language-server)
	  > _Not as popular as [javascript-typescript-langserver](https://github.com/sourcegraph/javascript-typescript-langserver)(based on GitHub stars) but does not throw random warnings on startup and [claims to be following the LSP spec as closely as possible unlike competitors](https://www.reddit.com/r/vscode/comments/cafp6k/which_language_server_does_vscode_use_for/f6lzsqw/)_
	  ```sh
	  npm install -g typescript-language-server
	  ```
  
	  - #### [vim-language-server](https://github.com/iamcco/vim-language-server)
	  ```sh
	  npm install -g vim-language-server
	  ```
  
    - #### [css-languageserver](https://github.com/vscode-langservers/vscode-css-languageserver-bin)
    ```sh
    npm install -g vscode-css-languageserver-bin
    ```

  - ### [HTTPie](https://httpie.org/) _optional_
  ```sh
  brew install httpie
  ```
  
  - ### ~~[colorls](https://github.com/athityakumar/colorls)~~
  > _Slow and dependent on ruby(which itself is quite unreliable). Replaced it with [lsd](#lsd)_
  ```sh
  gem install colorls
  ```
  
  - ### [lsd](https://github.com/Peltoche/lsd)
  ```sh
  brew install lsd
  ```
  > [How to install config](./lsd/README.md)
  
  > [Color configuration](./lscolors/README.md)
  
  - ### [the_silver_searcher](https://github.com/ggreer/the_silver_searcher)
  ```sh
  brew install the_silver_searcher
  ```
  
  - ### [bat](https://github.com/sharkdp/bat)
  ```sh
  brew install bat
  ```

  - ### [fzf](https://github.com/junegunn/fzf)
  ```sh
  brew install fzf

  # To install useful key bindings and fuzzy completion:
  $(brew --prefix)/opt/fzf/install
  ```
