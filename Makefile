packages:
	sudo apt update
	sudo apt install git tmux build-essential ffmpeg wget curl

tmux:
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	ln -s -f ${PWD}/.tmux.conf /home/${USER}/.tmux.conf

terminal:
	wget "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Regular/complete/Fira%20Code%20Regular%20Nerd%20Font%20Complete%20Mono.ttf?raw=true" -O "FiraCodeMonoRegular.ttf"
	sudo mv "FiraCodeMonoRegular.ttf" /usr/local/share/fonts/
	curl -sS https://starship.rs/install.sh | sh
	@echo "if [ -f ~/.bashrc2 ]; then\n    . ~/.bashrc2\nfi\n\n" >> /home/${USER}/.bashrc
	ln -s -f ${PWD}/.bashrc2 /home/${USER}/.bashrc2

git:
	ln -s -f ${PWD}/.gitconfig /home/${USER}/.gitconfig

vim-depends:
	sudo apt install libncurses5-dev \
		libgtk2.0-dev libatk1.0-dev \
		libcairo2-dev libx11-dev libxpm-dev libxt-dev python3-dev \
		ruby-dev lua5.3 liblua5.3-dev luajit libluajit-5.1-dev libperl-dev

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

