#!/usr/bin/env zsh
function node_bin_chpwd() {
    if [ -r $PWD/node_modules/.bin ]; then
        deactivate &>2 > /dev/null
        source ~/.zsh/node_bin.sh
    fi
}
chpwd_functions=(${chpwd_functions[@]} "node_bin_chpwd")
