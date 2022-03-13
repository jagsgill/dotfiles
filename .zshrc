PATH_BREW=/opt/homebrew/bin/brew
if [ -e "$PATH_BREW" ]
then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

eval "$(starship init zsh)"

PATH_ZSH_AUTOSUGGEST="$HOME/.zsh/zsh-autosuggestions"
if [ -e $PATH_ZSH_AUTOSUGGEST ]
then
    source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

PATH_SDKMAN="$HOME/.sdkman"
if [ -e $PATH_SDKMAN ]
then
    #THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
    export SDKMAN_DIR=$PATH_SDKMAN
    [[ -s $PATH_SDKMAN/bin/sdkman-init.sh ]] && source $PATH_SDKMAN/bin/sdkman-init.sh
fi

