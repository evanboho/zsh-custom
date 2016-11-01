alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

alias lt="cd ~/Documents/code/lt"
alias ltlt="cd ~/Documents/code/lt/letote"
alias r="rails"

alias gffs="git flow feature start"

alias custom="subl ~/.oh-my-zsh/custom"
alias reload="source ~/.zshrc"

deploy() {
  if [[ "$#" -eq 1 ]]; then
    cap $1 deploy -S $(git_current_branch)
  else
    echo "Wrong number of arguments"
  fi
}

local gllFormat='%Cred%h %Creset[%C(yellow)%an%Creset]- %s %Cgreen(%cr)%Creset'

gll() {
  git log --pretty=format:$gllFormat --abbrev-commit --date=relative $1
}

gllg() {
  git log --graph --pretty=format:$gllFormat --abbrev-commit --date=relative $1
}

gdgr() {
  paths=$(gst | grep modified | grep $1 | sed s/modified:// | xargs)

  if [ ${#paths} -gt 0 ]; then
    eval "gd head -- $paths"
  fi
}

grmbr() {
  branches=$(gb | grep $1)

  for branch in $branches
  do
    git branch -d $branch
  done
}

grbr() {
  git fetch
  git rebase origin/development
}

gbb() {
  git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'
}
