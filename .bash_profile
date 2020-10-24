if [ -f ~/.bashrc ]; then
 source ~/.bashrc
fi

#export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\] \[\033[33;1m\]\w\[\033[m\] (\$(git branch 2>/dev/null | grep '^*' | colrm 1 2)) \$ "

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

alias ls='pwd; ls -lah'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

source ~/.bashrc

alias c='cd ~/Documents/code'
alias rc='bundle exec rails console' #start rails console
alias reload='echo source ~/.bash_profile; source ~/.bash_profile'
alias gitlist='git log --pretty=format:"%h - %an, %ar : %s"' # Get list of commits in a readable way
