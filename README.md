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
  
  - ### [HTTPie](https://httpie.org/) _optional_
  ```sh
  brew install httpie
  ```
  
  - ### [colorls](https://github.com/athityakumar/colorls)
  ```sh
  gem install colorls
  ```
  
  - ### [the_silver_searcher](https://github.com/ggreer/the_silver_searcher)
  ```sh
  brew install the_silver_searcher
  ```
  
  - ### [bat](https://github.com/sharkdp/bat)
  ```sh
  brew install bat
  ```
