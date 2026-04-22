# /etc/zshrc: DO NOT EDIT -- this file has been generated automatically.
# This file is read for interactive shells.
#
# Note that generated /etc/zprofile and /etc/zshrc files do a lot of
# non-standard setup to make zsh usable with no configuration by default.
#
# Which means that unless you explicitly meticulously override everything
# generated, interactions between your ~/.zshrc and these files are likely
# to be rather surprising.
#
# Note however, that you can disable loading of the generated /etc/zprofile
# and /etc/zshrc (you can't disable loading of /etc/zshenv, but it is
# designed to not set anything surprising) by setting `no_global_rcs` option
# in ~/.zshenv:
#
#   echo setopt no_global_rcs >> ~/.zshenv
#
# See "STARTUP/SHUTDOWN FILES" section of zsh(1) for more info.


# Only execute this file once per shell.
if [ -n "$__ETC_ZSHRC_SOURCED" -o -n "$NOSYSZSHRC" ]; then return; fi
__ETC_ZSHRC_SOURCED=1

# Set zsh options.
setopt autocd globdots interactive_comments prompt_subst

if [ -f ~/.aliases ]; then
        . ~/.aliases
fi

# Setup command line history.
# Don't export these, otherwise other shells (bash) will try to use same HISTFILE.
SAVEHIST=10000000
HISTSIZE=10000000
HISTFILE=$HOME/.config/zsh/history

# Enable autocompletion.
autoload -U compinit && compinit

# Setup custom interactive shell init stuff.
# Bind gpg-agent to this TTY if gpg commands are used.
export GPG_TTY=$(tty)

# Setup prompt.
autoload -U colors && colors # Enable colors
HOST="RelicCastle-PC" # Fixup for cloud-init sourced hostname
stty stop undef # Disable ctrl-s to freeze terminal.
unsetopt PROMPT_SP # Disable empty line before first prompt (BlackBox bug?)
zstyle ':completion:*' menu select # select-style completions


echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.


# Disable some features to support TRAMP.
if [ "$TERM" = dumb ]; then
    unsetopt zle prompt_cr prompt_subst
    unset RPS1 RPROMPT
    PS1='$ '
    PROMPT='$ '
fi

# Read system-wide modifications.
if test -f /etc/zshrc.local; then
    . /etc/zshrc.local
fi
# Load plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
alias cd='z'
fastfetch
export OMA_CONFIG=~/.config
