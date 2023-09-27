# .bashrc
#HANDY ALIASES AND SETUP FOR PHANTOM ON LOCAL MACHINE
#NOTE THAT THIS IS FOR A BASH SHELL SPECIFICALLY

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

#aliases
alias c='clear'
alias la='ls -a'
alias ll='ls -l'
alias star='ssh -x -P PORT user@stargate.uclan.ac.uk' #for accessing starlink
alias makephan='~/pathtophantom/phantom/scripts/writemake.sh' #for creating a makefile
alias tophantom='cd ~/pathtophantom/' #way of getting to the phantom directory

# >>> PHANTOM SETUP <<<
# !! required to use phantom as per the docs
export OMP_SCHEDULE="dynamic"
export OMP_STACKSIZE=512M
ulimit -s unlimited
export SYSTEM=ifort

export SPLASH_DIR=$HOME/packages/splash
export PATH=$PATH:$SPLASH_DIR/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$SPLASH_DIR/giza/lib

# initialises locally installed inten oneapi 
# !! need to run before using ifort compiler
alias initoneapi='. /opt/intel/oneapi/setvars.sh #Initialise intel oneAPI environment'


#source /opt/intel/bin/compilervars.sh intel64 #DOES NOT WORK


# !! NEEDED FOR ANACONDA !! INITIALISES ON TERMINAL LAUNCH !!
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/etc/profile.d/conda.sh" ]; then
        . "/usr/etc/profile.d/conda.sh"
    else
        export PATH="/usr/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

#Defined path for cargo
PATH=$PATH:/home/user/.cargo/bin
