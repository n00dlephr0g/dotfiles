# p10k setup
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh


# pipx stuff
[[ -f /home/n00dlephr0g/.dart-cli-completion/zsh-config.zsh ]] && source /home/n00dlephr0g/.dart-cli-completion/zsh-config.zsh || true

# bun completions
[ -s "/home/n00dlephr0g/.bun/_bun" ] && source "/home/n00dlephr0g/.bun/_bun"

# syntax highlighting
[[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# suggestions
[[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# p10k theme
[[ -f /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme ]] && source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# vi mode
[[ -f /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh ]] && source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

