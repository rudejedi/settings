# Add these at the end of .bashrc file
# source: https://drasite.com/blog/Pimp%20my%20terminal

# Install nerd fonts: https://www.nerdfonts.com/
# Nerd fonts cheatsheet for symbols: https://www.nerdfonts.com/cheat-sheet
# Color scheme for terminal: bash -c "$(curl -sLo- https://git.io/vQgMr)"
# Install the following packages:
# 1. LSD: https://github.com/Peltoche/lsd
# 2. BAT: https://github.com/sharkdp/bat


#--------------------Start Fancy Terminal---------------------
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias diff='diff --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# add to path example
# export PATH="/home/<username>/<file location folder>:$PATH"

# Configure color-scheme
COLOR_SCHEME=dark # dark/light

# Alias top = htop
command -v htop > /dev/null && alias top='htop'


# colorize man pages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
export LESSHISTFILE=

# colorize ls & tree
command -v lsd > /dev/null && alias ls='lsd --group-dirs first' && \
    alias tree='lsd --tree'
command -v colorls > /dev/null && alias ls='colorls --sd --gs' && \
    alias tree='colorls --tree'
    
# colorize ls files
[ -x /usr/bin/dircolors ] && eval "$(dircolors -b)"

# cat & less
command -v bat > /dev/null && \
    alias bat='bat --theme=ansi-$([ "$COLOR_SCHEME" = "light" ] && echo "light" || echo "dark")' && \
    alias cat='bat --pager=never' && \
    alias less='bat'
    
#--------------------------------------------------------------
## Custom prompt
OS_ICON=   # Replace this with your OS icon
# Git branch in prompt.
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
PS1="\n \[\033[0;34m\]╭─\[\033[0;31m\]\[\033[0;37m\]\[\033[41m\] $OS_ICON \u \[\033[0m\]\[\033[0;31m\]\[\033[44m\]\[\033[0;34m\]\[\033[44m\]\[\033[0;30m\]\[\033[44m\] \w \[\033[0m\]\[\033[0;34m\] \$(parse_git_branch)\[\033[00m\] \n \[\033[0;34m\]╰ \[\033[1;36m\]\$ \[\033[0m\]"

#------------------------------End Fancy Terminal----------------------

