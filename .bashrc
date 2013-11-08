# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# enable vi mode
set -o vi

#source ~/.bashrc.d/ansi-colors.sh
source ${HOME}/.bashrc.d/*

# titlebar setup from:
# http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/x361.html
case $TERM in
    xterm*)
        TITLEBAR='\[\033]0;\u@\h:\w\007\]'
        ;;
    *)
        TITLEBAR=""
        ;;
esac

# Function to assemble the Git parsingart of our prompt.
git_prompt ()
{
    GIT_DIR=`git rev-parse --git-dir 2>/dev/null`
    if [ -z "$GIT_DIR" ]; then
      return 0
    fi
    GIT_HEAD=`cat $GIT_DIR/HEAD`
    GIT_BRANCH=${GIT_HEAD##*/}
    if [ ${#GIT_BRANCH} -eq 40 ]; then
        GIT_BRANCH="(no branch)"
    fi
    STATUS=`git status --porcelain`
    if [ -z "$STATUS" ]; then
        git_color=$LIGHT_GRAY
    else
        echo -e "$STATUS" | grep -q '^.[A-Z\?]'
        if [ $? -eq 0 ]; then
            git_color=$RED
        else
            git_color=$GREEN
        fi
    fi
    echo "${DARK_GRAY}[${git_color}${GIT_BRANCH}${DARK_GRAY}]${NO_COLOR}"
}

# XXX look into this
# https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh

[ -f /etc/DIR_COLORS ] && eval `dircolors -b /etc/DIR_COLORS`
# http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/x279.html
PROMPT_COMMAND='PS1="${TITLEBAR}$(git_prompt) ${LIGHT_BLUE}\w \$ ${NO_COLOR}"'

PATH=${HOME}/.bin:${PATH}
PATH=$HOME/.rvm/bin:$PATH # Add RVM to PATH for scripting

# travis.sh is installed by the travis gem
[[ -f ${HOME}/.travis/travis.sh ]] && source ${HOME}/.travis/travis.sh

# have to manually source bash_completion.sh on gentoo
[[ -f /etc/profile.d/bash_completion.sh ]] && source /etc/profile.d/bash_completion.sh 
