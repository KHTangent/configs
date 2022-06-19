packages:
	sudo apt update
	sudo apt install git tmux build-essential ffmpeg

tmux:
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	ln -s -f ${PWD}/.tmux.conf /home/${USER}/.tmux.conf

# bashrc:
# 	@echo "if [ -f ~/.bashrc2 ]; then\n    . ~/.bashrc2\nfi\n\n" >> /home/${USER}/.bashrc
# 	ln -s -f ${PWD}/.bashrc2 /home/${USER}/.bashrc2

git:
	ln -s -f ${PWD}/.gitconfig /home/${USER}/.gitconfig

ssh:
	mkdir -p /home/${USER}/.ssh
	ln -s -f ${PWD}/sshconfig /home/${USER}/.ssh/config

vim-depends:
	sudo apt install libncurses5-dev \
		libgtk2.0-dev libatk1.0-dev \
		libcairo2-dev libx11-dev libxpm-dev libxt-dev python3-dev \
		python3.8-dev ruby-dev lua5.3 liblua5.3-dev luajit libluajit-5.1-dev libperl-dev

vim:
	git clone https://github.com/vim/vim.git
	cd vim/src && \
		./configure --enable-gui=gtk2 --with-features=huge --enable-multibyte --enable-rubyinterp=yes \
		--enable-python3interp=yes --enable-perlinterp=yes --enable-luainterp=yes --with-luajit=yes \
		--enable-gui=gtk2 --enable-cscope --prefix=/usr/local --with-python3-config-dir=$$(python3-config \
		--configdir) --with-python3-command=python3 --enable-largefile --enable-fail-if-missing \
		&& make -j 8 && sudo make install
	ln -s -f ${PWD}/.vimrc /home/${USER}/.vimrc
	@echo "Vim installed"

