#! /bin/bash

# Check if main exists and use instead of master
function git_main_branch() {
  command git rev-parse --git-dir &>/dev/null || return
  local branch
  for branch in main trunk; do
    if command git show-ref -q --verify refs/heads/$branch; then
      echo $branch
      return
    fi
  done
  echo master
}

RED='\033[0;31m'
NC='\033[0m'

branches=$(git branch --merged | grep -vE "^(\+|\*|\s*($(git_main_branch)|staging|development|develop|devel|dev)\s*$)" | awk '{ print $1; }')

if [ "$branches" = "" ]
 then
     echo "Already Clean 🚀"
     exit
fi

echo "====!THESE BRANCHES WILL BE DELETED!===="
echo -e $RED"$branches"

read -p "$(echo -e "$NC""Are you sure? [yes/no] ")" confirm
if [ "$confirm" = "yes" ]
 then
     echo "$(git branch -d $branches)"
     echo "Cleaned 🚀"
 else
     echo "Canceled 🙏"
fi