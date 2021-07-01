{{- if eq .chezmoi.osRelease.id "manjaro" }}
#!/bin/sh

sudo pacman -Syu

sudo pacman -S git

sudo pacman -S --needed git base-devel

git clone https://aur.archlinux.org/yay.git

cd yay

makepkg -si

cd $HOME

yay -S ripgrep

yay -S zsh

chsh -s $(which zsh)

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

yay -S neovim python-pip


cargo install exa

 sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

 pip3 install pynvim

 pip3 install pygments

 pip

{{- end}}
