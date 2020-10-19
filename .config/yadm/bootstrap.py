#!/usr/bin/env python3
import subprocess
import os
subprocess.run(f'cd {os.environ.get("HOME")}')

# Generate s
sshC = input("Add ssh key(s)? y/n: ")
mail = ""

setGit = input("set git variables?")

if setGit == "y" or setGit == "yes":
    mail = input("what is your mail: ")
    name = input("What is your name?: ")
    subprocess.run('git config --global user.name "{name}"')
    subprocess.run('git config --global user.email "{mail}"')

if sshC == "y" or sshC == "yes":
    sshC = 1
else:
    sshC = 0

while sshC == 1 :

    if  mail == "":

        mail = input( "What is your mail to be added to the end of the ssh key?: ")

    fileName = input("What to name the file?: ")
    command = f'ssh-keygen -t rsa -b 4096 -q -f "{os.environ.get("HOME")}/.ssh/{fileName}" -N "" -C "{mail}"'
    subprocess.run(command)

    answer = input("add another key? y/n: ")
    
    if answer == "y" or answer == "yes":
        sshC = 1 
    else:
        sshC = 0

print("Updating the yadm repo origin URL")
subprocess.run('yadm remote set-url origin "git@github.com:YousofMersal/Dotfiles.git"')

print("updating packages...")
subprocess.run("sudo apt update && sudo apt dist-upgrade -y")

print("installing all packages in one go")
subprocess.run("sudo apt install zsh neovim python3-pip build essential gdb ripgrep -y")
subprocess.run("wget -P ~ https://git.io/.gdbinit")

print("installing n/node and sdkman/java 14")
subprocess.run('sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"')

print("installing n for node management")
subprocess.run('curl -L https://git.io/n-install | bash')

print("installing sdkman")
subprocess.run('curl -s "https://get.sdkman.io" | bash')
subprocess.run('sdk install java 14.0.2.fx-librca')

subprocess.run('git clone https://github.com/gpakosz/.tmux.git')
subprocess.run('ln -s -f .tmux/.tmux.conf')
subprocess.run('cp .tmux/.tmux.conf.local .')

subprocess.run("curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh")

subprocess.run("cargo install exa")

subprocess.run("sh -c 'curl -fLo \"${XDG_DATA_HOME:-$HOME/.local/share}\"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'")

subprocess.run("yadm pull origin master")

subprocess.run("pip3 install pynvim")

subprocess.run("pip3 install pygments")

subprocess.run("nvim --headless +PlugInstall +qall")

print("Set up script is done!")
