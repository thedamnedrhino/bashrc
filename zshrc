# the below configs are form a good theme. Saved so we can find it later
# MNML_USER_CHAR='$'
# MNML_PROMPT=(mnml_ssh 'mnml_cwd 2 0' mnml_git mnml_pyenv mnml_status )
source ~/.zsh_plugins.sh
source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh

alias pt='ENABLE_INITIATOR_ID=true DEV=true python -m pytest'
alias mricrogl='/Applications/MRIcroGL.app/Contents/MacOS/MRIcroGL'

autoload -Uz compinit && compinit

# BEGIN --------- PROMPT CONFIG from akz92/clean
autoload -Uz vcs_info
autoload -U colors && colors
setopt promptsubst

zstyle ':vcs_info:*' formats '%b'

alias killdock="defaults write com.apple.Dock appswitcher-all-displays -bool true; killall Dock"

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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/farzadsharifbakhtiar/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/farzadsharifbakhtiar/Downloads/google-cloud-sdk/path.zsh.inc'; fi


# The next line enables shell command completion for gcloud.
if [ -f '/Users/farzadsharifbakhtiar/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/farzadsharifbakhtiar/Downloads/google-cloud-sdk/completion.zsh.inc'; fi



# JINA_CLI_BEGIN

## autocomplete
if [[ ! -o interactive ]]; then
    return
fi

compctl -K _jina jina

_jina() {
  local words completions
  read -cA words

  if [ "${#words}" -eq 2 ]; then
    completions="$(jina commands)"
  else
    completions="$(jina completions ${words[2,-2]})"
  fi

  reply=(${(ps:
:)completions})
}

# session-wise fix
ulimit -n 4096
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# JINA_CLI_END


