#!/bin/bash
#set -euo pipefail
#IFS=$'\n\t'

# -----------------------------------------------------------------------------
# Bash helper script used in project generate.sh scripts.
# -----------------------------------------------------------------------------

# Optional arguments: 'driver'.
do_add_arm_cmsis_xpack() {
  local pack_name='arm-cmsis'
  do_tell_xpack "${pack_name}-xpack"

  do_select_pack_folder "ilg/${pack_name}.git"

  # Always add 'core'.
  do_prepare_dest "${pack_name}/core/include"
  do_add_content "${pack_folder}/CMSIS/Include"/*

  while [ $# -ge 1 ]
  do
    case $1 in
    driver)
      do_prepare_dest "${pack_name}/driver/include"
      do_add_content "${pack_folder}/CMSIS/Driver/Include"/*
      ;;
    esac
    shift
  done
}

# -----------------------------------------------------------------------------
