# ADDED BY NONOREVE
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

# reboot wifi driver for this annoying wifi card
resetWifi(){
  sudo modprobe -rv rtl8723be
  sleep 2
  sudo modprobe -v rtl8723be ant_sel=1 # as physically labelled on the board
}

probeWifi(){
  DEVICE=$(iw dev | grep Interface | cut -d " " -f2)
  sudo iw dev $DEVICE scan | egrep "SSID|signal|\(on"
}

desc(){
	tree -a -L 3 -l --filelimit 15 -C $1 | tee /dev/tty | grep -q "0 dir" && ls -lah
}

export TERM=linux

alias pdf='evince 2>/dev/null'
alias pong='ping google.com -c 3'
alias bashconf='nano ~/.bashrc && source ~/.bashrc'
alias py3='python3.10'
alias sagent='eval `ssh-agent`'
alias sadk='ssh-add'
alias howTar='tar --help | grep tar | head -n 5'
#alias desc='tree -a -L 3 -l --filelimit 20 -C'
