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

# Nix variables
export NIX_PATH=$HOME/.nix-profile/nix-expressions 
export PATH=$HOME/.nix-profile/bin:$PATH
export NIX_DIRECTORY=/opt/ns
export NS_GITHUB_TOKEN=6dc93ff82c15b80b744466a103baac6be9fa2775
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
