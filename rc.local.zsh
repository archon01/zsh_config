bindkey -v
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
# Allow editing of the text on the current command line with v (cmd mode)
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line
# Map jj to vim-cmd-mode
bindkey -M viins 'jj' vi-cmd-mode
# Map jk to vim-cmd-mode
bindkey -M viins 'jk' vi-cmd-mode
# Set directions and delete keys
bindkey '^[^[[D' vi-backward-word
bindkey '^[^[[C' vi-forward-word
bindkey '^[[5D' beginning-of-line
bindkey '^[[5C' end-of-line
# make the delete key (or Fn + Delete on the Mac) work instead of outputting a ~
bindkey '^?' backward-delete-char 
bindkey '^[[3~' delete-char
bindkey '^[3;5~' delete-char
bindkey '\e[3~' delete-char
bindkey '^[^N' newtab
# locals
# backspace and ^h working even after
# returning from command mode
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
# Disable hostname completion
zstyle ':completion:*' hosts off
#setopt checkwinsize
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
export ZCODE_PATH="$HOME/.zcode"
export GPGKEY=43C87447 
LIBRARY_PATH=/usr/lib/x86_64-linux-gnu
export LIBRARY_PATH
C_INCLUDE_PATH=$HOME/inclusive/c
CPLUS_INCLUDE_PATH=$HOME/inclusive
export CPLUS_INCLUDE_PATH
export C_INCLUDE_PATH
export PYTHONSTARTUP=$HOME/.pythonrc
MAIL=/opt/mail/drake && export MAIL
export MAKEFLAGS='-j 4'
export LESS="-RSM~gIsw"
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
export LESSOPEN='|$HOME/.lessfilter %s'
export LESSCOLORIZER=pygmentize
#setopt cdspell
export NVM_DIR="/home/dra90/.nvm"
if [ -f ~/.s ]; then
    act;
fi
rationalise-dot() {
    if [[ $LBUFFER = *.. ]]; then
      LBUFFER+=/..
    else
      LBUFFER+=.
    fi
}
zle -N rationalise-dot
bindkey . rationalise-dot
vim_ins_mode="%{$fg[cyan]%}[INS]%{$reset_color%}"
vim_cmd_mode="%{$fg[green]%}[CMD]%{$reset_color%}"
vim_mode=$vim_ins_mode
function zle-keymap-select {
  vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
  zle reset-prompt
}
zle -N zle-keymap-select
function zle-line-finish {
  vim_mode=$vim_ins_mode
}
zle -N zle-line-finish
# Fix a bug when you C-c in CMD mode and you'd be prompted with CMD mode indicator, while in fact you would be in INS mode
# Fixed by catching SIGINT (C-c), set vim_mode to INS and then repropagate the SIGINT, so if anything else depends on it, we will not break it
# Thanks Ron! (see comments)
function TRAPINT() {
  vim_mode=$vim_ins_mode
  return $(( 128 + $1 ))
}
# Remap Ctrl-S to Ctrl-- for stopping termianl output
stty start  stop 
if [[ -a ~/.s ]]; then
    act;
fi
#command_not_found_handler() {/usr/lib/command-not-found "$1"}
if [[ -a $HOME/.django-dev ]]; 
then
    cd /media/blky/src/django-dev/django
    source /media/blky/src/django-dev/bin/activate
fi
export _JAVA_AWT_WM_NONREPARENTING=1
# if ! [[ "$(pgrep btc)"  ]]; then  nohup btc &; fi
function vimunstaged() {
    vim -p $(git status --short | cut -d' ' -f2 ) }
alias zx=exit
alias smg='notify-send "some build was in progress? It completed @`date +%H:%M:%S`. Please check (pwd: `pwd`)"'
export d="~/gfyapp.com/gfyapp/gfy"
pwd
if [[ "$TERM" == "linux" ]]; then
    exec fbterm -- bash -c 'TERM=fbterm tmux'
fi
export WORK="$HOME/greatamericanart.com/projectbit";
if [ -f ~/.workg ]; then
    export WORK="$HOME/greatamericanart.com/project/source";
    source "$HOME/greatamericanart.com/bin/activate";
    # cd $WORK;
    clear;
    pwd
elif [ -f ~/.workb ]; then
    export WORK="$HOME/greatamericanart.com/projectbit";
    source "$HOME/greatamericanart.com/bin/activate";
    # cd $WORK;
    clear;
    pwd
fi
# removed caddy
# $HOME/bin/mounty;
function ec2-ssh () {
  ssh $(aws ec2 describe-instances --filter Name=instance-id,Values=$1 | jq '.Reservations[0].Instances[0].PrivateIpAddress' | tr -d '"')
}
# export gg=10.200.200.1
function wb () {
    rm -f ~/.work{g,b};
    touch ~/.work$1;
}
function syncer () {
    WORK="$HOME/greatamericanart.com/projectbit";
    cd $WORK;
    git pull sync 5.0; git push;
}
export PATH=$PATH:"$HOME/dev/linux/perf-tools/bin"
export APP_SETTINGS="config.DevelopmentConfig"
#export DATABASE_URL="postgresql://localhost/wordcount_dev"
export DATABASE_URL="postgresql://localhost/tiny_url"


