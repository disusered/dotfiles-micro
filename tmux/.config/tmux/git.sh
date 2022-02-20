#!/bin/sh

PANE_PATH=`tmux display-message -p -F "#{pane_current_path}"`
if [ -f "$PANE_PATH/.git/HEAD" ]
then
  echo "#[fg=colour9] #[fg=colour20]`cat $PANE_PATH/.git/HEAD | awk '{print $2}' | awk -F '/' '{print $3}'`"
fi
