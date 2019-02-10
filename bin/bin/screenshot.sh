#!/bin/bash -
#===============================================================================
#
#          FILE: screenshot.sh
#
#         USAGE: ./screenshot.sh
#
#   DESCRIPTION: 
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Jérôme De Greef (), jdegreef@gmail.com
#  ORGANIZATION: 
#       CREATED: 12/12/2018 04:06:33 PM
#      REVISION:  ---
#===============================================================================

set -o nounset                                  # Treat unset variables as an error

cd /home/jdegreef/Pictures/Screenshots/
exec scrot

