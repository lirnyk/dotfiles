#
# Makefile for dotfiles
#
SHELL=/bin/bash

help:
	@echo 'Makefile for dotfiles                                                  '
	@echo '                                                                       '
	@echo 'Usage:                                                                 '
	@echo '   make all                         install everything                 '
	@echo '   make install_bash                install bashrc                     '
	@echo '   make install_vim                 install vim files                  '
	@echo '   make install_git                 install git files                  '
	@echo '   make import_gnome_terminal       import gnome-terminal profile      '
	@echo '   make export_gnome_terminal       export gnome-terminal profile      '
	@echo '   make install_gtk                 install gtk files                  '
	@echo '   make install_sublime_text        install sublime text files         '
	@echo '   make install_sublime_merge       install sublime merge files        '
	@echo '                                                                       '
	@echo 'WARNING: when install configuration files, the files are first deleted '
	@echo 'to avoid conflicts                                                     '
	@echo '                                                                       '

all: install_bash install_vim install_git install_gtk
	@echo ""
	@echo "dotfiles install"
	@echo "=================================="
	@echo ""
	@echo "All done."


install_vim: clean_vim
	@echo Place vim config files
	ln -sf `pwd`/vim   ~/.vim
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	vim -u NONE -c "PlugInstall" -c q

clean_vim:
	rm -Rf ~/.vimrc
	rm -Rf ~/.vim


install_git: clean_git
	cp `pwd`/gitconfig ~/.gitconfig

clean_git:
	rm -Rf ~/.gitconfig


install_bash: clean_bash
	ln -sf `pwd`/ctags   ~/.ctags
	cp `pwd`/bash_aliases ~/.bash_aliases

clean_bash:
	rm -Rf ~/.ctags
	rm -Rf ~/.bash_aliases

install_kitty: clear_kitty
	ln -sf `pwd`/config/kitty   ~/.config/kitty

clear_kitty:
	rm -Rf ~/.config/kitty

import_gnome_terminal:
	dconf load /org/gnome/terminal/legacy/profiles:/ < `pwd`/gnome-terminal-profiles.dconf

export_gnome_terminal:
	dconf dump /org/gnome/terminal/legacy/profiles:/ > `pwd`/gnome-terminal-profiles.dconf

install_alacritty: clear_alacritty
	ln -sf `pwd`/config/alacritty ~/.config/alacritty

clear_alacritty:
	rm -Rf ~/.config/alacritty

install_gtk:
	ln -sf `pwd`/config/gtk-3.0/gtk.css ~/.config/gtk-3.0/gtk.css
	ln -sf `pwd`/config/gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini

clean_gtk:
	rm -Rf ~/.config/gtk-3.0/gtk.css
	rm -Rf ~/.config/gtk-3.0/settings.css


install_sublime_text: clear_sublime_text
	@echo Place sublime-text config files
	ln -sf `pwd`/config/sublime-text/Packages/User   ~/.config/sublime-text/Packages/User
	ln -sf `pwd`/config/sublime-text/Packages/Default   ~/.config/sublime-text/Packages/Default
	ln -sf `pwd`/config/sublime-text/Packages/Dictionaries   ~/.config/sublime-text/Packages/Dictionaries
	ln -sf `pwd`/config/sublime-text/Packages/Markdown   ~/.config/sublime-text/Packages/Markdown
	ln -sf `pwd`/config/sublime-text/Packages/PHP   ~/.config/sublime-text/Packages/PHP
	ln -sf `pwd`/config/sublime-text/Packages/FileDiffs   ~/.config/sublime-text/Packages/FileDiffs
	ln -sf `pwd`/config/sublime-text/Packages/Tab\ Filter   ~/.config/sublime-text/Packages/Tab\ Filter
	ln -sf `pwd`/config/sublime-text/Packages/sublimetext-translate   ~/.config/sublime-text/Packages/sublimetext-translate

clear_sublime_text:
	rm -Rf ~/.config/sublime-text/Packages/User


install_sublime_merge: clear_sublime_merge
	@echo Place sublime-merge config files
	ln -sf `pwd`/config/sublime-merge/Packages/User   ~/.config/sublime-merge/Packages/User

clear_sublime_merge:
	rm -Rf ~/.config/sublime-merge/Packages/User

install_vscode: clear_vscode
	@echo Place vscode config files
	ln -sf `pwd`/config/Code/User/settings.json   ~/.config/Code/User/settings.json
	ln -sf `pwd`/config/Code/User/keybindings.json   ~/.config/Code/User/keybindings.json

export_vscode_extensions:
	code --list-extensions > `pwd`/config/Code/User/list-extensions.txt

import_vscode_extensions:
	cat `pwd`/config/Code/User/list-extensions.txt| xargs -L 1 echo code --install-extension

clear_vscode:
	rm ~/.config/Code/User/settings.json
	rm ~/.config/Code/User/keybindings.json

install_emacs: clear_emacs
	@echo Place emacs config files
	ln -sf `pwd`/emacs.d   ~/.emacs.d

clear_emacs:
	rm -Rf ~/.emacs.d
