#!/usr/bin/env zsh
function venv_chpwd() {
    if [ -r $PWD/venv/bin/activate ]; then
        deactivate > /dev/null 2>&1
        source $PWD/venv/bin/activate
        export PYTHONPATH=".:$PYTHONPATH"
    fi
}
chpwd_functions=(${chpwd_functions[@]} "venv_chpwd")
