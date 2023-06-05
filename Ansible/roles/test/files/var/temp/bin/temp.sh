#!/bin/bash  -
#===============================================================================
#
#          FILE: temp.sh
#
#         USAGE: ./temp.sh
#
#   DESCRIPTION: 
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Morteza Bashsiz (mb), morteza.bashsiz@gmail.com
#  ORGANIZATION: Linux
#       CREATED: 05/17/2023 12:19:35 PM
#      REVISION:  ---
#===============================================================================

set -o nounset                                  # Treat unset variables as an error

testVAR=$(cat /var/temp/conf/temp.conf)

echo "RESULT ${testVAR}"
