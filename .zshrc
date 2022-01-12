# Use vi line-editing mode.
set -o vi

# Options to enable/disable shell functionality.
MACOS=true
LINUX=false
SDKMAN=true
STARSHIP_PROMPT=true

if $MACOS 
then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if $STARSHIP_PROMPT
then
    eval "$(starship init zsh)"
fi

if $SDKMAN
then
    #THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
    export SDKMAN_DIR="$HOME/.sdkman"
    [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
fi

