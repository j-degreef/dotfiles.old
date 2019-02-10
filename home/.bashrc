#
# ~/.bashrc
#

#{{{ Misc
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

shopt -s autocd #Allows you to cd into directory merely by typing the directory name.

# jdegr control-s is used by bash forward history search
# but is mapping by default to scroll lock
# ^s scroll lock, ^q disable scroll lock, -ixon disable both
if [ "$TERM" != "dumb" ];
then
  stty -ixon
fi

#}}}

# Prompt {{{
# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm|xterm-termite|xterm-color|*-256color) color_prompt=yes;;
esac

if [ "$color_prompt" = yes ]; then
    if [[ ${EUID} == 0 ]] ; then
        PS1='\[\033[01;31;1m\]\u@\h\[\033[00m\] \[\033[01;34m\][\w] \$\[\033[00m\] '
    else
        PS1='\[\033[01;36;1m\]\u@\h\[\033[00m\] \[\033[01;34m\][\w] \$\[\033[00m\] '
    fi
else
    PS1='[\u@\h \w]\$ '
fi
unset color_prompt
# }}}

# History {{{
# jdegr add history for multiple terminal
# Consistent and forever bash history
HISTSIZE=100000
HISTFILESIZE=$HISTSIZE
HISTCONTROL=ignorespace:ignoredups

_bash_history_sync() {
  builtin history -a         #1
  HISTFILESIZE=$HISTSIZE     #2
}

_bash_history_sync_and_reload() {
  builtin history -a         #1
  HISTFILESIZE=$HISTSIZE     #2
  builtin history -c         #3
  builtin history -r         #4
}

history() {                  #5
  _bash_history_sync_and_reload
  builtin history "$@"
}

export HISTTIMEFORMAT="%y/%m/%d %H:%M:%S   "
PROMPT_COMMAND='history 1 >> ${HOME}/.bash_eternal_history'
PROMPT_COMMAND=_bash_history_sync;$PROMPT_COMMAND
# }}}

#{{{ Liquidprompt
if [[ ! ${EUID} == 0 ]] ; then source ~/bin/liquidprompt ; fi
#}}}

#{{{ fzf (disabled)
#[ -f ~/.fzf.bash ] && source ~/.fzf.bash
#}}}

#{{{ fasd (disabled)
#eval "$(fasd --init auto)"
#alias a='fasd -a'        # any
#alias s='fasd -si'       # show / search / select
#alias d='fasd -d'        # directory
#alias f='fasd -f'        # file
#alias sd='fasd -sid'     # interactive directory selection
#alias sf='fasd -sif'     # interactive file selection
#alias z='fasd_cd -d'     # cd, same functionality as j in autojump
#alias zz='fasd_cd -d -i' # cd with interactive selection
#}}}

#{{{ Exports
#export TERMINAL="urxvt"
export TERMINAL="termite"
#export TERM="termite"
export VISUAL="vim"
export ANDROID_HOME="/opt/android-sdk"
export EDITOR=nvim
export DEFAULT_EDITOR=nvim
# Mysql java driver
export CLASSPATH=/opt/java/mysql-connector-java-5.1.46:$CLASSPATH
# source /etc/profile.d/jdk.sh
#}}}

#{{{ dircolors
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    #alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi
#}}}

#{{{ Aliases
# System Maintainence
alias mw="~/.config/mutt/mutt-wizard.sh"
alias muttwizard="~/.config/mutt/mutt-wizard.sh"
alias progs="(pacman -Qet && pacman -Qm) | sort -u" # List programs I've installed
alias orphans="pacman -Qdt" # List orphan programs
alias sdn="sudo shutdown now"
alias psref="gpg-connect-agent RELOADAGENT /bye" # Refresh gpg

# Some aliases
alias ls='ls --color=auto'
alias p="sudo pacman"
alias SS="sudo systemctl"
alias vim="nvim"
alias v="/usr/bin/vim"
alias nv="nvim"
alias sv="sudo /usr/bin/vim"
alias snv="sudo nvim"
#alias mutt="neomutt"
alias m="mutt"
alias nm="neomutt"
alias r="ranger"
alias sr="sudo ranger"
alias ka="killall"
alias g="git"
alias trem="transmission-remote"
alias mkd="mkdir -pv"
alias ref="shortcuts.sh && source ~/.bashrc" # Refresh shortcuts manually and reload bashrc
alias bw="wal -i ~/.config/wall.png" # Rerun pywal
alias pi="bash ~/.larbs/wizard/wizard.sh"
alias feh="feh --image-bg black -."

# Adding color
alias ls='ls -hN --color=auto --group-directories-first'
alias grep="grep --color=auto" # Color grep - highlight desired sequence.
alias ccat="highlight --out-format=ansi" # Color cat - print file with syntax highlighting.

# Internet
alias yt="youtube-dl --add-metadata -ic" # Download video link
alias yta="youtube-dl --add-metadata -xic" # Download only audio
alias YT="youtube-viewer"
alias ethspeed="speedometer -r enp0s25"
alias wifispeed="speedometer -r wlp3s0"
alias starwars="telnet towel.blinkenlights.nl"

source ~/.shortcuts
#}}}

# vim: ts=2 sw=0 et fdm=marker

alias config='/usr/bin/git --git-dir=/home/jdegreef/.cfg.git/ --work-tree=/home/jdegreef'
