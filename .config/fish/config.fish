if status is-interactive
    # Commands to run in interactive sessions can go here
    # set exports

    set -x GUI 1
    set -x TERMINAL kitty
    set -x ICONLOOKUP 1
    set -x EDITOR nvim
    set -x VISUAL nvim
    set -x MONITOR eDP
    set -x TEXMFHOME $HOME/.texmf
    set -x RUSTC_WRAPPER sccache
    set -x ANDROID_HOME $HOME/MassStorage/Android/SDK
    set -x N_PREFIX $HOME/n

    set -gx PATH $PATH $ANDROID_HOME/emulator
    set -gx PATH $PATH $ANDROID_HOME/tools
    set -gx PATH $PATH $ANDROID_HOME/tools/bin
    set -gx PATH $PATH $ANDROID_HOME/platform-tools


    if test -d $N_PREFIX/bin
        set -gx PATH $PATH $N_PREFIX/bin
    end

    #set PATH $HOME/.local/bin $PATH
    #set PATH /usr/local/texlive/2020/bin/x86_64-linux $PATH
    #set -gx PATH $PATH /usr/local/go/bin/ 
    #set -gx PATH $PATH ~/.local/bin/

    #aliases

    abbr -a vimdiff 'nvim -d'
    abbr -a cat "bat"
    abbr -a ols "\\ls"
    abbr -a pip "pip3"
    abbr -a ls "exa"
    abbr -a lst "exa --git-ignore -T"
    abbr -a l "exa -la"
    abbr -a v "nvim"
#git and yadm shotcuts
    abbr -a ya "yadm add"
    abbr -a ga "git add"
    abbr -a ycmsg "yadm commit -m"
    abbr -a gcmsg "git commit -m"
    abbr -a yp "yadm push"
    abbr -a gp "git push"
    abbr -a yl "yadm pull"
    abbr -a gl "git pull"
    abbr -a yst "yadm status"
    abbr -a gst "git status"

    abbr -a timeit "hyperfine"
    abbr -a o "xdg-open"
    abbr -a pr 'gh pr create -t (git show -s --format=%s HEAD) -b (git show -s --format=%B HEAD | tail -n+3)'
    abbr -a gah 'git stash; and git pull --rebase; and git stash pop'
    abbr -a yah 'yadm stash; and yand pull --rebase; and yadm stash pop'

    alias clip "xclip -selection clipboard"
    alias clipv "xclip -selection clipboard -o"

    #alias fzfp="fzf --preview 'bat {-1} --color=always'"
    #alias N="$HOME/n/bin/n"
    #alias ddu="( cd ~/docker ; sudo docker-compose down && sudo docker-compose up -d)"

    starship init fish | source
    zoxide init fish | source

    #fish_add_path -P (ruby -e 'print Gem.user_dir')/x86_64-linux $PATH
end

