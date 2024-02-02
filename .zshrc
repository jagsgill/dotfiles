PATH_BREW=/opt/homebrew/bin/brew
if [ -e "$PATH_BREW" ]
then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

eval "$(starship init zsh)"

zsh_autosuggestions_paths=(
    "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" # git clone destination
    "/usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh" # common linux path
    "/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh" # another common linux path
    "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" # homebrew path
)

# Attempt to load zsh-autosuggestions from known paths
for p in "${zsh_autosuggestions_paths[@]}"; do
    if [[ -f $p ]]; then
        source "$p"
        break
    fi
done

PATH_SDKMAN="$HOME/.sdkman"
if [ -e $PATH_SDKMAN ]
then
    #THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
    export SDKMAN_DIR=$PATH_SDKMAN
    [[ -s $PATH_SDKMAN/bin/sdkman-init.sh ]] && source $PATH_SDKMAN/bin/sdkman-init.sh
fi

