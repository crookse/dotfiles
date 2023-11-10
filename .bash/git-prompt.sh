#!/bin/bash

# Insert Git branch into prompt

##
# Parse the Git branch name if it exists. That is, we're in a Git directory.
#
__crookse_parse_git_branch() {
  if [[ "${1}" == "clean-no-branch-category" ]]; then
    command git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/' -e 's/.*\///'
    return
  fi
  if [[ "${1}" == "clean" ]]; then
    command git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
    return
  fi
  command git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

##
# Check if the current directory is a Git repository
#
__crookse_check_if_git() {
  if [[ $(__crookse_parse_git_branch) ]]; then
    local branch=$(__crookse_parse_git_branch)
    # 45, 232 (black on light blue)
    # 166 orange
    tput setaf 166
    echo -en "\ngit: ${branch} ($(git config user.name) / $(git config user.email))"
    tput sgr0
  fi
}
