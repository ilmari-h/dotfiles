# dotfiles

Dotfiles and scripts for my desktop.

<img src="/scrot.png" width="800">

`pull-dotfiles.sh` is a script I use for syncing dotfiles from my home directory with the git repository directory using _rsync_. It's usage is simple:

1. Copy the files from your home directory you want to sync to another directory.
2. Place `pull-dotfiles.sh` script file in this directory.
3. Run the script when you make changes to your actual dotfiles.

This way you only have to copy the files once manually and after that they can be synced by running the script. 
I know you can use bare git repositories and symlinks etc. to do the same thing but I think this is more simple.
