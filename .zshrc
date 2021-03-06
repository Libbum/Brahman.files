# ______           _                              __ _ _
# | ___ \         | |                            / _(_) |
# | |_/ /_ __ __ _| |__  _ __ ___   __ _ _ __   | |_ _| | ___  ___
# | ___ \ '__/ _` | '_ \| '_ ` _ \ / _` | '_ \  |  _| | |/ _ \/ __|
# | |_/ / | | (_| | | | | | | | | | (_| | | | |_| | | | |  __/\__ \
# \____/|_|  \__,_|_| |_|_| |_| |_|\__,_|_| |_(_)_| |_|_|\___||___/
#

export ZSH=/home/tim/.oh-my-zsh

ZSH_THEME="brahman"

BASE16_SHELL="$HOME/.config/base16-default.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

#typeset -U path

# Set GPG TTY
export GPG_TTY=$(tty)

# Refresh gpg-agent tty in case user switches into an X session
gpg-connect-agent updatestartuptty /bye >/dev/null

#envoy -t ssh-agent
#source <(envoy -p)
#echo $SSH_AUTH_SOCK > ~/.config/ssh_sock
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export SSH_ASKPASS="/usr/bin/ksshaskpass"

export PYTHON=/usr/bin/python2
export JUPYTER=/usr/bin/jupyter
export GOPATH=/home/tim/repos/go
#export CC=/opt/intel/composerxe/linux/bin/intel64/icc
#export CXX=/opt/intel/composerxe/linux/bin/intel64/icpc
#source /opt/intel/composerxe/linux/mkl/bin/mklvars.sh intel64

export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket

#Noti pushbullet setup
source ~/.config/noti

#fzf setup to use rg as default
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules,elm-stuff}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="cd ~/; bfs -type d -nohidden | sed s/^\./~/"
#\C-p is bound to nvim $(fzf) in .inputrc, but may not be functioning correctly

#This minimises system calls https://blog.packagecloud.io/eng/2017/02/21/set-environment-variable-save-thousands-of-system-calls/
export TZ=:/etc/localtime

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
export XIM_PROGRAM=/usr/bin/ibus-daemon

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

plugins=(git common-aliases sudo)


export PATH="$HOME/.cargo/bin:$HOME/.npm-global/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/opt/cuda/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
# export MANPATH="/usr/local/man:$MANPATH"

path+=(/usr/local/texlive/2018/bin/x86_64-linux)
path+=(/home/tim/.gem/ruby/2.3.0/bin)
export PATH

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
   export EDITOR='nvim'
fi


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
