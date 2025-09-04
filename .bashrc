# ADDED BY NOE

noTooLongPath(){
  PREFIX='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[01;33m\][\[\033[01;34m\]\D{%Hh%M}\[\033[01;33m\]]\[\033[00m\]$\[\033[01;34m\]'
  PREFLEN=32 # length of prefix after processing (don't know how to get it dynamically)
  EDITED_PATH='\w'
  POSTFIX='\[\033[00m\]: '
  DIR=`pwd`
  COL=$(stty -a | grep -Po '(?<=columns )\d+')
  (( LIM = $COL/2 - $PREFLEN )) # max remaining space for path
  if [ ${#DIR} -gt $LIM ]; then
	((STRIP=-$LIM-5)) # 5 is the length of [...]
    EDITED_PATH='[...]${DIR:(STRIP)}'
  fi
  export PS1="$PREFIX$EDITED_PATH$POSTFIX"
}
PROMPT_COMMAND="noTooLongPath"

desc(){
	tree -a -L 3 -l --filelimit 15 -C $1 | tee /dev/tty | grep -q "0 dir" && ls -lah
}

md5it(){
	md5sum $1 > $1.md5
}

pdf(){
	xpdf $1 2>/dev/null &
}

refocus(){
	for i in `xdotool search --name $1`; do
		xdotool windowmove $i 2 50;
	done;
}

export TERM=linux

alias ll='ls -lah'
alias pong='ping google.com -c 3'
alias bashconf='vim ~/.bashrc && source ~/.bashrc'
alias py3='python3.8'
alias sagent='eval `ssh-agent`'
alias howTar='tar --help | grep tar | head -n 5'
alias c2c='clear; clear'
alias agc='ag -G ".*\.c$" '
alias geany='LANGUAGE=en geany &'
alias gti='git'
alias got='git'
alias gut='git'
