# Setup
Install zsh from brew (macOS) or the system package manager (Linux).

Install [Oh My Posh](https://ohmyposh.dev/) prompt. Install and enable a Nerd Font in your terminal.
On WSL, install the Windows-compatible font files to Windows Fonts. Then in Windows Terminal settings add the fontFace to the profiles.defaults object. e.g `"fontFace": "JetBrainsMono NF"`.
Set the terminal's font to the installed Nerd Font.

Install [Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim). Make sure `nvim` is on the `PATH`.

In your home directory, run 
```
git init 
git remote add origin git@github.com:jagsgill/dotfiles.git
git pull --set-upstream origin master
```

Run `source .zshrc` or open a new terminal.

