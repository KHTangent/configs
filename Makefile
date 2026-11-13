updated-ubuntu-packages:
	sudo apt update
	sudo apt install -y software-properties-common build-essential \
		ffmpeg wget curl fzf bison libevent-dev autoconf automake \
		pkg-config libncurses-dev
	# Use a more recent Git version
	sudo apt-add-repository -y ppa:git-core/ppa
	sudo apt update
	sudo apt install -y git

neovim-ubuntu:
	sudo add-apt-repository -y ppa:neovim-ppa/unstable
	sudo apt update
	sudo apt install -y neovim python3-pip python3-pynvim tree-sitter-cli
	. "$$HOME/.nvm/nvm.sh" && npm install -g neovim
	sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 150
	sudo update-alternatives --set vim /usr/bin/nvim
	sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 150
	sudo update-alternatives --set editor /usr/bin/nvim

nodejs:
	wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.41.0/install.sh | bash
	# Install Node.js
	. "$$HOME/.nvm/nvm.sh" && nvm install --lts

rust:
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

tmux-compiled:
	git clone https://github.com/tmux/tmux
	cd tmux && ./autogen.sh && ./configure && make && sudo make install
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	ln -s -f ${PWD}/.tmux.conf /home/${USER}/.tmux.conf

font:
	sudo mkdir -p /usr/local/share/fonts
	wget "https://github.com/ryanoasis/nerd-fonts/raw/refs/tags/v3.5.1/patched-fonts/FiraCode/FiraCodeNerdFontMono-Regular.ttf" -O "FiraCodeMonoRegular.ttf"
	sudo mv "FiraCodeMonoRegular.ttf" /usr/local/share/fonts/

cargo-packages:
	. "$$HOME/.cargo/env" && cargo install eza git-delta bat fd-find ripgrep

starship:
	curl -sS https://starship.rs/install.sh | sh

packages-ubuntu: updated-ubuntu-packages nodejs neovim-ubuntu starship tmux-compiled font rust cargo-packages

dotfiles:
	mkdir -p /home/${USER}/.config
	ln -sf ${PWD}/.tmux.conf /home/${USER}/.tmux.conf
	ln -sf ${PWD}/starship.toml /home/${USER}/.config/starship.toml
	echo "if [ -f ~/.bashrc2 ]; then" >> /home/${USER}/.bashrc
	echo "	. ~/.bashrc2" >> /home/${USER}/.bashrc
	echo "fi" >> /home/${USER}/.bashrc
	ln -sf ${PWD}/.bashrc2 /home/${USER}/.bashrc2
	ln -sf ${PWD}/.gitconfig /home/${USER}/.gitconfig
	ln -sfn ${PWD}/nvim/ /home/${USER}/.config/nvim

.PHONY: all-ubuntu packages-ubuntu dotfiles rust nodejs starship

all-ubuntu: packages-ubuntu dotfiles
