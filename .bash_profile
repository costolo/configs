# aws profile
export AWS_PROFILE="pfs-staging"
export AWS_REGION="us-east-1"

# $VARIABLE will render before the rest of the command is executed
echo "Logged in as $USER at $(hostname)"

# because duh
source ~/.bashrc

# thefuck alias
eval $(thefuck --alias)

# Rbenv autocomplete and shims
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Path for RBENV
test -d $HOME/.rbenv/ && PATH="$HOME/.rbenv/bin:$PATH"

export PATH="/Users/bencostolo/Library/Python/2.7/bin/:$PATH"

# Path for brew
test -d /usr/local/bin && export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"

# Path for Heroku
test -d /usr/local/heroku/ && export PATH="/usr/local/heroku/bin:$PATH"

# Path for NVM
export PATH="/Users/bencostolo/.nvm/versions/node/v6.10.1/lib:$PATH"

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

# git autocompletion
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
  
  # Add git completion to aliases
  __git_complete g __git_main
  __git_complete pl _git_pull_origin
fi

# a plethora of aliases
alias e=subl
alias be="bundle exec"
alias simpleserver="python -m SimpleHTTPServer"
alias gap="git add -p"
alias gcv="git commit -v"
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
alias pull="git pull origin HEAD"
alias g="git"
alias awsphi-prod='unset AWS_ACCESS_KEY_ID; unset AWS_SECRET_ACCESS_KEY; export AWS_PROFILE="pfs-production";'
alias awsphi-qa='unset AWS_ACCESS_KEY_ID; unset AWS_SECRET_ACCESS_KEY; export AWS_PROFILE="pfs-staging";'
alias reload="source ~/.bash_profile"
alias ac="git add -A && git commit -v"
alias errqa="awslogs get Aisles/error-logs --start='2 hours ago'"
alias dev="git co develop"
alias a="git add -A && git commit -v"
alias ng="ngrok http 10.0.0.130:80"

# useful functions (legacy at this point because tmux handles this well but why not keep it anyway)
function tn {
  printf "\e]1;$1\a"
}

function wn {
  printf "\e]2;$1\a"
}

# find text in cwd
findText() {
  find ./ -not \( -path node_modules -prune \) -not \( -path vendor -prune \) -not \( -path \.git -prune \) -type f  -exec grep -H "$1" {} \;
}

export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

#git autocomplete
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

#load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

awsphi-qa

