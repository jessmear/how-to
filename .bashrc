COLOR_RED="\033[0;31m"
COLOR_GREEN="\033[0;32m"
COLOR_YELLOW="\033[0;33m"
COLOR_BLUE="\033[0;34m"
COLOR_PURPLE="\033[0;35m"
COLOR_CYAN="\033[0;36m"
COLOR_GRAY="\033[0;37m"
COLOR_WHITE="\033[0;37m"

COLOR_RED2="\033[1;31m"
COLOR_GREEN2="\033[1;32m"
COLOR_YELLOW2="\033[1;33m"
COLOR_BLUE2="\033[1;34m"
COLOR_PURPLE2="\033[1;35m"
COLOR_CYAN2="\033[1;36m"
COLOR_GRAY2="\033[1;37m"
COLOR_WHITE2="\033[1;37m"

COLOR_RESET="\033[0m"

function git_color {
  local git_status="$(git status 2> /dev/null)"

  if [[ ! $git_status =~ "working tree clean" ]]; then
    echo -e $COLOR_RED
  elif [[ $git_status =~ "Your branch is ahead of" ]]; then
    echo -e $COLOR_YELLOW
  elif [[ $git_status =~ "nothing to commit" ]]; then
    echo -e $COLOR_GREEN
  else
    echo -e $COLOR_PURPLE
  fi
}

function git_branch {
  local git_status="$(git status 2> /dev/null)"
  local on_branch="On branch ([^${IFS}]*)"
  local on_commit="HEAD detached at ([^${IFS}]*)"

  if [[ $git_status =~ $on_branch ]]; then
    local branch=${BASH_REMATCH[1]}
    echo "$branch"
  elif [[ $git_status =~ $on_commit ]]; then
    local commit=${BASH_REMATCH[1]}
    echo "$commit"
  fi
}

#NB: The formatting of git status messages has changed, so if you're on the latest version of git, you'll likely need to use"^On branch instead of "^# On branch above. Check your git status to be sure you're using the right string.

# \[\e[36m\]\u\[\e[m\] \t\ [\w] \`parse_git_branch\` \\$ 
PS1="\[$COLOR_CYAN\]\n\u\[$COLOR_YELLOW\] [\w] "          # basename of pwd
PS1+="\[$COLOR_CYAN\]\[\t \[$COLOR_WHITE\]("        # time stamp
PS1+="\[\$(git_color)\]"        # colors git status
PS1+="\$(git_branch)\[$COLOR_WHITE\]) "           # prints current branch
PS1+="\[$COLOR_CYAN2\]\$\[$COLOR_RESET\] "   # '#' for root, else '$'

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
