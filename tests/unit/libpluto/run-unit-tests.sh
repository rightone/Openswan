#!/bin/sh

for f in $(make testlist)
do
    (cd $f; banner $f
     while ! make check;
     do
         make update && git add -p .
     done
    )
done
