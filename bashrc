export PYTHONSTARTUP=~/.pythonrc

alias gs='git status'
alias ls='ls -Gp'
alias grep='grep --color=auto'
#alias dir='dir --color=auto'
alias fgrep='fgrep --color=auto'
bold=$(tput bold)
normal=$(tput sgr0)

function cdl {
	echo "$bold $@": $normal
	cd "$@" && ls
}

alias scomplete='sacct -X --format=JobID%17,JobName%17,MaxRSS,Elapsed,ExitCode,State' 
alias scompletemonth='sacct -S `date --date "last month" +%Y-%m-%d` -o "Submit,JobID%15,JobName,State,ExitCode,Elapsed,CPUTime,MaxRSS"'
alias sq="squeue -u ${USER}  --Format=name,jobid:15,arraytaskid,timeused,timeleft"

source ~/.bash/git-completion.bash

