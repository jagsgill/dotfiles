if [ -e /opt/homebrew/bin/brew ]
then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

eval "$(starship init zsh)"

PATH_SDKMAN="$HOME/.sdkman"
if [ -e $PATH_SDKMAN ]
then
    #THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
    export SDKMAN_DIR=$PATH_SDKMAN
    [[ -s $PATH_SDKMAN/bin/sdkman-init.sh ]] && source $PATH_SDKMAN/bin/sdkman-init.sh
fi

