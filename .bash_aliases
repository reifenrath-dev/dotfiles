localVersion=3
remoteVersion=$(curl https://raw.githubusercontent.com/reifenrath-dev/dotfiles/refs/heads/main/.bash_aliases 2> /dev/null | head -n1 | grep -o "[0-9]*")
if [ $remoteVersion -gt $localVersion ]
then
    echo "New version of your bash_aliases available!"
    echo "Remote: $remoteVersion Local: $localVersion"
elif [ $localVersion -gt $remoteVersion ]
then
    echo "Your local version is newer than the remote. Commit your changes!"
    echo "Remote: $remoteVersion Local: $localVersion"
fi

# https://stackoverflow.com/a/677212
command_exists () {
    command -v "$1" 2>&1 >/dev/null
}

# starship
if ! command_exists starship
then
    echo "starship not installed! https://github.com/starship/starship"
    echo "1. curl -sS https://starship.rs/install.sh | sh"
    echo '2. add: eval "$(starship init bash)" to your ~/.bashrc'
else
    eval "$(starship init bash)"
fi

# zoxide
if ! command_exists zoxide
then
    echo "zoxide not installed! https://github.com/ajeetdsouza/zoxide"
    echo "1. sudo apt install zoxide fzf"
    echo '2. add: eval "$(zoxide init bash)" to the end of your ~/.bashrc'
fi

# lsd
if ! command_exists lsd
then
    echo "lsd not installed! https://github.com/lsd-rs/lsd"
    echo "sudo apt install lsd"
else
    alias ls='lsd'
    alias ll='ls -alF'
    alias la='ls -A'
    alias lla='ls -la'
    alias lt='ls --tree'
fi

# fd
if ! command_exists fdfind
then
    echo "fd is not installed or not setup correctly! https://github.com/sharkdp/fd"
    echo "steps for Ubuntu"
    echo "1. sudo apt install fd-find"
    echo "2. ln -s $(which fdfind) ~/.local/bin/fd"
fi

# setting the editor
if command_exists codium
then
    alias edit="codium"
elif command_exists code
then
    alias edit="code"
elif command_exists nano
then
    alias edit="nano"
elif command_exists vim
then
    alias edit="vim"
fi
alias e="edit"

# general aliases
alias reload="source ~/.bashrc"
alias r="reload"
alias bashrc="e ~/.bashrc"
alias bashaliases="e ~/.bash_aliases"
alias gitconfig="e ~/.gitconfig"
alias gconf="gitconfig"
