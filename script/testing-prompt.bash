PROMPT_COMMAND=__testing_prompt

function __testing_prompt() {
    local exit_code="$?"
    local red='\[\e[0;31m\]'
    local green='\[\e[0;32m\]'
    local reset_colors='\[\e[0m\]'

    if [[ $exit_code == 0 ]]; then
        PS1="$green\$$reset_colors "
    else
        PS1="$red\$$reset_colors "
    fi
}

