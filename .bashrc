# ADDED BY NONOREVE
noTooLongPath(){
  PREFIX='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[01;33m\][\[\033[01;34m\]\D{%Hh%M}\[\033[01;33m\]]\[\033[00m\]$\[\033[01;34m\]'
  EDITED_PATH='\w'
  POSTFIX='\[\033[00m\]: '
  DIR=`pwd`
  if [ ${#DIR} -gt 42 ]; then
    EDITED_PATH='${DIR:0:19}...${DIR:(-19)}'
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

alias enableVulkan='source ~/Stuff/VulkanSDK/setup-env.sh'
alias pdf='evince 2>/dev/null'
alias pong='ping google.com -c 3'
alias bashconf='nano ~/.bashrc && source ~/.bashrc' # not working
alias py3='python3.7'
alias sagent='eval `ssh-agent`'
alias sadk='ssh-add'
alias cleanCrash='ls -la /var/crash; sudo rm -v /var/crash/*'
alias howTar='tar --help | grep tar | head -n 5'
alias desc='tree -a -L 3 -l --filelimit 20 -C'
