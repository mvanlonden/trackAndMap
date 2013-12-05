#!/bin/bash

for i in *.wmv;
  do name=`echo $i | cut -d'.' -f1`;
  echo $name;
  ffmpeg -i $i -ar 22050 -ab 32k -r 25 -vcodec flv -qscale 2 $name.avi;
done