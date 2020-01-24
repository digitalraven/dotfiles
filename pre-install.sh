#! /bin/bash

echo 'Installing oh-my-zsh'
/bin/sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended
mkdir -p ~/.oh-my-zsh/custom/themes

echo 'Installing zsh-apple-touchbar'
git clone https://github.com/vegerot/zsh-apple-touchbar.git -b autoGenerate $ZSH_CUSTOM/plugins/zsh-apple-touchbar

echo 'Fixing Quicklook plugins'
xattr -d -r com.apple.quarantine ~/Library/Quicklook/*
qlmanage -r

