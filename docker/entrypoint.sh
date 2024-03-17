#!/bin/bash

# Navigate to the scripts folder
cd "${GITHUB_WORKSPACE}/${SCRIPTS_FOLDER}"

# Execute the appropriate script based on the action being performed
case "${GITHUB_ACTION}" in
  "check-files")
    ./check_files.sh
    ;;
  "check-ci")
    ./check_ci.sh rebase
    ;;
  "check-header")
    ./check_header.sh
    ;;
  *)
    echo "Unknown action: ${GITHUB_ACTION}"
    exit 1
    ;;
esac