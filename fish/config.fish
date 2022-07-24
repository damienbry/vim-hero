alias v="nvim"
alias g="git"
alias k="kubectl"
alias timeout="gtimeout"
alias rg="rg -i"
alias y="yarn"
alias r="rails"
alias gn="fg; growlnotify -m 'ended'; say your long task just finished"
alias staging_commits="git log `git merge-base origin/staging master`..origin/staging"
alias clean_branches="git fetch -p && git branch -vv | awk '/: gone]/{print $1}' | xargs git branch -D"
alias pgcomment=~/Dev/pgcomment/out/osx-x64/pgcomment
alias rt="bundle exec rspec"
alias ctags="`brew --prefix`/bin/ctags" # otherwise illegal option 'R' on mac (https://gist.github.com/nazgob/1570678)

rvm default
