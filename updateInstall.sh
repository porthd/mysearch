#!/bin/bash

TIMESTAMP=`date +"%Y%m%d_%H%M%S"`
FILE=mycomposer.json
if [ ! -f "$FILE" ];
then
  echo "There is no file $FILE. You can't make an update without these file. It will override the current file $SOURCE in this update-process.";
  exit 1;
fi
SOURCE=composer.json
SOURCELOCK=composer.lock

echo "Backup of $SOURCE copied into $TIMESTAMP.$SOURCE."
cp $SOURCE $TIMESTAMP.$SOURCE
if [ -f "$SOURCELOCK" ];
then
  echo "Backup of $SOURCELOCK copied into $TIMESTAMP.$SOURCELOCK."
  cp $SOURCELOCK $TIMESTAMP.$SOURCELOCK
fi

echo "Override $SOURCE by $FILE."
cp -f $FILE $SOURCE
