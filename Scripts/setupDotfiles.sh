git init --bare ~/dotfiles
alias config='/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME'
config config --local status.showUntrackedFiles no
