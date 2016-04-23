## Install

1. Set up [Vundle]:
   ```
   git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
   ```

2. Symlink relevant config files
   ```
   git clone https://github.com/draco/dotfiles.git ~/dotfiles
   ln -s ~/dotfiles/.vimrc ~/.vimrc
   ln -s ~/dotfiles/themes/spacegray/colors ~/.vim/colors
   ln -s ~/dotfiles/custom/honukai.zsh-theme ~/.oh-my-zsh/themes
   ln -s ~/dotfiles/.tmux.conf ~/
   ```

3. Install Plugins:
   Launch `vim` and run `:PluginInstall`
   To install from command line: `vim +PluginInstall +qall`

4. Install [the_silver_searcher](https://github.com/ggreer/the_silver_searcher) (for Ag)
   ```
   brew install the_silver_searcher
   ```

5. Add the following to `~/.zshrc`
   ```
   export LANG=en_US.UTF-8
   export LC_ALL=en_US.UTF-8
   ```

6. Change color preset in iTerm2 to use `~/dotfiles/themes/spacegray/iTerm2/spacegray.itermcolors`.

7. Restart your iTerm2/Terminator, vim and zsh.

