#!/bin/bash

case $1 in "")exit 1;;esac

# Fix European time formatting that fucks with parsers *badly*
while read LINE; do

  # Select the timestamps and replace the ',' with another ':' (fucking Europeans)
  T_START="$(echo ${LINE} | tr ';' '\n' | head -1)"
  T_START_FIX="$(echo $T_START | sed 's/,/:/g')"
  T_END="$(echo ${LINE} | tr ';' '\n' | head -2 | tail -1)"
  T_END_FIX="$(echo $T_END | sed 's/,/:/g')"

  # Write changes to file
  sed -i "s/${T_START}/${T_START_FIX}/g" "${1}"
  sed -i "s/${T_END}/${T_END_FIX}/g" "${1}"

done < "${1}"

