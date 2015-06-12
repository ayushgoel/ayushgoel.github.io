#!/usr/bin/env bash

print_help () {
    echo "Usage: ./publish.sh <path-to-post-file> <title-of-post>"
}

path=$1
title=$2

if [ ! -f $path ]; then
    print_help
    exit
fi

filename=`python lib/create-post/filename.py --title $title`
cp $path _posts/$filename
git add _posts
git commit -m "Add posts $filename"
git push
