# Created by Zap installer
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-syntax-highlighting"
plug "zap-zsh/completions"
plug "zsh-zap/vim"

plug "zap-zsh/sudo"
bindkey -M viins '^X^X' sudo-command-line

plug "wintermi/zsh-rust"

plug "zap-zsh/fzf"
plug "Aloxaf/fzf-tab"
plug "Freed-Wu/fzf-tab-source"

plug "hlissner/zsh-autopair"

eval "$(starship init zsh)"

alias nv='nvim'
alias ls='lsd --group-directories-first'
alias ll='lsd -l --group-directories-first'
alias la='lsd -la --group-directories-first'
alias tree='lsd -l --group-directories-first --tree --depth=2'

alias grep='grep --color=auto'
alias cat='bat'

source /home/Garin/.config/broot/launcher/bash/br

# bun completions
[ -s "/home/Garin/.bun/_bun" ] && source "/home/Garin/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
