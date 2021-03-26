#!/bin/sh

# Everything but git-related. Exclude folders to only get explicit files.
find ./ -type f ! -path '*/.git*' -print0  \
  | rsync --exclude './' --files-from=- --from0 $HOME ./
