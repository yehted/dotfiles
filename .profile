# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# Environment variables
export HOME=/home/vagrant
export NS_USER=tyeh
export ERROR_LOG_LEVEL=DEBUG
export LOG_STDOUT=True
export CLICOLOR=1
# export TERM=xterm-256color
export AWS_SECRET_ACCESS_KEY=
export AWS_ACCESS_KEY_ID=
export NPM_AUTH_TOKEN=

# NVM
export NVM_DIR="/home/vagrant/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
# export PATH=~/.npm-global/bin:$PATH

# PyEnv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Nix variables
# export NIX_PATH=$HOME/.nix-profile/nix-expressions
export NIX_PATH="nsnix=$HOME/repos/ns_systems/ns_nix/"
export PATH=$HOME/.nix-profile/bin:$PATH
export NIX_DIRECTORY=/opt/ns
export NS_GITHUB_TOKEN=
export PIPELINE_ID=1
export NSNIX=~/repos/ns_systems/ns_nix

# Aliases
alias rm='rm -i'
alias act='source ./vendor/python/bin/activate'
alias greppy='grep -r --include "*\.py" '
alias act_quill='source /home/vagrant/repos/ns_services/quill_development_toolkit/cli_v2/vendor/python/bin/activate'
alias tmux="TERM=screen-256color-bce tmux"
function explore() {
    ~/repos/ns_data/ns_data/vendor/python/bin/python ~/repos/ns_data/ns_data/src/data/util/explore_object.py $1
}
function sshb () {
        ssh -A -t tyeh@bastion-ssh.n-s.us ssh -A -t ubuntu@$1
}

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
