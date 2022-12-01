packages:
	sudo apt update
	sudo apt install git tmux build-essential ffmpeg wget curl fzf
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

tmux:
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	ln -s -f ${PWD}/.tmux.conf /home/${USER}/.tmux.conf

terminal:
	wget "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Regular/complete/Fira%20Code%20Regular%20Nerd%20Font%20Complete%20Mono.ttf?raw=true" -O "FiraCodeMonoRegular.ttf"
	sudo mv "FiraCodeMonoRegular.ttf" /usr/local/share/fonts/
	curl -sS https://starship.rs/install.sh | sh
	@echo -e "if [ -f ~/.bashrc2 ]; then\n    . ~/.bashrc2\nfi\n\n" >> /home/${USER}/.bashrc
	ln -s -f ${PWD}/.bashrc2 /home/${USER}/.bashrc2

alacritty:
	mkdir -p ${HOME}/Programs
	sudo apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
	git clone https://github.com/alacritty/alacritty
	cd alacritty && cargo build --release --no-default-features --features=x11
	sudo cp ./alacritty/target/release/alacritty /usr/local/bin/alacritty
	sudo cp ./alacritty/extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
	sudo desktop-file-install alacritty/extra/linux/Alacritty.desktop
	sudo update-desktop-database
	ln -s -f ${PWD}/.alacritty.yml /home/${USER}/.alacritty.yml

git:
	ln -s -f ${PWD}/.gitconfig /home/${USER}/.gitconfig

vim-depends:
	sudo apt install libncurses5-dev \
		libatk1.0-dev libcairo2-dev python3-dev \
		ruby-dev lua5.3 liblua5.3-dev luajit libluajit-5.1-dev libperl-dev

vim:
	git clone https://github.com/vim/vim.git
	cd vim/src && \
		./configure --with-features=huge --enable-multibyte --enable-rubyinterp=yes \
		--enable-python3interp=yes --enable-perlinterp=yes --enable-luainterp=yes --with-luajit=yes \
		--enable-cscope --prefix=/usr/local --with-python3-config-dir=$$(python3-config \
		--configdir) --with-python3-command=python3 --enable-largefile --enable-fail-if-missing \
		&& make -j 8 && sudo make install
	ln -s -f ${PWD}/.vimrc /home/${USER}/.vimrc
	mkdir -p /home/${USER}/.vim
	ln -s -f ${PWD}/coc-settings.json /home/${USER}/.vim/coc-settings.json
	@echo "Vim installed"

