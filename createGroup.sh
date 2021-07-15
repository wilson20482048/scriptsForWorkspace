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

$gam csv $fullPath gam create group ~gr name ~name \
allowexternalmembers off \
spammoderationlevel allow \
whocanadd all_managers_can_add \
whocancontactowner all_in_domain_can_contact \
whocanjoin invited_can_join \
whocanpostmessage anyone_can_post \
whocanviewgroup all_members_can_view \
whocanviewmembership all_in_domain_can_view \
collaborative ~collab \
isarchived ~collab \
memberscanpostasthegroup ~collab \
whoCanAssistContent ALL_MEMBERS \
gal off

$gam csv $fullPath gam create alias ~alias group ~gr
$gam csv $fullPath gam update group ~gr add manager ~mngr
$gam csv $fullPath gam update group ~gr add member ~mmbr
