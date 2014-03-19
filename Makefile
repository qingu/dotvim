
.PHONY:link unlink
link:
	ln -sf vimrc ~/.vimrc; \
	ln -sf zshrc ~/.zshrc; \
	ln -sf rc.lua ~/.config/awesome/rc.lua; \
	ln -sf screenrc ~/.screenrc; \
	ln -sf xinitrc ~/.xinitrc; \
	ln -sf xinitrc ~/.xprofile


unlink:
	rm -rf ~/.vimrc; \
	rm -rf ~/.zshrc; \
	rm -rf ~/.config/awesome/rc.lua; \
	rm -rf ~/.screenrc; \
	rm -sf ~/.xinitrc; \
	rm -rf ~/.xprofile
