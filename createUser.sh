#!/bin/bash

gam="/root/bin/gamadv-xtd3/gam"
usr="michal.wilas"
fp="/root/tmp/"
fn="new"
gfp=$fp$fn".csv"

rm $gfp > /dev/null 2>&1

$gam user $usr get drivefile 1pdG-0Ja-XwiTC9B3-BiJKkmi47hRY1UaV30BpNQoHWM csvsheet .create targetfolder $fp targetna$
echo "" >> $gfp

iu=$(wc -l $gfp | cut -d " " -f 1)
let iu=iu-1
echo "$iu users to create, (c)ontinue or (b)reak?"
read odp

if [ $odp == "b" ]; then
exit 1
fi

echo -e "0 - No license\n1 - Basic\n2 - Business"
read g

        if [ $g -eq 1 ]; then
                o="/TECH/LIC/Basic"
        elif [ $g -eq 2 ]; then
                o="/TECH/LIC/Business"
        else
                o="/"
        fi

$gam csv $gfp gam create user ~usr firstname ~fname lastname ~lname org $o organization name ~org primary password ~$
echo -n "Waiting 10 sec"

for i in {1..10}
do
sleep 1
echo -n "."
done

echo ""


$gam csv $gfp gam update user ~usr org ~ou
