#source_debug ". ~/.shell/env"
# Use UTF-8 encoding in the terminal. Don't use LC_ALL as it's used for
# debugging purposes. Thanks to twb in Freenode/#screen (2009-10-02 10:25).
LANG=en_US.UTF-8
export LANG
# Add ~/bin and ~/.bin and ~/.shell/bin to PATH if available.
if [ -d ~/.shell/bin ]; then
    PATH=$PATH:~/.shell/bin
fi
if [ -d ~/bin ]; then
    PATH=$PATH:~/bin/
fi
if [ -d ~/.bin ]; then
    PATH=$PATH:~/.bin
fi
# Use Vim as editor.
EDITOR=vim
export EDITOR
# Set less as pager, its configuration is done through the .less file.
PAGER=less
export PAGER
# Use ~/.tmp as directory for temporary files if available to reduce security
# problems on multi-user systems.
if [ -O ~/.tmp -a -d ~/.tmp ]; then
    TMP=~/.tmp
    TEMP=$TMP
    TMPDIR=$TMP
    export TMP TEMP TMPDIR
# Also try ~/tmp as fallback.
elif [ -O ~/tmp -a -d ~/tmp ]; then
    TMP=~/tmp
    TEMP=$TMP
    TMPDIR=$TMP
    export TMP TEMP TMPDIR
fi
# Change rlwrap's home directory to prevent cluttering ~.
RLWRAP_HOME=~/.shell/rlwrap
export RLWRAP_HOME
# Set colors for GNU ls (and zsh completions).
# See `dircolors --print-database` for possible colors.
LS_COLORS='no=00'
LS_COLORS=$LS_COLORS':fi=00'       # normal files: normal
LS_COLORS=$LS_COLORS':di=34;01'    # directories: blue bold
LS_COLORS=$LS_COLORS':ln=36'       # symbolic links: cyan
LS_COLORS=$LS_COLORS':pi=00'       # named pipes: normal
LS_COLORS=$LS_COLORS':so=00'       # sockets: normal
LS_COLORS=$LS_COLORS':bd=00'       # block devices: normal
LS_COLORS=$LS_COLORS':cd=00'       # character devices: normal
LS_COLORS=$LS_COLORS':or=36;41'    # orphaned links: red background
LS_COLORS=$LS_COLORS':su=31;01;43' # setuid files: yellow background
LS_COLORS=$LS_COLORS':sg=31;01;43' # setgid files: yellow background
LS_COLORS=$LS_COLORS':ow=34;01;41' # directories writable by others: blue background
LS_COLORS=$LS_COLORS':ex=31;01'    # executables: bold red
export LS_COLORS
# Set the same colors for non GNU ls, except for orphaned links which aren't
# supported.
LSCOLORS='ExgxxxxxBxxxxxBdBdExEb'
#         ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^
#         | | | | | | | | | | |
#         | | | | | | | | | | *- directory writable to others, without sticky bit
#         | | | | | | | | | *--- directory writable to others, with sticky bit
#         | | | | | | | | *----- executable with setgid bit set
#         | | | | | | | *------- executable with setuid bit set
#         | | | | | | *--------- character special
#         | | | | | *----------- block special
#         | | | | *------------- executable
#         | | | *--------------- pipe
#         | | *----------------- socket
#         | *------------------- symbolic link
#         *--------------------- directory
export LSCOLORS
export GPGKEY=43C87447 
export GOROOT=$HOME/s/go/go
export GOARCH=amd64
export GOOS=linux
export GOPATH=$HOME/s/go/go1.4/
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib;
export ENABLE_LIVERELOAD=1
# vim: ft=sh

