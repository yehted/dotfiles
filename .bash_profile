# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
PATH=$PATH:$HOME/.local/bin:$HOME/bin

# Environment variables
export HOME=/home/vagrant
export NS_USER=tyeh
export ERROR_LOG_LEVEL=10
export LOG_STDOUT=True
export CLICOLOR=1
# Having the following as true messes up nix-shell
# export PIP_REQUIRE_VIRTUALENV=true

# Pyenv
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
export NLTK_DATA=$PYENV_ROOT/versions/2.7.11/share/nltk_data

export AWS_SECRET_ACCESS_KEY=
export AWS_ACCESS_KEY_ID=
export NPM_AUTH_TOKEN=

# Nix variables
# export NIX_PATH=$HOME/.nix-profile/nix-expressions
export NIX_PATH="nsnix=$HOME/repos/ns_systems/ns_nix/"
export PATH=$HOME/.nix-profile/bin:$PATH
export NIX_DIRECTORY=/opt/ns
export NS_GITHUB_TOKEN=
export PIPELINE_ID=1
export NSNIX=~/repos/ns_systems/ns_nix

# Colors
export PS1="\[\033[35m\]\t\[\033[m\]-\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "

export PATH

eval "$(pyenv init -)"
