#!/bin/bash

gam=/root/bin/gamadv-xtd3/gam
gyb=/root/bin/gyb/gyb
arch=user.archive

echo "Email address to copy messages from:"
read copyFrom
echo "Target email address:"
read copyTo
echo "Label of restored emails:"
read labelrm

$gam user @arch get drivefile name $copyFrom".tar.gz"
tar -zxvf /root/Downloads/$copyFrom".tar.gz" -C /
$gyb --email $copyTo --local-folder /root/backup/$copyFrom --action restore --service-account --label-restored $labelrm -r /root/backup/$copyFrom /root/Downloads/$copyFrom".tar.gz"
