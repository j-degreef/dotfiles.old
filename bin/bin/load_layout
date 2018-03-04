#!/bin/bash

# Load i3 layout

# First we append the saved layout of worspace N to workspace M
i3-msg "workspace 1; append_layout ~/.config/i3/workspace-1.json"

# And finally we fill the containers with the programs they had
terminator --name "1" &
terminator --name "2" &
terminator --name "3" &

