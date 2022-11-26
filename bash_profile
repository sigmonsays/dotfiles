
# export P="Make em say Uhhh"

export PS1="${debian_chroot:+($debian_chroot)}\u@\h:\w\$ "
export PS2=">"

# do not unalias everything. just unalias what you dont want
#unalias -a

unset LS_COLORS

# auto attach screen
#if [ "$STY" == "" -a "$SSH_TTY" != "" ] ; then
#    screen -xR sig
#fi

source "$HOME/.bash_core"

unalias ls >/dev/null 2>&1
$HOME/bin/ssh-agent-setup >/dev/null 2>&1
for S in $(_bashrc_d_scripts)
do
    source $S
done
source $HOME/.ssh/agent >/dev/null 2>&1


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/siglange/google-cloud-sdk/path.bash.inc' ]; then . '/Users/siglange/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/siglange/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/siglange/google-cloud-sdk/completion.bash.inc'; fi


#source /home/sig/.config/broot/launcher/bash/br
