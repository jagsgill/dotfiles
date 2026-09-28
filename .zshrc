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

###############################################################
##########         Broadcom Customizations          ###########
###############################################################

source ~/ssp-env.sh
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jg671289/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/jg671289/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jg671289/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/jg671289/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/jg671289/.lmstudio/bin"
# End of LM Studio CLI section

# Cursor CLI
export PATH="$HOME/.local/bin:$PATH"
# End of Cursor CLI

# Go binaries like `kind`
export PATH="$(go env GOPATH)/bin:$PATH"

jwt-decode() {
  jq -R 'split(".") |.[0:2] | map(gsub("-"; "+") | gsub("_"; "/") | gsub("%3D"; "=") | @base64d) | map(fromjson)' <<< $1
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Claude Code - https://bsg-confluence.broadcom.net/spaces/SBU/pages/1101023069/Claude+AI
export CLAUDE_CODE_USE_VERTEX=1
export CLOUD_ML_REGION=global
export ANTHROPIC_VERTEX_PROJECT_ID=dims02-vip-authhub01
  # Since only Opus works on your Vertex deployment, add these to your shell profile (e.g. ~/.zshrc):
  # export ANTHROPIC_DEFAULT_HAIKU_MODEL="claude-opus-4-6"
  # export ANTHROPIC_DEFAULT_SONNET_MODEL="claude-opus-4-6"
  # export CLAUDE_CODE_SUBAGENT_MODEL="claude-opus-4-6"
