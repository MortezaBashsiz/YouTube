#!/bin/bash  -
#===============================================================================
#
#          FILE: arsenal.sh
#
#         USAGE: ./arsenal.sh
#
#   DESCRIPTION: 
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Morteza Bashsiz (mb), morteza.bashsiz@gmail.com
#  ORGANIZATION: Linux
#       CREATED: 05/19/2023 08:42:59 AM
#      REVISION:  ---
#===============================================================================

set -o nounset                                  # Treat unset variables as an error

envOrg={{ VARIABLE }}

echo "${envOrg}"
