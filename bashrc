export GRAHAM=fsharifb@graham.computecanada.ca
export CEDAR=fsharifb@cedar.computecanada.ca
export PYTHONSTARTUP=~/.pythonrc

alias gs='git status'
alias ls='ls -G'
alias grep='grep --color=auto'
#alias dir='dir --color=auto'
alias fgrep='fgrep --color=auto'

alias scomplete='sacct -X --format=JobID%15,JobName,MaxRSS,Elapsed,ExitCode,State' 
alias scompletemonth='sacct -S `date --date "last month" +%Y-%m-%d` -o "Submit,JobID%15,JobName,State,ExitCode,Elapsed,CPUTime,MaxRSS"'

source ~/.bash/git-completion.bash

