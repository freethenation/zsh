#!/usr/bin/env zsh
function venv_chpwd() {
    if [ -r $PWD/venv/bin/activate ]; then
        source $PWD/venv/bin/activate
    fi
}
chpwd_functions=(${chpwd_functions[@]} "venv_chpwd")
