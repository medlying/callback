#!/bin/sh

#Read in template one line at the time, and replace variables (more
#natural (and efficient) way, thanks to Jonathan Leffler).
while read line
do
    eval echo "$line"
done < $1