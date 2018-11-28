export AISLES_PATH=/Users/ben/projects/phido/aisles
export ADMIN_PATH=/Users/ben/projects/phido/aisles-admin
export ECOMM_PATH=/Users/ben/projects/phido/aisles-ecomm
export PHIDO_API_PATH=/Users/ben/projects/phido/api

alias aws-pf='export AWS_PROFILE=petflow-aws;'
alias aws-phido-qa='unset AWS_REGION; export AWS_PROFILE="phido-aws-qa";'
alias aws-phido='unset AWS_REGION; export AWS_PROFILE="phido-aws-production";'
alias aws-pfs-mobile='export AWS_REGION='us-west-1'; export AWS_PROFILE="phillips-aws";'

aws-phido-qa

# virtualenv
source "/usr/local/bin/virtualenvwrapper.sh"

# because duh
source ~/.bashrc

# Rbenv autocomplete and shims
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Path for RBENV
test -d $HOME/.rbenv/ && PATH="$HOME/.rbenv/bin:$PATH"

# Path for python2
export PATH="/Users/bencostolo/Library/Python/2.7/bin/:$PATH"

# Path for brew
test -d /usr/local/bin && export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"

# Path for Heroku
test -d /usr/local/heroku/ && export PATH="/usr/local/heroku/bin:$PATH"

# Path for composer
export PATH="~/.composer/vendor/bin:$PATH"

# Path for php
export PATH="/usr/local/Cellar/php/7.2.4/bin:$PATH"

# A more colorful prompt
# \[\e[0m\] resets the color to default color
c_reset='\[\e[0m\]'
#  \e[0;31m\ sets the color to red
c_path='\[\e[0;31m\]'
# \e[0;32m\ sets the color to green
c_git_clean='\[\e[0;32m\]'
# \e[0;31m\ sets the color to red
c_git_dirty='\[\e[0;31m\]'

# PS1 is the variable for the prompt you see everytime you hit enter
PROMPT_COMMAND='PS1="${c_path}\W${c_reset}$(git_prompt) :> "'

export PS1='\n\[\033[0;31m\]\W\[\033[0m\]$(git_prompt)\[\033[0m\]:> '

# determines if the git branch you are on is clean or dirty
git_prompt ()
{
  if ! git rev-parse --git-dir > /dev/null 2>&1; then
    return 0
  fi
  # Grab working branch name
  git_branch=$(Git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
  # Clean or dirty branch
  if git diff --quiet 2>/dev/null >&2; then
    git_color="${c_git_clean}"
  else
    git_color=${c_git_dirty}
  fi
  echo " [$git_color$git_branch${c_reset}]"
}

export LSCOLORS=ExGxFxdxCxDxDxaccxaeex
# force ls to use colors (G) and use humanized file sizes (h)
alias ls='ls -Gh'

# force grep to always use the color option and show line numbers
export GREP_OPTIONS='--color=always'

# set sublime as the default editor
# which -s subl && export EDITOR="subl --wait"

#set vim as the default editor
export EDITOR="vim"

# a plethora of aliases
alias e=subl
alias be="bundle exec"
alias simpleserver="python -m SimpleHTTPServer"
alias gap="git add -p"
alias c="git commit -v"
alias r="ruby"
alias sc="rails c --sandbox"
alias s="rails s"
alias gs="git status"
alias k9="kill -9"
alias n="node"
alias copy="pwd | tr -d '\n' | pbcopy"
alias wp="node_modules/.bin/webpack"
alias nukeModules="rm -rf /node_modules && yarn"
alias v="vagrant ssh"
alias push="git push origin HEAD"
alias reload="source ~/.bash_profile"
alias errqa="awslogs get Aisles/error-logs --start='2 hours ago'"
alias dev="git co develop"
alias a="git add -A && git commit -v"
alias ngk="ngrok http 10.0.0.130:80"
alias h="./develop artisan horizon:terminate && echo 'terminated' && ./develop artisan horizon"
alias deploy_stage='ansible-playbook deploy_stage.yml --private-key keys/stage.pem -e'
alias stack='./develop down && ./develop up -d'
alias du='docker-compose up -d'
alias vu='vagrant up && vagrant provision'
alias co='git checkout'
alias br='git branch'
alias st='git status'
alias gp='git pull'
alias merge='git merge'

# find text in cwd
findText() {
  find ./ -not \( -path node_modules -prune \) -not \( -path vendor -prune \) -not \( -path \.git -prune \) -type f  -exec grep -H "$1" {} \;
}

export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# setup git autocompletion
if [ -f "/usr/local/etc/bash_completion" ]; then
  source /usr/local/etc/bash_completion
  __git_complete co _git_checkout
  __git_complete gp _git_pull
  __git_complete br _git_branch
  __git_complete merge _git_merge
else
  echo "Error loading git completions"
fi

#load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

echo "Logged in as $USER at $(hostname)"
export PATH="/usr/local/opt/ansible@1.9/bin:$PATH"

#nvm
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"
