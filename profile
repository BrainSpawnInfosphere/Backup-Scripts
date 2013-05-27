# System-wide .profile for sh(1)

if [ -x /usr/libexec/path_helper ]; then
	eval `/usr/libexec/path_helper -s`
fi

export PATH=/bin:/sbin:/usr/sbin:/usr/bin

if [ "${BASH-no}" != "no" ]; then
	[ -r /etc/bashrc ] && . /etc/bashrc
fi

# command prompt
######################################
# set color names
# normal
CLR="\[\033[0;0m\]"   # normal color scheme
BK="\[\O33[0;30m\]"   # black
BL="\[\033[0;34m\]"   # blue
GR="\[\033[0;32m\]"   # green
CY="\[\033[0;36m\]"   # cyan
RD="\[\033[0;31m\]"   # red
PL="\[\033[0;35m\]"   # purple
BR="\[\033[0;33m\]"   # brown
GY="\[\033[1;30m\]"   # grey
# enhanced
#eGY="\[\033[0;37m\]"  # light gray
#eBL="\[\033[1;34m\]"  # light blue
#eGR="\[\033[1;32m\]"  # light green
#eCY="\[\033[1;36m\]"  # light cyan
#eRD="\[\033[1;31m\]"  # light red
#ePL="\[\033[1;35m\]"  # light purple
#eYW="\[\033[1;33m\]"  # yellow
#eWT="\[\033[1;37m\]"  # white
#######################################

# make sure admin has a .bashrc file that has: . /etc/profile
if [ `whoami` == "admin" ]; then
        export PS1="[$RD\u@\h$BL \W$CLR]\\$ "
else
        export PS1="[$GR\u@\h$BL \W$CLR]\\$ "
fi

# aliases
alias ls='ls -Gah '
alias ll='ls -Gahl '
alias du='du -h '
alias du1='du -h -d=1 '
alias lsg='ls -al | grep --ignore-case '
alias lsd='ls -d */ '
alias cd..='cd .. '
alias mv='mv -i '
alias rm='rm -i '
alias cp='cp -i '



# CVS
export EDITOR=pico

# new ROS
export PATH=/usr/local/sbin:/usr/local/bin:$PATH
export CPLUS_INCLUDE_PATH="/usr/local/include:$CPLUS_INCLUDE_PATH"
export PYTHONPATH="/usr/local/lib/python2.7/site-packages:$PYTHONPATH"

