#!/bin/bash

# Terminal customizations: Oh My Zsh, Powerlevel10k, aliases

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

rm -f ~/.zshrc
touch ~/.zshrc

brew install romkatv/powerlevel10k/powerlevel10k
brew tap homebrew/cask-fonts
brew install --cask font-meslo-lg-nerd-font

cat << 'EOF' >> ~/.zshrc
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git)
source $ZSH/oh-my-zsh.sh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ~/.aliases
EOF

cat << 'EOF' > ~/.p10k.zsh
typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time)
EOF

cat << 'EOF' > ~/.aliases
alias gs='git status'
alias gl='git log --oneline'
alias gp='git push'
alias ..='cd ..'
alias desk='cd ~/Desktop'
EOF
