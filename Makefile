packages-ubuntu:
	sudo apt update
	sudo apt install build-essential ffmpeg wget curl fzf
	# Use a more recent Git version
	sudo apt-add-repository ppa:git-core/ppa
	sudo apt update
	sudo apt install git
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
	source ~/.bashrc
	# Install Node.js
	nvm install --lts

tmux:
	git clone https://github.com/tmux/tmux
	cd tmux && ./autogen.sh && ./configure && make && sudo make install
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	ln -s -f ${PWD}/.tmux.conf /home/${USER}/.tmux.conf

terminal:
	wget "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Regular/FiraCodeNerdFontMono-Regular.ttf" -O "FiraCodeMonoRegular.ttf"
	sudo mv "FiraCodeMonoRegular.ttf" /usr/local/share/fonts/
	curl -sS https://starship.rs/install.sh | sh
	echo "if [ -f ~/.bashrc2 ]; then" >> /home/${USER}/.bashrc
	echo "	. ~/.bashrc2" >> /home/${USER}/.bashrc
	echo "fi" >> /home/${USER}/.bashrc
	ln -s -f ${PWD}/.bashrc2 /home/${USER}/.bashrc2

alacritty-ubuntu:
	mkdir -p ${HOME}/Programs
	sudo apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
	git clone https://github.com/alacritty/alacritty
	cd alacritty && cargo build --release --no-default-features --features=x11
	sudo cp ./alacritty/target/release/alacritty /usr/local/bin/alacritty
	sudo cp ./alacritty/extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
	sudo tic -xe alacritty,alacritty-direct ./alacritty/extra/alacritty.info
	sudo desktop-file-install alacritty/extra/linux/Alacritty.desktop
	sudo update-desktop-database
	ln -s -f ${PWD}/.alacritty.yml /home/${USER}/.alacritty.yml
	ln -s -f ${PWD}/.alacritty.toml /home/${USER}/.alacritty.toml

git:
	ln -s -f ${PWD}/.gitconfig /home/${USER}/.gitconfig

cargo-packages:
	cargo install eza git-delta bat fd-find ripgrep

neovim:
	sudo add-apt-repository ppa:neovim-ppa/unstable
	sudo apt update
	sudo apt install neovim python3-pip
	pip3 install pynvim
	npm install -g neovim
	mkdir -p /home/${USER}/.config
	ln -s -f ${PWD}/nvim/ /home/${USER}/.config/nvim
	sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 150
	sudo update-alternatives --config vim
	sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 150
	sudo update-alternatives --config editor

