## Steps

1. Set up [Vundle]:
   ```
   git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
   ```

2. Symlink vimrc file
   ```
   git clone https://github.com/draco/dotfiles.git ~/dotfiles
   ln -s ~/dotfiles/vimrc ~/.vimrc
   ```

3. Install Plugins:
   Launch `vim` and run `:PluginInstall`
   To install from command line: `vim +PluginInstall +qall`

4. Install [the_silver_searcher](https://github.com/ggreer/the_silver_searcher) (for Ag)
   ```
   brew install the_silver_searcher
   ```

5. Add the following to your .bash_profile or .zshrc 
   ```
   export LANG=en_US.UTF-8
   export LC_ALL=en_US.UTF-8
   ```

6. Put solarized colors into ~/.vim/colors
 
   ```
   mkdir ~/.vim/colors
   cp ~/.vim/bundle/vim-colors-solarized/colors/solarized.vim ~/.vim/colors/
   ```

1. Go to [iTerm online gallery](https://code.google.com/p/iterm2/wiki/ColorGallery)

2. Download _Solarized Dark_ theme.

3. Import downloaded theme in _iTerm > Colors > Load preset`.

1. Install the `Menlo-Powerline.otf` font-face.

1. Change the font (for both alias and anti-alias) to `Menlo-Powerline.otf` in iTerm's settings.

1. Open `~/.zshrc/`, add `DEFAULT_USER="change to OS X username"` and edit the theme to `ZSH_THEME="agnoster"`.

1. Replace `~/.oh-my-zsh/themes/agnoster.zsh-theme` and use the `agnoster.zsh-theme` included in this repository (_this fixes font-rendering issues_).

1. Restart vim and zsh.

7. Profit!!!

## Sample Commands

1. `<Space>w` writes to file (save)
2. `<Space>q` quit
3. `<Space>e` write + quit
4. `<Space>t` new tab
5. `<Space>y` copy to clipboard
6. `<Space>p` paste from clipboard
7. `<Ctrl-n>` Open Nerdtree File Browsing (https://github.com/scrooloose/nerdtree)
8. `<Ctrl-f>` Search text using Ag (https://github.com/rking/ag.vim)
9. `<Ctrl-p>` Fuzzy file finder (https://github.com/kien/ctrlp.vim)

