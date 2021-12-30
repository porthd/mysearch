#!/bin/bash

FILE=mycomposer.json
SOURCE=composer.json
if [ -f "$FILE" ];
then
  echo "Sorry, the file $FILE exists already."
else
  echo "The file $SOURCE is copied into $FILE. If you want to mage changes for the rpoject, please change the $FILE.  ";
  echo "The file $SOURCE is copied into $FILE. If you want to mage changes for the rpoject, please change the $FILE.  "
  cp $SOURCE $FILE
fi