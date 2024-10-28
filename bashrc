######################
## Basic bashrc setup
######################

## Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
        for rc in ~/.bashrc.d/*; do
                if [ -f "$rc" ]; then
                        . "$rc"
                fi
        done
fi

unset rc

## Small customization

# Aliases and nice prompt
alias ll='ls --color=always -lh'
PS1='\[\033[01;32m\]${WCD_VER}\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# Setup spack and Muon Collider software
#source /opt/setup_spack.sh
source /opt/setup_mucoll.sh
