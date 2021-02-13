#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx

# Environment Variables
export EDITOR=nvim
export TERM=termite
export TERMINAL=termite
export PATH=$PATH:$HOME/.local/bin
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export ANDROID_PREFS_ROOT="$XDG_CONFIG_HOME"/android
export QT_AUTO_SCREEN_SCALE_FACTOR=0

# XDG Base Directory compliance
export LESSKEY="$XDG_CONFIG_HOME"/less/lesskey
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export PYLINTHOME="$XDG_CACHE_HOME"/pylint
export HISTFILE="$XDG_DATA_HOME"/bash/history
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export STACK_ROOT="$XDG_DATA_HOME"/stack

# Pre window manager
xset r rate 280 40
xrdb -merge ~/.Xresources
setxkbmap -layout fi

exec bspwm

