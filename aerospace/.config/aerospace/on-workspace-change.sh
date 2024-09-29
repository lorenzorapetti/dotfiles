#!/bin/sh

current_workspace=$(aerospace list-workspaces --focused)

if [ "$current_workspace" = "6" ]; then
	aerospace layout v_tiles
fi
