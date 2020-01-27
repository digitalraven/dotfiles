#! /bin/bash

echo 'Installing oh-my-zsh'
/bin/sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended
mkdir -p ~/.oh-my-zsh/custom/themes

echo 'Installing zsh plugins'
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/vegerot/zsh-apple-touchbar.git -b autoGenerate ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-apple-touchbar
git clone https://github.com/digitalraven/omz-homebrew ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/omz-homebrew

echo 'Fixing Quicklook plugins'
xattr -d -r com.apple.quarantine ~/Library/Quicklook/*
qlmanage -r

echo 'Configuring macOS'
# Dock options
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock largesize -float 75
defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock tilesize -float 35
defaults write com.apple.dock showhidden -bool true

# Always use extended save dialogue, damnit.
defaults write NSGLobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGLobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Show all file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show connected servers on desktop
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true

# Hide recent tags
defaults write com.apple.finder ShowRecentTags -bool false

# Prefer list view
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
defaults write com.apple.finder FXPreferredSearchViewStyleVersion -string "Nlsv"

# Allow text selection in quicklook
defaults write com.apple.finder QLEnableTextSelection -bool true

# Disable full stop on double-space
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

echo 'Restarting Finder and Dock'
killall Finder
killall Dock
killall SystemUIServer
