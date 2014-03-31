
ROOT_DIR=$(shell pwd)

.PHONY:link unlink
link:
	ln -sf $(ROOT_DIR)/vimrc ~/.vimrc; \
	ln -sf $(ROOT_DIR)/bundle ~/.vim/bundle; \
	ln -sf $(ROOT_DIR)/zshrc ~/.zshrc; \
	ln -sf $(ROOT_DIR)/rc.lua ~/.config/awesome/rc.lua; \
	ln -sf $(ROOT_DIR)/screenrc ~/.screenrc; \
	ln -sf $(ROOT_DIR)/xinitrc ~/.xinitrc; \
	ln -sf $(ROOT_DIR)/xinitrc ~/.xprofile; \
	ln -sf $(ROOT_DIR)/tmux.conf ~/.tmux.conf; \
	ln -sf $(ROOT_DIR)/gitconfig ~/.gitconfig


unlink:
	rm -f ~/.vimrc; \
	rm -rf ~/.vim/bundle; \
	rm -f ~/.zshrc; \
	rm -f ~/.config/awesome/rc.lua; \
	rm -f ~/.screenrc; \
	rm -f ~/.xinitrc; \
	rm -f ~/.xprofile; \
	rm -f ~/.tmux.conf; \
	rm -f ~/.gitconfig
