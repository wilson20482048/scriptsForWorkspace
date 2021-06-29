#!/bin/bash

gam=/root/bin/gamadv-xtd3/gam
rm /root/tmp/new.csv > /dev/null 2>&1 &
targetFolder=/root/tmp/
file=new
fullPath=$targetFolder$file".csv"

$gam user michal.wilas get drivefile 1ISDBT9K7SNBeSyUvFBiazKKm1SOEzHUslQXhqMR6yis csvsheet .create targetfolder $tar$
iu=$(wc -l $fullPath | cut -d " " -f 1)
echo "$iu groups to create, (c)ontinue or (b)reak?"
read odp


if [ $odp == "b" ]; then
exit 1
fi

$gam csv $fullPath gam create group ~gr name ~name allowexternalmembers off spammoderationlevel allow whocanadd all_$$gam csv $fullPath gam create alias ~alias group ~gr gal off
$gam csv $fullPath gam update group ~gr add manager ~mngr
$gam csv $fullPath gam update group ~gr add member ~mmbr
