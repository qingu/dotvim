
ROOT_DIR=$(shell pwd)

.PHONY:link unlink
link:
	ln -sf $(ROOT_DIR)/vimrc ~/.vimrc; \
	ln -sf $(ROOT_DIR)/zshrc ~/.zshrc; \
	ln -sf $(ROOT_DIR)/rc.lua ~/.config/awesome/rc.lua; \
	ln -sf $(ROOT_DIR)/screenrc ~/.screenrc; \
	ln -sf $(ROOT_DIR)/xinitrc ~/.xinitrc; \
	ln -sf $(ROOT_DIR)/xinitrc ~/.xprofile


unlink:
	rm -rf ~/.vimrc; \
	rm -rf ~/.zshrc; \
	rm -rf ~/.config/awesome/rc.lua; \
	rm -rf ~/.screenrc; \
	rm -rf ~/.xinitrc; \
	rm -rf ~/.xprofile
