while read LINE; do
  T_START="$(echo ${LINE} | tr ';' '\n' | head -1)"
  T_START_FIX="$(echo $T_START | sed 's/,/:/g')"
  T_END="$(echo ${LINE} | tr ';' '\n' | head -2 | tail -1)"
  T_END_FIX="$(echo $T_END | sed 's/,/:/g')"
  sed -i "s/${T_START}/${T_START_FIX}/g" "${1}"
  sed -i "s/${T_END}/${T_END_FIX}/g" "${1}"
done < "${1}"

