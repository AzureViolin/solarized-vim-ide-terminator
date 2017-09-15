# solarized-vim-ide-terminator

## Usage
```bash
cp -r terminator ~/.config/
cp .vimrc ~/
mkdir ~/.vim
cp -r bundle ~/.vim/
cp -r fonts ~/.local/share
sudo cp -r conf.avail /etc/fonts/

cd /etc/fonts/conf.d
sudo ln -sf ../conf.avail/10-powerline-symbols.conf 10-powerline-symbols.conf

fc-cache -fv
```

## New fonts
1. put new fonts in ./fonts
1. change ./conf.avail/10-powerline-symbols.conf accordingly with help from following commands:
	1. `fc-list` Lists available fonts
	1. `fc-match` Display a list of fonts and the name referred to it
