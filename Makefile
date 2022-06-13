packages:
	sudo apt update
	sudo apt install git tmux build-essential

tmux:
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	ln -s -f ${PWD}/.tmux.conf /home/${USER}/.tmux.conf

# bashrc:
# 	@echo "if [ -f ~/.bashrc2 ]; then\n    . ~/.bashrc2\nfi\n\n" >> /home/${USER}/.bashrc
# 	ln -s -f ${PWD}/.bashrc2 /home/${USER}/.bashrc2

git:
	ln -s -f ${PWD}/.gitconfig /home/${USER}/.gitconfig

ssh:
	mkdir ${USER}/.ssh
	ln -s -f ${PWD}/sshconfig /home/${USER}/.ssh/config

