

# Only execute this file once per shell.
if [ -n "$__ETC_ZSHRC_SOURCED" -o -n "$NOSYSZSHRC" ]; then return; fi
__ETC_ZSHRC_SOURCED=1


if [ -f ~/.aliases ]; then
        . ~/.aliases
fi

# Setup command line history.
# Don't export these, otherwise other shells (bash) will try to use same HISTFILE.
SAVEHIST=10000000
HISTSIZE=10000000
HISTFILE=$HOME/.config/zsh/history


# Setup prompt.
autoload -U colors && colors # Enable colors
stty stop undef # Disable ctrl-s to freeze terminal.
unsetopt PROMPT_SP # Disable empty line before first prompt (BlackBox bug?)


echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

unsetopt equals

# Set zsh options.
setopt autocd globdots interactive_comments prompt_subst
# Enable autocompletion.
autoload -U compinit && compinit

# Read system-wide modifications.
if test -f /etc/zshrc.local; then
    . /etc/zshrc.local
fi

# Load plugins
source /usr/share/zsh/site-functions/zsh-autosuggestions.zsh
source /usr/share/zsh/site-functions/zsh-syntax-highlighting.zsh
source /usr/share/zsh/site-functions/zsh-autocomplete/zsh-autocomplete.plugin.zsh
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# Arix's values
alias cd='z'
export PATH="$HOME/.cargo/bin:$PATH"
fastfetch
export OMA_CONFIG=~/.config

# Gentoo functions
accept() {
sudo nano "/etc/portage/package.accept_keywords/$1"
}

use() {
sudo nano "/etc/portage/package.use/$1"
}

merge() {
sudo emerge --ask $1
}
