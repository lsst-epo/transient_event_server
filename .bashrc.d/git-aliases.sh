# to get a listing of commonly used git commands
# history | tr -s " " | cut -d" " -f3- | grep ^git | sort -u
alias ga="git add"
alias gba="git branch --all"
alias gc="git commit"
alias gca="git commit --amend"
alias gd="git diff"
alias gdc="git diff --cached"
alias gds="git diff --stat"
alias gfa="git fetch --all"
alias gl="git log"
# gp would probably be too easily confused between push and pull; rely on bash
# git completion for these
alias grv="git remote --verbose"
# conflicts with ghostscript's "gs"
alias gs="git status"
alias gt="git tag -n1"
alias gw="git diff-tree --check $(git hash-object -t tree /dev/null) HEAD"
