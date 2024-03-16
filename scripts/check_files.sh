#!/usr/bin/env sh

###
#
#  @file check_files.yml
#  @copyright 2023-2024 SaruMC. All rights reserved.
#
#  @version 1.2.3
#  @author SaruMC
#  @date 2024-03-15
#
###

if [ -f ./.gitignore ]; then
    echo 'File exists.'
    exit 0
else
    echo 'File does not exist.'
    exit 1
fi