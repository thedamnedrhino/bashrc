# the below configs are form a good theme. Saved so we can find it later
# MNML_USER_CHAR='$'
# MNML_PROMPT=(mnml_ssh 'mnml_cwd 2 0' mnml_git mnml_pyenv mnml_status )
source ~/.zsh_plugins.sh

autoload -Uz compinit && compinit

# BEGIN --------- PROMPT CONFIG from akz92/clean
autoload -Uz vcs_info
autoload -U colors && colors
setopt promptsubst

zstyle ':vcs_info:*' formats '%b'

function virtualenv_info { 
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

precmd() { 
	vcs_info 

	STATUS=$(command git status --porcelain 2> /dev/null | tail -n1)

	if [[ -n $STATUS ]]; then
	 git_branch_prompt='%F{red}$vcs_info_msg_0_%f'
	else
	 git_branch_prompt='%F{green}$vcs_info_msg_0_%f'
	fi

	#RPROMPT="${git_branch_prompt}"
	PROMPT="$(virtualenv_info)%F{blue}%2~%f (${git_branch_prompt})%f %# "
}
## END --------- PROMPT CONFIG
