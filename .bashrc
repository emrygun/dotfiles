case $- in
    *i*) ;;
      *) return;;
esac

shopt -s histappend
shopt -s checkwinsize

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
fi

HISTCONTROL=ignoreboth
HISTSIZE=2000
HISTFILESIZE=2000
FZF_DEFAULT_COMMAND="find . -type f -exec readlink -f {} +;"

#Utilities
alias v="nvim"
alias r="ranger"
alias s="sudo"
alias ll="ls -l"
alias editbashrc="v ~/.bashrc"
alias celar="clear"
alias ..="cd .."

gd() {
  pathname=$(find ~ | fzf)

  if [ -d "$pathname" ]; then
    cd "$pathname"
  else
    cd $(dirname $(readlink -f $pathname))
  fi
}

#Network
alias nwifi="nmcli dev wifi"

#Git
alias gs="git status"
alias greset="git checkout master && git fetch origin && git reset --hard origin/master && git clean -f -d"
alias gcm="git checkout origin/master"
alias gcam="git commit -am"
alias gcem="git commit --allow-empty -m \"empty commit\""
alias gph="git push -u origin HEAD"
alias slist="git stash list"
alias ssave="git stash save"
alias sapply="git stash apply"

gget() {
    git checkout $1 && \
    git reset --hard origin/$1
}
