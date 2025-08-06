PATH_BREW_BIN=/opt/homebrew/bin
if [ -d "$PATH_BREW_BIN" ]; then
    export PATH="/opt/homebrew/bin:$PATH"
fi
PATH_BREW=$(which brew)
if [ -e "$PATH_BREW" ]; then
    eval "$(brew shellenv)"
fi

eval "$(starship init zsh)"

zsh_plugins=(
    "zsh-autosuggestions"
    "zsh-autocomplete"
    "zsh-syntax-highlighting"
)

# Attempt to load zsh plugins from known paths
for name in "${zsh_plugins[@]}"; do
    plugin_paths=(
        "$HOME/.zsh/$name/$name.zsh"             # git clone destination
        "/usr/local/share/$name/$name.zsh"       # common linux path
        "/usr/share/$name/$name.zsh"             # another common linux path
    )
    if [ -e "$PATH_BREW" ]; then
        brew_prefix=$(brew --prefix)
        plugin_paths+=("$brew_prefix/share/$name/$name.zsh")
        plugin_paths+=("$brew_prefix/share/$name/$name.plugin.zsh")
    fi

    for pluginpath in "${plugin_paths[@]}"; do
        if [ -e "$pluginpath" ]; then
            # echo "Sourcing zsh plugin $name from $pluginpath"
            source "$pluginpath"
            break
        fi
    done
done

# TODO make it not silently fail e.g. set-java /Library/Java/JavaVirtualMachines/jdk-17.0.10+7-temurin
# Include timestamps in shell prompt
source ~/dotfiles-scripts/java-helpers.sh
