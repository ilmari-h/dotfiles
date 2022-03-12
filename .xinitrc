#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx

# Environment Variables
export TZ='Europe/Helsinki'
export EDITOR=nvim
export TERM=alacritty
export TERMINAL=alacritty
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.local/share/npm/bin
export PATH=$PATH:$HOME/.local/share/cargo/bin
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export ANDROID_PREFS_ROOT="$XDG_CONFIG_HOME"/android
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export _JAVA_AWT_WM_NONREPARENTING=1
export CHIA_ROOT=$HOME/.chia/mainnet
export WEECHAT_HOME=$XDG_CONFIG_HOME/weechat
export CABAL_CONFIG="$XDG_CONFIG_HOME"/cabal/config
export CABAL_DIR="$XDG_CACHE_HOME"/cabal

# Rustup
export RUSTUP_HOME=$HOME/.config/rustupc
. "/home/pazu/.local/share/cargo/env"

# God knows why all three of these are needed
export ANDROID_SDK_ROOT=$HOME/.local/share/androidDEV/Sdk
export ANDROID_SDK_HOME=$HOME/.local/share/androidDEV/Sdk
export ANDROID_HOME=$HOME/.local/share/androidDEV/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# XDG Base Directory compliance
export LESSKEY="$XDG_CONFIG_HOME"/less/lesskey
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export PYLINTHOME="$XDG_CACHE_HOME"/pylint
export HISTFILE="$XDG_DATA_HOME"/bash/history
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export STACK_ROOT="$XDG_DATA_HOME"/stack

# File manager icons
source ~/.config/lf/env

# Pre window manager
xset r rate 280 40
xrdb -merge ~/.Xresources
setxkbmap -layout fi

exec bspwm

