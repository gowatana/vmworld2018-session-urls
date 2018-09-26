#!/bin/sh

PDF_LIST=`cat ../vmworld-us-playback-urls.md | grep '\[PDF\]' | sed "s|.*\[PDF\]||g" | sed s/[\(\)]//g`
TOTAL=`echo "$PDF_LIST" | wc -l | xargs`

DL_COUNT=0

echo "$PDF_LIST" | while read L
do
    DL_COUNT=`expr $DL_COUNT + 1`
    echo "File $DL_COUNT/$TOTAL: $L"
    curl -s -O $L
done

