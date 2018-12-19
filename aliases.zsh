# Helper function to print debug information if $DEBUG is not empty.
# Doesn't fit perfectly in this file, but this is the best place to make it
# available everywhere.
source_debug() {
    if [ x$DEBUG != x ]; then
        echo $@
    fi
}
# Source $1 if it exists. And $1.local if it exists as well.
source_config() {
    source_debug "source_config(): $1"
    if [ -f $1 ]; then
        source_debug ". $1"
        . $1
    fi
    if [ -f $1.local ]; then
        source_debug ". $1.local"
        . $1.local
    fi
}
gp(){
   grep -Ri $1 .;
}
apt_get(){
    echo `date +%Y-%m-%d;`>> ~/apt-get.log;    echo  $1;  >> ~/apt-get.log
    sudo apt-get install $2;
    }
function bsck(){
    dirName=$(echo $1 | sed 's/\/$//')
    cp -a  $dirName ${dirName}-back-`datesuffix`;
}
function vimunstaged() {
    vim $(git status --short | cut -d' ' -f2)
}
# Main ls function, separated to prevent code duplication.
unalias ls
ls_path=`which ls`
my_ls() {
    "$ls_path" -C -F $* 2>&1 | less -R
}
# Helper function to list all files.
function la() {
    ls -a $*
}
# Helper function to list the files in list format with access rights, etc.
function ll() {
    ls -l $*
}
# Helper function to list all files in list format with access rights, etc.
function lal() {
    la -l $*
}
#Some more functions:
gr(){
 /bin/grep --color=auto -r --exclude=tags --exclude=\*.{json,log,pyc,swp} --exclude-dir=bower_components --exclude-dir=".git" "${@:2}" "$1" .
}
#alias gr="ag"
grr(){
 grep -ri "$1" "$2"
}
# alias e=elinks
alias l=ls
alias s=ls
alias p=less # p for pager
alias datesuffix="TZ=America/New_York date +%Y%m%d-%H%M"
alias mm="cmatrix -b"
alias de="deactivate"
# Improved ls which displays the files in columns (-C), visualizes
# directories, links and other special files (-F) and pages everything through
# less.
# If available use GNU ls with colorized output. If it isn't available try
# normal ls which needs CLICOLOR_FORCE so it displays colors when used with a
# pager. If none work no colors are used.
# Check if colors are available.
ls --color > /dev/null 2>&1
if [ $? -eq 0 ]; then
    ls_color=gnu
else
    ls -G > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        ls_color=cli
    else
        ls_color=
    fi
fi
# Make sure there is no alias named ls as it causes problems with the
# following ls function on (at least) bash 4.0.35.
unalias ls 2> /dev/null
unset ls_color
alias :q='echo "This is not Vim!" >&2'
# Automatically use unified diffs.
alias diff='diff -u'
alias du='du -sh'
alias df='df -h'
# Edit the mercurial patch queue series file for the current mercurial
# repository in Vim. Also change Vim's pwd to the patches directory so other
# patches can easily be opened.
# alias vqs='vim -c "cd `hg root`/.hg/patches/" "`hg root`/.hg/patches/series"'
alias nvi='vim -u NONE '
alias vi='vim -u $HOME/homedir/.vimrcblah '
# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias sagi='sudo apt-get install'
#alias fa='{ sensors | tail -5| head -4 | cut -d\( -f1 | tail -4|cut -d+ -f2 | tr -d "\n"; echo; ; sensors | head -6 | tail -1 | cut -d\( -f1 | cut -d+ -f2 | tr -d "\n"; echo; }'
alias fa='{ sensors | tail -3| head -2 | cut -d\( -f1 | tail -4|cut -d+ -f2 | tr -d "\n"; echo;}'
alias ngo='sudo nethogs -a'
alias gg='source ~/.zshrc'
alias na='nautilus --no-desktop'
alias sl='ls'
alias lynx='lynx -vikeys'
# alias E='vim -S'
# alias g='grep -i'
alias info='info --vi-keys'
alias cgr='find . -name "*.h" -or -name "*.c"  -or -name "*.cpp" -or -name "*.cc" | xargs grep \!* /dev/null'
alias gvim='gvim -p'
alias emacs='emacs -nw'
# alias xterm='xterm -uc'
# alias shutup='sudo umount /dev/sdb{1,2,3,4,6,7} && sudo shutdown -h now || echo shutdown failed'
alias shutup='sudo shutdown -h now'
# alias hgr='find . -name "*.h" | xargs grep \!* /dev/null'
alias zx="exit"
alias :e="vim"
#gcccommands
alias g++="g++ -Weffc++ -Wold-style-cast -Wall"
alias gcc="gcc  -ansi -pedantic -Wall -W -Wconversion -Wshadow -Wcast-qual -Wwrite-strings"
alias cflow="cflow --tree"
alias gitc="git rev-parse --abbrev-ref HEAD"
alias tig="gitc"
alias pyt="python"
export BACKUP="$HOME/backups"
####myfns
tar_bz2_dir()
{
    if [ "$1" != "" ]; then
        FOLDER_IN=`echo $1 |sed -e 's/\/$//'`;
        FILE_OUT="/media/shooty/balhi/$FOLDER_IN.tar.bz2";
        FOLDER_IN="$FOLDER_IN/";
        echo "Compressing $FOLDER_IN into $FILE_OUT…";
        echo "tar cjf $FILE_OUT $FOLDER_IN";
        tar cjf "$FILE_OUT" "$FOLDER_IN";
        echo "Done.";
    fi
}
mytar()
{
    for f in $(ls)
do
 echo -e "\n \n $(tput bold)Processing $f $(tput sgr0)\n***********************************";
 tar_bz2_dir "$f";
 echo -e "$(tput bold)Done with $f $(tput sgr0)\n**********************************";
done
}
dict()
{
    /usr/bin/dict $1 | less
}
mso(){
    du -skh * | sort -h | less;
}
ac2()
{
    cd "$HOME/mywork/1/1p/tm"
}
pushy()
{
    cd "$WORKING" && git push "$REMOTE"
}
xp()
{
    cat $1 | python -m json.tool | less
}
rmz()
{
    find . -size 0 -print0 | xargs -0 rm;
    # find . -name 'file*' -size 0 -print0 | xargs -0 rm
}
bbg()
{
    git add -A &&git commit -am" blah commit";
}
tailx(){
 /usr/bin/tail -f -n60 "$1";
}
act()
{
    source "$HOME/greatamericanart.com/bin/activate";
    source "$HOME/env.sh";
    # cd "$HOME/greatamericanart.com/project/";
}
# alias cd="echo cd not found"
gitsy(){
	ODIR=$(pwd);
	DIR="$HOME/dev/$1";
	DIR="$1"
	if [[ -n "$1" && -d $DIR ]];
	then
		DIR="$1";
	else;
		DIR="$HOME/dev/nw";
	fi;
	echo "Updating $DIR"
	cd $DIR;
	for i in *; do [[ -d $i ]] && {
		cd $i;
		if [[ -d .git ]]; then echo "Processing $i"; git pull; fi;
		if [[ -d .svn ]]; then echo "Processing $i"; svn up; fi;
		cd ..;
	} done
	cd $ODIR;
	}
alias vi='vim'
alias tree='tree |less'
dive(){
	DIR="$HOME/cscope"
	DEV="$HOME/dev"
	NDIR="$DIR/$1"
	if [[ -n "$1" && -d $NDIR ]];
	then
		DIR="$NDIR";
		DEV="$DEV/$1"
	else;
		DIR="$DIR/linux/l2"
		DEV="$DEV/linux/l2"
	fi;
	cd $DIR;
	cscope -b -q;
	cd $DEV;
	CSCOPE_DB=$DIR/cscope.out; export CSCOPE_DB
}
b(){
	#echo "INFO FROM PROC1 ****";
	#cat /proc/acpi/battery/BAT0/info;
	#echo "INFO FROM PROC2 ****";
	# following file does not exist now
	#cat /proc/acpi/battery/BAT0/state;
	echo "INFO FROM ACPI -V ****";
	acpi -V | head -3; 
}
alias sound='pulseaudio -k && sudo alsa force-reload'
alias cal='ncal -3'

# vim: ft=sh
