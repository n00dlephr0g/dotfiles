# p10k setup
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# pipx stuff
[[ -f /home/n00dlephr0g/.dart-cli-completion/zsh-config.zsh ]] && . /home/n00dlephr0g/.dart-cli-completion/zsh-config.zsh || true

# bun completions
[ -s "/home/n00dlephr0g/.bun/_bun" ] && source "/home/n00dlephr0g/.bun/_bun"

# syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# suggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# p10k theme
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# vi mode
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

