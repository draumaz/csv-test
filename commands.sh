FILE="$PWD/oney_doesnt_play.csv"

for LINE in `cat ${FILE} | tr ';' '\n'`; do
  case $LINE in 0*|1*|2*|3*|4*|5*|6*|7*|8*|9*)
    FIXED_LINE=`echo ${LINE} | sed s/,/:/`
    case $LINE in $FIXED_LINE)break;;*)
    echo "line '${LINE}' -> '${FIXED_LINE}'"
    sed -i "s/${LINE}/${FIXED_LINE}/g" ${FILE} ;;esac
  ;; esac
done
