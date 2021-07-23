#!/bin/bash
gam="/root/bin/gamadv-xtd3/gam"
usr=$@
if [ -z $usr ]; then
echo "./archive <email>"
exit 0
fi
id=$($gam print mobiles query email:$usr | csvcut -c resourceId,firstSync | tail -n +2 | sort -rk2 | head -n 1 | cut -d "," -f 1)
echo
echo ======================
$gam info mobile $id model name firstSync status
echo ======================
echo
echo "Approve?(y/n)"
read a
if [ a == "n" ]; then
exit 0
fi
$gam update mobile $id action approve
